// Phone System Core
// Path: code/datums/communication/phone_system.dm

// Global phone system instance
var/global/datum/phone_system/phone_system

// Phone system datum
/datum/phone_system
	var/list/registered_phones = list()  // number -> PDA object
	var/list/active_calls = list()       // list of active call datums
	var/list/department_phones = list()  // number -> department phone datum
	var/next_phone_number = 1000
	var/max_call_duration = 3000 // 5 minutes max call duration

/datum/phone_system/New()
	..()
	// Initialize department phones
	setup_department_phones()

/datum/phone_system/proc/setup_department_phones()
	// Medical
	register_department_phone("1001", DEPARTMENT_MEDICAL, "Medical Bay")
	register_department_phone("1002", DEPARTMENT_MEDICAL, "Chemistry")
	register_department_phone("1003", DEPARTMENT_MEDICAL, "Genetics")

	// Security
	register_department_phone("2001", DEPARTMENT_SECURITY, "Security Office")
	register_department_phone("2002", DEPARTMENT_SECURITY, "Brig")
	register_department_phone("2003", DEPARTMENT_SECURITY, "Detective Office")

	// Engineering
	register_department_phone("3001", DEPARTMENT_ENGINEERING, "Engineering")
	register_department_phone("3002", DEPARTMENT_ENGINEERING, "Atmospherics")
	register_department_phone("3003", DEPARTMENT_ENGINEERING, "Telecomms")

	// Science
	register_department_phone("4001", DEPARTMENT_SCIENCE, "Research")
	register_department_phone("4002", DEPARTMENT_SCIENCE, "Robotics")
	register_department_phone("4003", DEPARTMENT_SCIENCE, "Xenobiology")

	// Command
	register_department_phone("5001", DEPARTMENT_COMMAND, "Bridge")
	register_department_phone("5002", DEPARTMENT_COMMAND, "Captain's Office")
	register_department_phone("5003", DEPARTMENT_COMMAND, "HoP Office")

	// Cargo
	register_department_phone("6001", DEPARTMENT_CARGO, "Cargo Bay")
	register_department_phone("6002", DEPARTMENT_CARGO, "Mining Office")

/datum/phone_system/proc/generate_number()
	var/number = "[next_phone_number]"
	next_phone_number++
	return number

/datum/phone_system/proc/register_phone(number, obj/item/modular_computer/pda/pda)
	if(number && pda)
		registered_phones[number] = pda

/datum/phone_system/proc/unregister_phone(number)
	if(number && registered_phones[number])
		registered_phones.Remove(number)
		// End any active calls with this number
		for(var/datum/phone_call/call in active_calls)
			if(call.caller_number == number || call.other_number == number)
				call.end_call()

/datum/phone_system/proc/register_department_phone(number, department, name)
	if(number && department && name)
		var/datum/department_phone/dept_phone = new/datum/department_phone(number, department, name)
		department_phones[number] = dept_phone

/datum/phone_system/proc/create_call(caller_number, target_number)
	if(!caller_number || !target_number)
		return null

	if(caller_number == target_number)
		return null // Can't call yourself

	// Check if target exists
	var/target_phone = get_phone(target_number)
	if(!target_phone)
		return null

	// Check if either party is already in a call
	if(is_in_call(caller_number) || is_in_call(target_number))
		return null

	// Create the call
	var/datum/phone_call/call = new/datum/phone_call(caller_number, target_number)
	active_calls += call

	// Notify the target
	if(istype(target_phone, /obj/item/modular_computer/pda))
		var/obj/item/modular_computer/pda/target_pda = target_phone
		target_pda.receive_call(call)
	else if(istype(target_phone, /datum/department_phone))
		var/datum/department_phone/dept_phone = target_phone
		dept_phone.receive_call(call)

	return call

/datum/phone_system/proc/get_phone(number)
	if(registered_phones[number])
		return registered_phones[number]
	else if(department_phones[number])
		return department_phones[number]
	return null

/datum/phone_system/proc/is_in_call(number)
	for(var/datum/phone_call/call in active_calls)
		if(call.status == CALL_STATUS_ACTIVE && (call.caller_number == number || call.other_number == number))
			return TRUE
	return FALSE

/datum/phone_system/proc/end_call(datum/phone_call/call)
	if(call && (call in active_calls))
		call.end_call()
		active_calls -= call

// Department phone datum
/datum/department_phone
	var/number = ""
	var/department = ""
	var/name = ""
	var/current_call = null

/datum/department_phone/New(new_number, new_department, new_name)
	number = new_number
	department = new_department
	name = new_name

