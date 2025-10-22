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
		world.log << "RuneChat: Creating message for [owner]: [message]"
		create_text_object()

	proc/create_text_object()
		if(!owner || !owner.loc)
			world.log << "RuneChat: Failed - no owner or location"
			return

		text_object = new /atom/movable
		text_object.name = "runechat"
		text_object.layer = 20 // Higher layer to ensure visibility
		text_object.plane = 0
		text_object.appearance_flags = APPEARANCE_UI_IGNORE_ALPHA | KEEP_TOGETHER
		text_object.mouse_opacity = 0
		text_object.screen_loc = "CENTER-1, TOP-2" // Try screen location first

		// Create the visual representation
		text_object.icon = 'icons/effects/effects.dmi'
		text_object.icon_state = "nothing"
		text_object.maptext = "<span style='color: [color]; font-family: Arial, sans-serif; font-size: 16px; font-weight: bold; text-shadow: 1px 1px 2px black;'>[message]</span>"

		// Try multiple approaches to make it visible
		if(usr && usr.client)
			usr.client.screen += text_object
			world.log << "RuneChat: Added to client screen"
		else if(owner)
			owner.vis_contents += text_object
			world.log << "RuneChat: Added to owner vis_contents"
		else
			// Try placing it on the turf
			var/turf/T = get_turf(owner)
			if(T)
				text_object.loc = T
				world.log << "RuneChat: Placed on turf"

	proc/tick()
		if(!owner || !owner.loc || !text_object)
			return FALSE

		// Check lifetime
		if(world.time - time_created > lifetime * 0.1)
			return FALSE

		// Fade out effect in last second
		var/time_left = lifetime - (world.time - time_created) * 10
		if(time_left <= 10)
			var/alpha = (time_left / 10) * 255
			text_object.alpha = alpha

		return TRUE

	proc/remove()
		if(text_object)
			if(usr && usr.client)
				usr.client.screen -= text_object
			if(owner)
				owner.vis_contents -= text_object
			qdel(text_object)
		text_object = null

// Main proc to create floating text
/proc/runechat_create(mob/speaker, message, speech_type = "say")
	world.log << "RuneChat: runechat_create called with [speaker], [message], [speech_type]"

	if(!speaker || !message || !runechat_enabled)
		world.log << "RuneChat: Failed - speaker=[speaker], message=[message], enabled=[runechat_enabled]"
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
	world.log << "RuneChat: Message created and added to list. Total messages: [runechat_messages.len]"

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

	world.log << "RuneChat: Test command called by [usr]"

	// Test different approaches
	to_chat(usr, "Testing RuneChat...")

	// Create a simple test message
	runechat_create(mob, "TEST MESSAGE", "say")

	// Try creating a visible object directly
	var/atom/movable/test_obj = new /atom/movable
	test_obj.name = "test"
	test_obj.layer = 100
	test_obj.icon = 'icons/effects/effects.dmi'
	test_obj.icon_state = "nothing"
	test_obj.maptext = "<span style='color: red; font-size: 20px; font-weight: bold;'>DIRECT TEST</span>"
	test_obj.screen_loc = "CENTER, CENTER"
	usr.client.screen += test_obj

	to_chat(usr, "Test complete - check for red text in center of screen")

/client/verb/clear_runechat()
	set name = "Clear RuneChat"
	set category = "Debug"
	if(!holder)
		return

	for(var/datum/runechat_message/msg in runechat_messages)
		msg.remove()
	runechat_messages.Cut()

	// Clear all screen objects
	for(var/atom/movable/A in usr.client.screen)
		if(A.name == "runechat" || A.name == "test")
			usr.client.screen -= A

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
	world.log << "RuneChat: System initializing..."
	// Start the processing loop
	spawn(1)
		while(1)
			runechat_process()
			sleep(0.1) // Process every 0.1 seconds
	world.log << "RuneChat: System initialized"
