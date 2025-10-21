// Core phone calling system
var/global/list/phone_network = list() // All active phones
var/global/list/active_calls = list()  // All active calls

// Call status constants
#define CALL_RINGING "ringing"
#define CALL_ACTIVE "active"
#define CALL_ENDED "ended"

/datum/phone_call
	var/caller_id          // Who initiated
	var/receiver_id        // Who receives
	var/start_time         // When call started
	var/status             // CALL_RINGING, CALL_ACTIVE, CALL_ENDED
	var/list/participants = list() // Everyone in call
	var/channel_id         // Audio channel for this call

/datum/phone_call/New(caller, receiver)
	caller_id = caller
	receiver_id = receiver
	start_time = world.time
	status = CALL_RINGING
	participants += caller
	channel_id = rand(1000, 9999) // Unique audio channel

/datum/phone_call/proc/accept_call(mob/user)
	if(user.ckey == receiver_id)
		status = CALL_ACTIVE
		participants += user
		setup_audio_channel()
		notify_participants("Call connected")

/datum/phone_call/proc/decline_call(mob/user)
	if(user.ckey == receiver_id)
		end_call("Call declined")

/datum/phone_call/proc/end_call(reason)
	status = CALL_ENDED
	cleanup_audio_channel()
	notify_participants(reason)
	active_calls.Remove(src)

/datum/phone_call/proc/setup_audio_channel()
	for(var/participant_ckey in participants)
		var/mob/participant = get_mob_by_ckey(participant_ckey)
		if(participant)
			// Add participant to audio channel
			participant.add_audio_channel(channel_id)

			// Set up voice transmission
			participant.voice_channel = channel_id
			participant.can_hear = participants.Copy()

/datum/phone_call/proc/cleanup_audio_channel()
	for(var/participant_ckey in participants)
		var/mob/participant = get_mob_by_ckey(participant_ckey)
		if(participant)
			participant.remove_audio_channel(channel_id)
			participant.voice_channel = null

/datum/phone_call/proc/notify_participants(message)
	for(var/participant_ckey in participants)
		var/mob/participant = get_mob_by_ckey(participant_ckey)
		if(participant)
			to_chat(participant, SPAN_NOTICE("[message]"))

// Helper proc to find mob by ckey
/proc/get_mob_by_ckey(ckey)
	for(var/mob/M in GLOB.player_list)
		if(M.ckey == ckey)
			return M
	return null
