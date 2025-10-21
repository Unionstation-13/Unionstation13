// Department Phone System
/datum/department_phone
	var/department_name = "Unknown"
	var/phone_number = "0000"
	var/list/authorized_callers = list()
	var/current_call = null
	var/obj/item/device/phone_device = null

/datum/department_phone/New(name, number, dept_type)
	department_name = name
	phone_number = number
	setup_authorized_callers(dept_type)

/datum/department_phone/proc/setup_authorized_callers(dept_type)
	switch(dept_type)
		if("medical")
			authorized_callers = list("Medical Doctor", "Chief Medical Officer", "Chemist", "Paramedic")
		if("security")
			authorized_callers = list("Security Officer", "Head of Security", "Detective", "Warden")
		if("engineering")
			authorized_callers = list("Station Engineer", "Chief Engineer", "Atmospheric Technician")
		if("science")
			authorized_callers = list("Scientist", "Research Director", "Roboticist")
		if("command")
			authorized_callers = list("Captain", "Head of Personnel")

/datum/department_phone/proc/receive_call(datum/phone_call/call)
	if(current_call)
		// Line busy
		call.notify_participants("Line busy")
		return

	current_call = call
	notify_department()

/datum/department_phone/proc/notify_department()
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H.job && is_authorized_department(H.job))
			to_chat(H, SPAN_NOTICE("[department_name] phone ringing..."))
			playsound(H.loc, 'sound/machines/phone_ring.ogg', 30, 1)

/datum/department_phone/proc/is_authorized_department(job_title)
	return (job_title in authorized_callers)

/datum/department_phone/proc/accept_call(mob/user)
	if(current_call && is_authorized_department(user.job))
		current_call.accept_call(user)
		to_chat(user, SPAN_NOTICE("Call connected to [department_name] phone."))

/datum/department_phone/proc/decline_call(mob/user)
	if(current_call && is_authorized_department(user.job))
		current_call.decline_call(user)
		current_call = null
		to_chat(user, SPAN_NOTICE("Call declined."))

// Global department phone registry
var/global/list/department_phones = list()

/proc/setup_department_phones()
	// Medical
	department_phones += new/datum/department_phone("Medical Bay", "1111", "medical")

	// Security
	department_phones += new/datum/department_phone("Security Office", "2222", "security")

	// Engineering
	department_phones += new/datum/department_phone("Engineering", "3333", "engineering")

	// Science
	department_phones += new/datum/department_phone("Research Division", "4444", "science")

	// Command
	department_phones += new/datum/department_phone("Bridge", "5555", "command")

/proc/get_department_phone(number)
	for(var/datum/department_phone/phone in department_phones)
		if(phone.phone_number == number)
			return phone
	return null
