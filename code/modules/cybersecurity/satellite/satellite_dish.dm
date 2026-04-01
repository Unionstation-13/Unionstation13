/obj/machinery/cybersec/satellite_dish
	name = "\improper Satellite Dish"
	icon = 'icons/obj/machines/cybersecurity.dmi'
	icon_state = "sat_dish"
	base_type = /obj/machinery/r_n_d/server
	construct_state = /singleton/machine_construction/default/panel_closed
	machine_name = "\improper Satellite Dish"
	machine_desc = "A large quantumn antenna used for communication with Pax and PAXNET."
	req_access = list(access_csa) //Only cybersec admins can access without multitool


/obj/machinery/cybersec/satellite_dish/back
	name = "\improper Satellite Dish"
	machine_desc = "The front portion of a large quantumn antenna used for communication with Pax and PAXNET."
	icon_state = "sat_dish"
	var/working = TRUE
	var/opened = 0 // Cover starts on. 1 is open 2 is destroyed
	var/unscrewed = FALSE
	var/locked = TRUE
// Edited version of APC code
/obj/machinery/cybersec/satellite_dish/back/use_tool(obj/item/W, mob/living/user, list/click_params)
	if (istype(user, /mob/living/silicon) && get_dist(src,user)>1)
		return attack_robot(user)

	if(isCrowbar(W))//bypass when on harm intend to actually make use of the cover hammer off check further down.
		if(opened) // Closes
			if(opened == 2)
				to_chat(user, "You don't think the cover is going back on...")
			else if (opened != 2) //cover isn't removed/destroyed
				opened = 0 // Closes panel.
				user.visible_message(SPAN_NOTICE("\The [user] pries the cover shut on \the [src]."), SPAN_NOTICE("You pry the cover shut."))
				update_icon()
				return TRUE
		if(MACHINE_IS_BROKEN(src))
			if (opened == 2)
				to_chat(user, SPAN_WARNING("The cover of \the [src] is broken off!"))
			else
				to_chat(user, SPAN_WARNING("The cover  of \the [src] appears stuck. You need to bash it off!"))
			return TRUE
		opened = 1
		user.visible_message(SPAN_NOTICE("\The [user] pries the outer cover open on \the [src]."), SPAN_NOTICE("You pry the outer cover open."))
		update_icon()
		return TRUE

	if(isScrewdriver(W))
		if(opened >= 1 && !unscrewed)
			unscrewed = TRUE
			to_chat(user, "You unscrew the inner maintenance panel.")
			return TRUE
		else if(unscrewed)
			unscrewed = FALSE
			to_chat(user, "You screw back in the inner maintenance panel.")
			return TRUE
		// Otherwise, if not opened, nothing happens.
		to_chat(user, "You tap the screwdriver against the panel. Nothing.")
		return TRUE

	// trying to unlock the inner area with an ID card
	if ((istype(W, /obj/item/card/id)||istype(W, /obj/item/modular_computer)) && opened >= 1 && unscrewed)
		if(emagged)
			to_chat(user, "The interface is flashing random digits. It seems to be stuck in a loop. You may want to try using a BAT on it.")
		else if(MACHINE_IS_BROKEN(src))
			to_chat(user, "Nothing happens.")
		else
			if(has_access(req_access, user.GetAccess()))
				locked = !locked
				to_chat(user, "You [ locked ? "lock" : "unlock"] the satellites innermost maintenance panel.")
				update_icon()
			else
				to_chat(user, SPAN_WARNING("Access denied."))
		return TRUE

	// trying to unlock the inner area with a multitool
	if (isMultitool(W) && opened >= 1 && unscrewed)
		if(emagged)
			to_chat(user, "The interface is flashing random digits. It seems to be stuck in a loop. You may want to try using a BAT on it.")
		else if(MACHINE_IS_BROKEN(src))
			to_chat(user, "You pulse a stray wire. Not even a flicker.")
		else
			if(prob(75))
				user.visible_message(SPAN_NOTICE("\The [user] pulses a wire inside \the [src]."), SPAN_NOTICE("You pulse a stray wire inside \the [src]. The innermost panel suddenly opens."))
				locked = FALSE
				update_icon()
				return
			else
				to_chat(user, SPAN_WARNING("You pulse a random wire... Nothing happens."))
		return TRUE

	if((. = ..())) // Further interactions are low priority attack stuff.
		return

	if (istype(user, /mob/living/silicon))
		return attack_robot(user)

	return ..()

/obj/machinery/cybersec/satellite_dish/back/attack_hand( mob/user) // Hand based actions
	if(user.a_intent==I_HELP)
		if((opened == 1 || opened == 2) && unscrewed && !MACHINE_IS_BROKEN(src))
			to_chat(user, "You press the big red RESET button. The satellite whirs back to life.")
			working = TRUE
			update_icon()
			return
		if(MACHINE_IS_BROKEN(src))
			to_chat(user, "Nothing happens when you press the big red RESET button. The satellite may be broken.")
			return
		return
	if(user.a_intent==I_HURT)
		if((opened == 1 || opened == 2) && unscrewed)
			if(!MACHINE_IS_BROKEN(src))
				to_chat(user, "You punch the big red RESET button. The satellite whirs back to life.")
				return
			else
				to_chat(user, "You punch the big red RESET button... Nothing happens.")
				return
		if(opened==0)
			to_chat(user, "You punch the maintenance panel. Your hand throbs.")
			return
			//TODO either remove harm damage interaction in favor of generic combat or code interaction
		return

// Emags, of course
/obj/machinery/cybersec/satellite_dish/back/emag_act(remaining_charges, mob/user)
	if (!(emagged))		// Trying to unlock with an emag card
		if(opened)
			to_chat(user, "You must close the cover to tap the emag to the panel.")
		else if(unscrewed)
			to_chat(user, "You must close the inner panel first")
		else if(MACHINE_IS_BROKEN(src) || GET_FLAGS(stat, MACHINE_STAT_MAINT))
			to_chat(user, "Nothing happens.")
		else
			flick("apc-spark", src)
			if (do_after(user,6,src))
				if(prob(50))
					emagged = TRUE
					to_chat(user, SPAN_NOTICE("You emag the satellite system. The system buzzes then crashes. You hear a click from inside the maintenance panel."))
					locked = FALSE
					working = FALSE
					update_icon()
				else
					to_chat(user, SPAN_WARNING("You fail to [ locked ? "unlock" : "lock"] the satellite."))

// /obj/machinery/cybersec/satellite_dish/proc/go_offline()
// Do something and disable PAXNET... IDK how to do this. So this is all a comment for now.
// working = FALSE

// /obj/machinery/cybersec/satellite_dish/proc/bat_access()

/obj/machinery/cybersec/satellite_dish/front
	name = "\improper Satellite Dish Front"
	icon = 'icons/obj/machines/cybersecurity.dmi'
	desc = "The front dish part of the Satellite Dish."
	icon_state = "sat_front"
