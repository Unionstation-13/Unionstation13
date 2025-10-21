// PDA Phone Program
// Path: code/modules/modular_computers/file_system/programs/generic/pda_phone.dm

/datum/computer_file/program/phone
	filename = "phone"
	filedesc = "Phone"
	program_open_overlay_name = "phone"
	program_key_state = "phone_key"
	program_menu_icon = "phone"
	extended_desc = "A program for making and receiving phone calls."
	size = 4
	requires_ntnet = 1
	available_on_ntnet = 1
	network_destination = "phone_system"
	ui_header = 'icons/ntos/ntos_phone_header.png'
	var/datum/phone_call/current_call = null
	var/last_dialed_number = null
	var/call_history = list()
	var/max_history_entries = 10

/datum/computer_file/program/phone/New()
	..()
	// Initialize phone system connection
	if(!phone_system)
		phone_system = new/datum/phone_system()

/datum/computer_file/program/phone/Destroy()
	if(current_call)
		end_call()
	return ..()

/datum/computer_file/program/phone/proc/get_pda_phone_number()
	if(computer && istype(computer, /obj/item/modular_computer/pda))
		var/obj/item/modular_computer/pda/pda = computer
		return pda.phone_number
	return null

/datum/computer_file/program/phone/proc/handle_incoming_call(datum/phone_call/call)
	current_call = call
	update_ui()

/datum/computer_file/program/phone/proc/make_call(number)
	if(!number || !get_pda_phone_number())
		return FALSE

	var/datum/phone_call/new_call = phone_system.create_call(get_pda_phone_number(), number)
	if(new_call)
		current_call = new_call
		last_dialed_number = number
		add_to_history(number, "outgoing")
		update_ui()
		return TRUE
	return FALSE

/datum/computer_file/program/phone/proc/end_call()
	if(current_call)
		current_call.end_call()
		add_to_history(current_call.other_number, "ended")
		current_call = null
		update_ui()

/datum/computer_file/program/phone/proc/answer_call()
	if(current_call && current_call.status == CALL_STATUS_INCOMING)
		current_call.answer()
		add_to_history(current_call.other_number, "incoming")
		update_ui()

/datum/computer_file/program/phone/proc/add_to_history(number, call_type)
	if(!call_history)
		call_history = list()

	var/list/entry = list(
		"number" = number,
		"type" = call_type,
		"timestamp" = world.time
	)

	call_history.Insert(1, entry)
	if(call_history.len > max_history_entries)
		call_history.Cut(max_history_entries + 1)

/datum/computer_file/program/phone/proc/get_department_contacts()
	. = list()
	for(var/number in phone_system.department_phones)
		var/datum/department_phone/dept_phone = phone_system.department_phones[number]
		. += list(list(
			"name" = dept_phone.name,
			"number" = number,
			"department" = dept_phone.department
		))

/datum/computer_file/program/phone/proc/get_personal_contacts()
	. = list()
	// Get all registered personal phones
	for(var/number in phone_system.registered_phones)
		if(number == get_pda_phone_number())
			continue // Skip our own number

		var/obj/item/modular_computer/pda/pda = phone_system.registered_phones[number]
		if(pda && istype(pda))
			var/owner_name = "Unknown"
			if(pda.loc && istype(pda.loc, /mob/living/carbon/human))
				var/mob/living/carbon/human/owner = pda.loc
				owner_name = owner.name

			. += list(list(
				"name" = owner_name,
				"number" = number,
				"type" = "personal"
			))

/datum/computer_file/program/phone/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, datum/topic_state/state = GLOB.default_state)
	var/data[0]

	// Basic phone info
	data["phone_number"] = get_pda_phone_number()
	data["last_dialed"] = last_dialed_number

	// Current call status
	if(current_call)
		data["in_call"] = TRUE
		data["call_status"] = current_call.status
		data["call_number"] = current_call.other_number
		data["call_duration"] = current_call.get_duration()
		data["call_name"] = current_call.get_other_name()
	else
		data["in_call"] = FALSE

	// Call history
	var/list/history_data = list()
	for(var/list/entry in call_history)
		history_data += list(list(
			"number" = entry["number"],
			"type" = entry["type"],
			"timestamp" = entry["timestamp"]
		))
	data["call_history"] = history_data

	// Contacts
	data["department_contacts"] = get_department_contacts()
	data["personal_contacts"] = get_personal_contacts()

	// UI state
	data["can_make_call"] = !current_call || current_call.status != CALL_STATUS_ACTIVE
	data["can_answer_call"] = current_call && current_call.status == CALL_STATUS_INCOMING
	data["can_end_call"] = current_call && current_call.status != CALL_STATUS_ENDED

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "phone_template.tmpl", "Phone", 400, 500, state = state)
		ui.set_initial_data(data)
		ui.open()

/datum/computer_file/program/phone/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["action"])
		switch(href_list["action"])
			case("make_call")
				var/number = href_list["number"]
				if(number)
					make_call(number)

			case("answer_call")
				answer_call()

			case("end_call")
				end_call()

			case("dial_number")
				var/number = input(usr, "Enter phone number:", "Dial") as text
				if(number)
					make_call(number)

			case("clear_history")
				call_history = list()

			case("redial")
				if(last_dialed_number)
					make_call(last_dialed_number)

		update_ui()
		return 1

/datum/computer_file/program/phone/proc/update_ui()
	if(computer && computer.active_program == src)
		SSnano.update_uis(src)

// Auto-update UI when call status changes
/datum/computer_file/program/phone/proc/on_call_status_changed()
	update_ui()
