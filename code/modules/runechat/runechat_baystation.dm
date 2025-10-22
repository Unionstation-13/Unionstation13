
// Baystation RuneChat System - Complete implementation from scratch
// Path: code/modules/runechat/runechat_baystation.dm

// Global runechat controller
var/global/datum/runechat_controller/runechat_controller

// Runechat controller datum - completely self-contained
/datum/runechat_controller
	var/list/active_messages = list()
	var/max_messages_per_mob = 5
	var/default_duration = 40 // 4 seconds at 10fps
	var/fade_duration = 10 // 1 second fade
	var/max_distance = 7 // Maximum distance to see runechat

/datum/runechat_controller/New()
	..()
	processing_objects += src

/datum/runechat_controller/Destroy()
	processing_objects -= src
	return ..()

/datum/runechat_controller/proc/create_message(mob/speaker, message, message_type = "say", color_override = null)
	if(!speaker || !message)
		return null

	// Check if speaker has too many messages already
	var/list/speaker_messages = active_messages[speaker]
	if(speaker_messages && speaker_messages.len >= max_messages_per_mob)
		return null

	// Create the message
	var/datum/runechat_message/new_message = new/datum/runechat_message(speaker, message, message_type, color_override)

	// Add to active messages
	if(!active_messages[speaker])
		active_messages[speaker] = list()
	active_messages[speaker] += new_message

	// Position the message
	position_message(new_message)

	return new_message

/datum/runechat_controller/proc/position_message(datum/runechat_message/message)
	if(!message || !message.speaker)
		return

	var/mob/speaker = message.speaker

	// Calculate position above the speaker's head
	var/turf/speaker_turf = get_turf(speaker)
	if(!speaker_turf)
		return

	// Base position is above the speaker
	var/base_x = speaker_turf.x
	var/base_y = speaker_turf.y
	var/base_z = speaker_turf.z

	// Calculate vertical offset based on existing messages
	var/list/speaker_messages = active_messages[speaker]
	var/vertical_offset = 0

	if(speaker_messages)
		for(var/datum/runechat_message/other_message in speaker_messages)
			if(other_message != message && other_message.active)
				vertical_offset += other_message.height + 2

	// Set the message position
	message.world_x = base_x
	message.world_y = base_y
	message.world_z = base_z
	message.pixel_x = 0
	message.pixel_y = 32 + vertical_offset // 32 pixels above base, plus offset for other messages
	message.layer = speaker.layer + 0.1

/datum/runechat_controller/proc/remove_message(datum/runechat_message/message)
	if(!message)
		return

	if(active_messages[message.speaker])
		active_messages[message.speaker] -= message
		if(!active_messages[message.speaker].len)
			active_messages.Remove(message.speaker)

	message.active = FALSE
	qdel(message)

/datum/runechat_controller/process()
	// Update all active messages
	for(var/mob/speaker in active_messages)
		var/list/speaker_messages = active_messages[speaker]
		if(!speaker_messages)
			continue

		for(var/datum/runechat_message/message in speaker_messages)
			if(message.active)
				message.update()
				if(message.should_remove())
					remove_message(message)
			else
				speaker_messages -= message

		// Reposition remaining messages
		if(speaker_messages.len)
			var/vertical_offset = 0
			for(var/datum/runechat_message/message in speaker_messages)
				if(message.active)
					message.pixel_y = 32 + vertical_offset
					vertical_offset += message.height + 2

// Runechat message datum
/datum/runechat_message
	var/mob/speaker
	var/message_text
	var/message_type
	var/color
	var/world_x
	var/world_y
	var/world_z
	var/pixel_x = 0
	var/pixel_y = 32
	var/layer = 0
	var/created_time
	var/duration
	var/fade_time
	var/height = 12
	var/width = 100
	var/active = TRUE
	var/obj/effect/overlay/runechat/display_object

/datum/runechat_message/New(mob/speaker, message_text, message_type, color_override)
	..()

	src.speaker = speaker
	src.message_text = message_text
	src.message_type = message_type
	src.created_time = world.time
	src.duration = runechat_controller.default_duration
	src.fade_time = runechat_controller.fade_time

	// Set color based on message type
	if(color_override)
		src.color = color_override
	else
		src.color = get_message_color()

	// Create the display object
	create_display_object()

/datum/runechat_message/Destroy()
	if(display_object)
		qdel(display_object)
	return ..()

/datum/runechat_message/proc/get_message_color()
	switch(message_type)
		if("say")
			return "#ffffff" // White
		if("whisper")
			return "#add8e6" // Light blue
		if("emote")
			return "#90ee90" // Light green
		if("me")
			return "#ffb6c1" // Light pink
		if("ooc")
			return "#ffa500" // Orange
		if("admin")
			return "#ff0000" // Red
		if("radio")
			return "#00ffff" // Cyan
		else
			return "#ffffff" // Default white

/datum/runechat_message/proc/create_display_object()
	if(!speaker)
		return

	display_object = new/obj/effect/overlay/runechat()
	display_object.message = src
	display_object.loc = get_turf(speaker)
	display_object.pixel_x = pixel_x
	display_object.pixel_y = pixel_y
	display_object.layer = layer

/datum/runechat_message/proc/update()
	if(!display_object || !active)
		return

	// Update position if speaker moved
	var/turf/speaker_turf = get_turf(speaker)
	if(speaker_turf && (display_object.loc != speaker_turf))
		display_object.loc = speaker_turf

	// Update appearance
	display_object.update_appearance()

