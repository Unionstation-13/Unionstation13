// PDA Phone App
/datum/computer_file/program/phone
	filename = "phone"
	filedesc = "Phone App"
	extended_desc = "Make and receive audio calls."
	size = 3
	available_on_ntnet = 1
	requires_ntnet = 1

	var/datum/phone_call/current_call = null
	var/list/contacts = list()
	var/list/call_history = list()
	var/is_ringing = FALSE

/datum/computer_file/program/phone/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, datum/topic_state/state = GLOB.default_state)
	var/data[0]
	data["current_call"] = get_call_data()
	data["contacts"] = get_contacts()
	data["call_history"] = call_history
	data["is_ringing"] = is_ringing

	ui = GLOB.nanomanager.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "phone.tmpl", "Phone", 400, 600, state = state)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/datum/computer_file/program/phone/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["action"])
		switch(href_list["action"])
			if("make_call")
				var/target_id = href_list["target"]
				if(target_id)
					make_call(target_id)
			if("accept_call")
				accept_call()
			if("decline_call")
				decline_call()
			if("end_call")
				end_call()
		return 1

/datum/computer_file/program/phone/proc/make_call(target_id)
	if(current_call)
		to_chat(usr, SPAN_WARNING("Already in a call!"))
		return

	var/datum/phone_call/new_call = new(usr.ckey, target_id)
	current_call = new_call
	active_calls += new_call

	// Notify target
	var/mob/target = get_mob_by_ckey(target_id)
	if(target && target.get_pda())
		var/obj/item/modular_computer/pda/target_pda = target.get_pda()
		target_pda.receive_phone_call(new_call)

		// Play ringtone
		playsound(target_pda, 'sound/machines/phone_ring.ogg', 50, 1)

/datum/computer_file/program/phone/proc/accept_call()
	if(current_call && current_call.status == CALL_RINGING)
		current_call.accept_call(usr)
		is_ringing = FALSE

/datum/computer_file/program/phone/proc/decline_call()
	if(current_call && current_call.status == CALL_RINGING)
		current_call.decline_call(usr)
		current_call = null
		is_ringing = FALSE

/datum/computer_file/program/phone/proc/end_call()
	if(current_call)
		current_call.end_call("Call ended")
		current_call = null
		is_ringing = FALSE

/datum/computer_file/program/phone/proc/get_call_data()
	if(!current_call)
		return null

	var/list/call_data = list()
	call_data["status"] = current_call.status
	call_data["duration"] = get_call_duration()
	call_data["participant_name"] = get_participant_name()
	return call_data

/datum/computer_file/program/phone/proc/get_call_duration()
	if(!current_call)
		return "0:00"

	var/seconds = (world.time - current_call.start_time) / 10
	var/minutes = floor(seconds / 60)
	seconds = seconds % 60
	return "[minutes]:[num2text(seconds, 2)]"

/datum/computer_file/program/phone/proc/get_participant_name()
	if(!current_call)
		return ""

	var/target_ckey = current_call.receiver_id
	if(usr.ckey == current_call.caller_id)
		target_ckey = current_call.receiver_id
	else
		target_ckey = current_call.caller_id

	var/mob/target = get_mob_by_ckey(target_ckey)
	if(target)
		return target.name
	return "Unknown"

/datum/computer_file/program/phone/proc/get_contacts()
	var/list/contact_list = list()
	for(var/mob/M in GLOB.player_list)
		if(M != usr && M.get_pda())
			contact_list += list(list("name" = M.name, "ckey" = M.ckey))
	return contact_list

/datum/computer_file/program/phone/proc/receive_call(datum/phone_call/incoming_call)
	if(current_call)
		// Line busy
		incoming_call.notify_participants("Line busy")
		return

	current_call = incoming_call
	is_ringing = TRUE

	// Notify user
	to_chat(usr, SPAN_NOTICE("Incoming call from [get_participant_name()]!"))
	playsound(usr.loc, 'sound/machines/phone_ring.ogg', 50, 1)
