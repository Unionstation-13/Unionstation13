/obj/item/stock_parts/computer/uplink_cable
	name = "Uplink Cable"
	desc = "An unassuming data cable for use in IT infrastructure."
	critical = FALSE
	icon_state = "uplinkcable"
	hardware_size = 1
	var/isUplinkCableActive = FALSE
	var/admin = null


/obj/item/stock_parts/computer/uplink_cable/MouseDrop(atom/over_atom, source_loc, over_loc)
	if (!usr)
		return
	if (!over_atom)
		return
	if (!Adjacent(usr) || !over_atom.Adjacent(usr))
		return
	if (isliving(over_atom))
		MouseDrop_T(over_atom, usr)
	else
		over_atom.MouseDrop_T(src, usr)


/obj/item/stock_parts/computer/uplink_cable/MouseDrop_T(atom/dropped, mob/living/user)
	var/M = /obj/machinery/network/mainframe

	if (src == dropped && user.canClick())
		user.ClickOn(src)
		return
	if (!CheckDexterity(user))
		to_chat(user, SPAN_WARNING("You're not dextrous enough to do that."))
		return
	if (user.incapacitated())
		to_chat(user, SPAN_WARNING("You're in no condition to do that."))
		return
	if (M && isUplinkCableActive == dropped)
		to_chat(usr, "You unplug the cable from the mainframe.")
		isUplinkCableActive = FALSE
		admin = null
	else if (istype(M, dropped))
		to_chat(usr, "You plug the cable into the mainframe.")
		isUplinkCableActive = TRUE
		admin = usr

/obj/item/stock_parts/computer/uplink_cable/Process()
	if (!admin)
		return PROCESS_KILL
	if (!Adjacent(admin))
		isUplinkCableActive = FALSE
		to_chat(admin, "The cable gets ripped out of the socket!")
		return PROCESS_KILL
	if (SSobj.times_fired & 1)
		return
