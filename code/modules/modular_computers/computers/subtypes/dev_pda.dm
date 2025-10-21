/obj/item/modular_computer/pda
	name = "\improper PDA"
	desc = "A very compact computer, designed to keep its user always connected."
	icon = 'icons/obj/modular_pda.dmi'
	icon_state = "pda"
	icon_state_unpowered = "pda"
	hardware_flag = PROGRAM_PDA
	max_hardware_size = 1
	w_class = ITEM_SIZE_SMALL
	light_strength = 2
	slot_flags = SLOT_ID | SLOT_BELT
	stores_pen = TRUE
	stored_pen = /obj/item/pen/retractable
	interact_sounds = list('sound/machines/pda_click.ogg')
	interact_sound_volume = 20

/obj/item/modular_computer/pda/Initialize()
	. = ..()
	enable_computer()

/obj/item/modular_computer/pda/CtrlClick(mob/user)
	if(!isturf(loc)) ///If we are dragging the PDA across the ground we don't want to remove the pen
		remove_pen(user)
		return TRUE
	return ..()

/obj/item/modular_computer/pda/AltClick(mob/user)
	if (CanPhysicallyInteract(user) && card_slot && istype(card_slot.stored_card))
		card_slot.eject_id(user)
		return TRUE
	return ..()

/obj/item/modular_computer/pda/proc/receive_notification(message = null)
	if (!enabled || bsod)
		return
	var/display = "pings softly[message ? " and displays a message: '[message]'" : null]"
	var/mob/found_mob = get_container(/mob)
	if (found_mob)
		found_mob.visible_message(
			SPAN_NOTICE("\The [found_mob]'s [name] [display]."),
			SPAN_NOTICE("Your [name] [display]."),
			SPAN_NOTICE("You hear a soft ping."),
			1
		)
		return
	visible_message(
		SPAN_NOTICE("\The [src] [display]."),
		SPAN_NOTICE("You hear a soft ping."),
		1
	)

// PDA box
/obj/item/storage/box/PDAs
	name = "box of spare PDAs"
	desc = "A box of spare PDA microcomputers."
	icon = 'icons/obj/boxes.dmi'
	icon_state = "pda"

/obj/item/storage/box/PDAs/Initialize()
	. = ..()

	new /obj/item/modular_computer/pda(src)
	new /obj/item/modular_computer/pda(src)
	new /obj/item/modular_computer/pda(src)
	new /obj/item/modular_computer/pda(src)
	new /obj/item/modular_computer/pda(src)
// PDA types
/obj/item/modular_computer/pda/medical
	icon_state = "pda-m"
	icon_state_unpowered = "pda-m"

/obj/item/modular_computer/pda/chemistry
	icon_state = "pda-m"
	icon_state_unpowered = "pda-m"

/obj/item/modular_computer/pda/engineering
	icon_state = "pda-e"
	icon_state_unpowered = "pda-e"

/obj/item/modular_computer/pda/security
	icon_state = "pda-s"
	icon_state_unpowered = "pda-s"

/obj/item/modular_computer/pda/forensics
	icon_state = "pda-s"
	icon_state_unpowered = "pda-s"

/obj/item/modular_computer/pda/science
	icon_state = "pda-nt"
	icon_state_unpowered = "pda-nt"

/obj/item/modular_computer/pda/heads
	name = "command PDA"
	icon_state = "pda-h"
	icon_state_unpowered = "pda-h"

/obj/item/modular_computer/pda/heads/paperpusher
	stored_pen = /obj/item/pen/fancy

/obj/item/modular_computer/pda/heads/hop
	icon_state = "pda-hop"
	icon_state_unpowered = "pda-hop"

/obj/item/modular_computer/pda/heads/hos
	icon_state = "pda-hos"
	icon_state_unpowered = "pda-hos"

/obj/item/modular_computer/pda/heads/ce
	icon_state = "pda-ce"
	icon_state_unpowered = "pda-ce"

/obj/item/modular_computer/pda/heads/cmo
	icon_state = "pda-cmo"
	icon_state_unpowered = "pda-cmo"

/obj/item/modular_computer/pda/heads/rd
	icon_state = "pda-rd"
	icon_state_unpowered = "pda-rd"

/obj/item/modular_computer/pda/captain
	icon_state = "pda-c"
	icon_state_unpowered = "pda-c"

/obj/item/modular_computer/pda/ert
	icon_state = "pda-h"
	icon_state_unpowered = "pda-h"

/obj/item/modular_computer/pda/cargo
	icon_state = "pda-sup"
	icon_state_unpowered = "pda-sup"

/obj/item/modular_computer/pda/mining
	icon_state = "pda-nt"
	icon_state_unpowered = "pda-nt"

/obj/item/modular_computer/pda/syndicate
	icon_state = "pda-syn"
	icon_state_unpowered = "pda-syn"

/obj/item/modular_computer/pda/roboticist
	icon_state = "pda-robot"
	icon_state_unpowered = "pda-robot"
// PDA Phone System Integration
// This file adds phone functionality to existing PDA objects

