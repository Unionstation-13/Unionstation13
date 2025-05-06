/obj/item/stock_parts/computer/uplink_cable
	name = "Uplink Cable"
	desc = "An unassuming data cable for use in IT infrastructure."
	critical = FALSE
	icon_state = "uplinkcable"
	hardware_size = 1
	var/IsUplinkCableActive = FALSE
	var/connection_ready = FALSE
	var/connected_user = null
	var/connected_target = null


/proc/get_mainframes_in_view(mob/user)
	var/list/mainframes = list()
	for(var/obj/machinery/network/mainframe/M in view(1, user))
		mainframes += M
	return mainframes

/obj/item/stock_parts/computer/uplink_cable/proc/monitor_connection()
	while(IsUplinkCableActive && connected_user && connected_target)
		if(get_dist(connected_user, connected_target) > 1)
			to_chat(connected_user, SPAN_WARNING("You move too far away and the uplink cable is ripped out of the socket!"))
			IsUplinkCableActive = FALSE
			connected_user = null
			connected_target = null
			return
		sleep(10)

/obj/item/stock_parts/computer/uplink_cable/verb/uplink_cable()
	set name = "Connect Uplink Cable"
	set category = "Object"
	set src in usr.contents

	var/list/mainframes = get_mainframes_in_view(usr)

	if(!mainframes.len)
		to_chat(usr, SPAN_NOTICE("No mainframes nearby to connect to."))
		return

	var/obj/machinery/network/mainframe/target = input(usr, "Choose a mainframe to connect to:") in mainframes

	if(IsUplinkCableActive)
		to_chat(usr, SPAN_WARNING("You are already connected to a mainframe!"))
		return

	if(!target)
		return

	to_chat(usr, SPAN_NOTICE("You plug your uplink cable into [target]."))
	IsUplinkCableActive = TRUE
	connected_user = usr
	connected_target = target

	spawn() monitor_connection()