/datum/department_phone/proc/receive_call(datum/phone_call/call)
	current_call = call
	// Make a station-wide announcement for department phones
	var/message = "Incoming call to [name] at [number]"
	priority_announcement.Announce(message, "Phone System", sound = 'sound/machines/ring.ogg')

/datum/department_phone/proc/answer_call()
	if(current_call && current_call.status == CALL_STATUS_INCOMING)
		current_call.answer()

// Phone call datum
/datum/phone_call
	var/caller_number = ""
	var/other_number = ""
	var/status = CALL_STATUS_DIALING
	var/start_time = 0
	var/end_time = 0
	var/caller_name = ""

/datum/phone_call/New(caller, target)
	caller_number = caller
	other_number = target
	start_time = world.time
	caller_name = get_caller_name()

/datum/phone_call/proc/get_caller_name()
	var/obj/item/modular_computer/pda/pda = phone_system.get_phone(caller_number)
	if(istype(pda))
		if(pda.loc && istype(pda.loc, /mob/living/carbon/human))
			var/mob/living/carbon/human/owner = pda.loc
			return owner.name
		else
			return "PDA [caller_number]"
	else
		var/datum/department_phone/dept_phone = phone_system.get_phone(caller_number)
		if(dept_phone)
			return dept_phone.name
	return "Unknown"

/datum/phone_call/proc/get_other_name()
	var/obj/item/modular_computer/pda/pda = phone_system.get_phone(other_number)
	if(istype(pda))
		if(pda.loc && istype(pda.loc, /mob/living/carbon/human))
			var/mob/living/carbon/human/owner = pda.loc
			return owner.name
		else
			return "PDA [other_number]"
	else
		var/datum/department_phone/dept_phone = phone_system.get_phone(other_number)
		if(dept_phone)
			return dept_phone.name
	return "Unknown"

/datum/phone_call/proc/answer()
	if(status == CALL_STATUS_INCOMING)
		status = CALL_STATUS_ACTIVE
		start_time = world.time
		// Set up audio channels
		setup_audio_channels()

/datum/phone_call/proc/end_call()
	if(status != CALL_STATUS_ENDED)
		status = CALL_STATUS_ENDED
		end_time = world.time
		// Clean up audio channels
		cleanup_audio_channels()

/datum/phone_call/proc/get_duration()
	if(status == CALL_STATUS_ACTIVE)
		return world.time - start_time
	else if(status == CALL_STATUS_ENDED)
		return end_time - start_time
	return 0

/datum/phone_call/proc/setup_audio_channels()
	// This would set up audio channels between the two parties
	// Implementation depends on your audio system
	var/obj/item/modular_computer/pda/caller_pda = phone_system.get_phone(caller_number)
	var/obj/item/modular_computer/pda/target_pda = phone_system.get_phone(other_number)

	if(caller_pda && target_pda)
		// Create audio link between the two PDAs
		// This is a simplified version - you'd need to implement proper audio handling
		var/mob/caller_mob = get_mob_by_pda(caller_pda)
		var/mob/target_mob = get_mob_by_pda(target_pda)

		if(caller_mob && target_mob)
			// Set up bidirectional audio
			caller_mob.hearing_range = 7
			target_mob.hearing_range = 7

/datum/phone_call/proc/cleanup_audio_channels()
	// Clean up audio channels
	var/obj/item/modular_computer/pda/caller_pda = phone_system.get_phone(caller_number)
	var/obj/item/modular_computer/pda/target_pda = phone_system.get_phone(other_number)

	if(caller_pda && target_pda)
		var/mob/caller_mob = get_mob_by_pda(caller_pda)
		var/mob/target_mob = get_mob_by_pda(target_pda)

		if(caller_mob && target_mob)
			// Reset hearing ranges
			caller_mob.hearing_range = initial(caller_mob.hearing_range)
			target_mob.hearing_range = initial(target_mob.hearing_range)

/datum/phone_call/proc/get_mob_by_pda(obj/item/modular_computer/pda/pda)
	if(pda && pda.loc)
		if(istype(pda.loc, /mob/living))
			return pda.loc
		else if(istype(pda.loc, /obj/item/storage))
			var/obj/item/storage/container = pda.loc
			if(container.loc && istype(container.loc, /mob/living))
				return container.loc
	return null

// Call status constants
#define CALL_STATUS_DIALING "dialing"
#define CALL_STATUS_INCOMING "incoming"
#define CALL_STATUS_ACTIVE "active"
#define CALL_STATUS_ENDED "ended"

// Department constants
#define DEPARTMENT_MEDICAL "medical"
#define DEPARTMENT_SECURITY "security"
#define DEPARTMENT_ENGINEERING "engineering"
#define DEPARTMENT_SCIENCE "science"
#define DEPARTMENT_COMMAND "command"
#define DEPARTMENT_CARGO "cargo"