/datum/runechat_message/proc/should_remove()
	return (world.time - created_time) > (duration + fade_time)

/datum/runechat_message/proc/get_alpha()
	var/elapsed = world.time - created_time
	if(elapsed < duration)
		return 255 // Fully visible
	else if(elapsed < duration + fade_time)
		// Fade out
		var/fade_progress = (elapsed - duration) / fade_time
		return max(0, 255 * (1 - fade_progress))
	else
		return 0 // Invisible

// Runechat display object using overlay
/obj/effect/overlay/runechat
	name = "runechat"
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	icon = 'icons/effects/effects.dmi'
	icon_state = "nothing"
	layer = FLOAT_LAYER
	plane = GAME_PLANE
	var/datum/runechat_message/message
	var/maptext_width = 200
	var/maptext_height = 20

/obj/effect/overlay/runechat/Initialize()
	. = ..()
	update_maptext()

/obj/effect/overlay/runechat/Destroy()
	if(message)
		message.display_object = null
	return ..()

/obj/effect/overlay/runechat/update_appearance()
	. = ..()
	update_maptext()

/obj/effect/overlay/runechat/proc/update_maptext()
	if(!message || !message.message_text)
		return

	// Create the maptext with proper formatting
	var/text_color = message.color
	var/font_size = 12
	var/font_family = "Verdana, Arial, sans-serif"

	// Clean the message text
	var/clean_text = sanitize(message.message_text)

	// Create the maptext
	var/maptext_style = {"<span style="color:[text_color]; font-size:[font_size]px; font-family:[font_family]; text-align: center; display: block; text-shadow: 1px 1px 2px black;">[clean_text]</span>"}

	maptext = maptext_style
	maptext_width = message.width
	maptext_height = message.height
	alpha = message.get_alpha()

// Helper proc to sanitize text
/proc/sanitize(text)
	if(!text)
		return ""

	// Basic HTML sanitization
	text = replacetext(text, "<", "&lt;")
	text = replacetext(text, ">", "&gt;")
	text = replacetext(text, "\"", "&quot;")
	text = replacetext(text, "'", "&#39;")

	// Limit length
	if(length(text) > 50)
		text = copytext(text, 1, 47) + "..."

	return text

// Hook into Baystation's speech system
/mob/living/verb/say_verb(message as text)
	set name = "Say"
	set category = "IC"

	if(!message)
		return

	if(stat)
		return

	if(src.silent)
		to_chat(src, "You can't speak!")
		return

	// Create runechat message
	if(runechat_controller)
		runechat_controller.create_message(src, message, "say")

	// Continue with normal say processing
	say(message)

// Hook into emotes
/mob/living/verb/me_verb(message as text)
	set name = "Me"
	set category = "IC"

	if(!message)
		return

	if(stat)
		return

	// Create runechat message
	if(runechat_controller)
		runechat_controller.create_message(src, message, "me")

	// Continue with normal me processing
	me(message)

// Hook into whispers
/mob/living/verb/whisper_verb(message as text)
	set name = "Whisper"
	set category = "IC"

	if(!message)
		return

	if(stat)
		return

	// Create runechat message
	if(runechat_controller)
		runechat_controller.create_message(src, message, "whisper")

	// Continue with normal whisper processing
	whisper(message)

// Alternative hooking method - override the actual speech procs
/mob/living/say(message, bubble_type = null, list/spans = null, sanitize = TRUE, datum/language/language = null, ignore_spam = FALSE, filterproof = FALSE)
	// Create runechat message before processing
	if(runechat_controller && message)
		runechat_controller.create_message(src, message, "say")

	// Call the original say proc
	..(message, bubble_type, spans, sanitize, language, ignore_spam, filterproof)

/mob/living/me(message, bubble_type = null, intentional = FALSE)
	// Create runechat message before processing
	if(runechat_controller && message)
		runechat_controller.create_message(src, message, "me")

	// Call the original me proc
	..(message, bubble_type, intentional)

/mob/living/whisper(message, bubble_type = null, datum/language/language = null)
	// Create runechat message before processing
	if(runechat_controller && message)
		runechat_controller.create_message(src, message, "whisper")

	// Call the original whisper proc
	..(message, bubble_type, language)

// Initialize runechat system on world start
/world/New()
	..()
	runechat_controller = new/datum/runechat_controller()

// Admin commands for testing
/client/verb/test_runechat()
	set name = "Test RuneChat"
	set category = "Debug"

	if(!runechat_controller)
		to_chat(usr, "RuneChat controller not initialized!")
		return

	if(!mob)
		return

	runechat_controller.create_message(mob, "This is a test message!", "say")
	runechat_controller.create_message(mob, "This is a test emote!", "me")
	runechat_controller.create_message(mob, "This is a test whisper!", "whisper")

	to_chat(usr, "RuneChat test messages created!")

/client/verb/clear_runechat()
	set name = "Clear RuneChat"
	set category = "Debug"

	if(!runechat_controller)
		to_chat(usr, "RuneChat controller not initialized!")
		return

	for(var/mob/speaker in runechat_controller.active_messages)
		var/list/speaker_messages = runechat_controller.active_messages[speaker]
		if(speaker_messages)
			for(var/datum/runechat_message/message in speaker_messages)
				runechat_controller.remove_message(message)

	to_chat(usr, "All RuneChat messages cleared!")
