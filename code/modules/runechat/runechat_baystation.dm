// Global configuration
var/global/list/runechat_messages = list() // List of active floating messages
var/global/runechat_enabled = TRUE  // Master switch

// RuneChat message datum
/datum/runechat_message
	var/mob/owner
	var/message
	var/color
	var/atom/movable/text_object
	var/time_created
	var/lifetime = 40 // 4 seconds at 0.1 second intervals

	New(mob/owner, message, color)
		src.owner = owner
		src.message = message
		src.color = color
		src.time_created = world.time
		create_text_object()

	proc/create_text_object()
		if(!owner || !owner.loc)
			return

		text_object = new /atom/movable
		text_object.name = "runechat"
		text_object.layer = 5 // Use numeric layer instead of FLY_LAYER
		text_object.plane = 0 // Use numeric plane instead of GAME_PLANE
		text_object.appearance_flags = APPEARANCE_UI_IGNORE_ALPHA | KEEP_TOGETHER
		text_object.mouse_opacity = 0

		// Create the visual representation
		text_object.icon = 'icons/effects/effects.dmi'
		text_object.icon_state = "nothing"
		text_object.maptext = "<span style='color: [color]; font-family: Arial, sans-serif; font-size: 14px; text-shadow: 1px 1px 2px black;'>[message]</span>"

		// Position the text above the mob
		update_position()

		// Add to the mob's vis_contents
		owner.vis_contents += text_object

	proc/update_position()
		if(!owner || !text_object || !owner.loc)
			return

		// Position the text above the mob's head
		var/offset = 32 // Base height above mob

		// Check for other messages from this mob and stack them
		for(var/datum/runechat_message/other in runechat_messages)
			if(other.owner == owner && other != src && other.text_object)
				offset += 20 // Stack messages vertically

		text_object.pixel_y = offset

	proc/tick()
		if(!owner || !owner.loc || !text_object)
			return FALSE

		// Check lifetime
		if(world.time - time_created > lifetime * 0.1)
			return FALSE

		// Update position in case mob moved
		update_position()

		// Fade out effect in last second
		var/time_left = lifetime - (world.time - time_created) * 10
		if(time_left <= 10)
			var/alpha = (time_left / 10) * 255
			text_object.alpha = alpha

		return TRUE

	proc/remove()
		if(text_object && owner)
			owner.vis_contents -= text_object
			qdel(text_object)
		text_object = null

// Main proc to create floating text - this is what you call from other code
/proc/runechat_create(mob/speaker, message, speech_type = "say")
	if(!speaker || !message || !runechat_enabled)
		return

	var/color = "#FFFFFF" // Default white for say
	switch(speech_type)
		if("me")
			color = "#FFB6C1" // Light pink for emotes
		if("whisper")
			color = "#87CEEB" // Sky blue for whispers
		if("radio")
			color = "#90EE90" // Light green for radio
		if("ooc")
			color = "#FFD700" // Gold for OOC

	// Create new message
	var/datum/runechat_message/new_message = new(speaker, html_encode(message), color)
	runechat_messages += new_message

// Process RuneChat messages
/proc/runechat_process()
	for(var/datum/runechat_message/msg in runechat_messages)
		if(!msg.tick())
			msg.remove()
			runechat_messages -= msg

// Admin commands
/client/verb/test_runechat()
	set name = "Test RuneChat"
	set category = "Debug"
	if(!holder)
		return

	if(!mob)
		return

	runechat_create(mob, "This is a test message!", "say")
	runechat_create(mob, "*waves happily*", "me")
	runechat_create(mob, "This is a whisper...", "whisper")
	runechat_create(mob, "Request: Medical to robotics!", "radio")
	to_chat(usr, "RuneChat test messages created above your head.")

/client/verb/clear_runechat()
	set name = "Clear RuneChat"
	set category = "Debug"
	if(!holder)
		return

	for(var/datum/runechat_message/msg in runechat_messages)
		msg.remove()
	runechat_messages.Cut()
	to_chat(usr, "All RuneChat messages cleared.")

/client/verb/toggle_runechat()
	set name = "Toggle RuneChat"
	set category = "Debug"
	if(!holder)
		return

	runechat_enabled = !runechat_enabled
	to_chat(usr, "RuneChat is now [runechat_enabled ? "ENABLED" : "DISABLED"].")

// Initialize the system
/world/New()
	..()
	// Start the processing loop
	spawn(1)
		while(1)
			runechat_process()
			sleep(0.1) // Process every 0.1 seconds