// First, let's add the phone program to all PDAs by default
/obj/item/modular_computer/pda/Initialize()
	. = ..()
	enable_computer()

	// Add phone program if not already present
	if(!installed_programs || !installed_programs.len)
		install_default_programs()

	// Ensure phone program is installed
	var/datum/computer_file/program/phone/phone_prog = get_program(/datum/computer_file/program/phone)
	if(!phone_prog)
		phone_prog = new/datum/computer_file/program/phone()
		install_program(phone_prog)

// Override the install_default_programs to include phone
/obj/item/modular_computer/pda/proc/install_default_programs()
	if(!installed_programs)
		installed_programs = list()

	// Install default programs
	var/datum/computer_file/program/phone/phone_prog = new/datum/computer_file/program/phone()
	install_program(phone_prog)

// Add phone-related variables to PDA
/obj/item/modular_computer/pda/var/phone_number = null
/obj/item/modular_computer/pda/var/phone_active = FALSE
/obj/item/modular_computer/pda/var/current_call = null

// Phone number assignment proc
/obj/item/modular_computer/pda/proc/assign_phone_number()
	if(!phone_number)
		phone_number = phone_system.generate_number()
		phone_system.register_phone(phone_number, src)

// Call handling procs
/obj/item/modular_computer/pda/proc/receive_call(datum/phone_call/call)
	if(!phone_active)
		receive_notification("Incoming call from [call.caller_name]")
		// Flash the PDA or make it ring
		playsound(loc, 'sound/machines/ring.ogg', 50, 1)

	current_call = call
	// Auto-open the phone program if PDA is active
	if(enabled && !bsod && active_program)
		var/datum/computer_file/program/phone/phone_prog = get_program(/datum/computer_file/program/phone)
		if(phone_prog)
			phone_prog.handle_incoming_call(call)

/obj/item/modular_computer/pda/proc/end_call()
	if(current_call)
		current_call.end_call()
		current_call = null

// Override the destroy proc to clean up phone registration
/obj/item/modular_computer/pda/Destroy()
	if(phone_number)
		phone_system.unregister_phone(phone_number)
	if(current_call)
		end_call()
	return ..()

// Add phone functionality to PDA attack_self (when user clicks on PDA)
/obj/item/modular_computer/pda/attack_self(mob/user)
	..()

	// Assign phone number if not already done
	if(!phone_number)
		assign_phone_number()

	// If there's an incoming call, open the phone program
	if(current_call && current_call.status == CALL_STATUS_INCOMING)
		var/datum/computer_file/program/phone/phone_prog = get_program(/datum/computer_file/program/phone)
		if(phone_prog)
			phone_prog.handle_incoming_call(current_call)

// Department-specific PDA phone numbers
/obj/item/modular_computer/pda/medical/assign_phone_number()
	. = ..()
	if(phone_number)
		phone_system.register_department_phone(phone_number, DEPARTMENT_MEDICAL, "Medical PDA")

/obj/item/modular_computer/pda/security/assign_phone_number()
	. = ..()
	if(phone_number)
		phone_system.register_department_phone(phone_number, DEPARTMENT_SECURITY, "Security PDA")

/obj/item/modular_computer/pda/engineering/assign_phone_number()
	. = ..()
	if(phone_number)
		phone_system.register_department_phone(phone_number, DEPARTMENT_ENGINEERING, "Engineering PDA")

/obj/item/modular_computer/pda/science/assign_phone_number()
	. = ..()
	if(phone_number)
		phone_system.register_department_phone(phone_number, DEPARTMENT_SCIENCE, "Science PDA")

/obj/item/modular_computer/pda/heads/assign_phone_number()
	. = ..()
	if(phone_number)
		phone_system.register_department_phone(phone_number, DEPARTMENT_COMMAND, "Command PDA")

/obj/item/modular_computer/pda/cargo/assign_phone_number()
	. = ..()
	if(phone_number)
		phone_system.register_department_phone(phone_number, DEPARTMENT_CARGO, "Cargo PDA")

// Add phone status to PDA examination
/obj/item/modular_computer/pda/examine(mob/user)
	. = ..()
	if(phone_number)
		. += "It has a phone number: [phone_number]"
	if(current_call)
		. += "It is currently in a call."

// Integration with existing PDA notification system
/obj/item/modular_computer/pda/receive_notification(message = null)
	if (!enabled || bsod)
		return

	// Check if this is a phone-related notification
	if(message && findtext(message, "call") || findtext(message, "phone"))
		// Make phone notifications more prominent
		var/display = "rings[message ? " and displays: '[message]'" : null]"
		var/mob/found_mob = get_container(/mob)
		if (found_mob)
			found_mob.visible_message(
				SPAN_NOTICE("\The [found_mob]'s [name] [display]."),
				SPAN_NOTICE("Your [name] [display]."),
				SPAN_NOTICE("You hear a ringing sound."),
				1
			)
			// Play ring sound
			playsound(loc, 'sound/machines/ring.ogg', 50, 1)
			return

	// Fall back to default notification behavior
	..()
