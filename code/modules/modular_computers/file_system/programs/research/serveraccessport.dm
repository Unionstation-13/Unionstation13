/datum/computer_file/program/serveraccessport
	filename = "serveraccessport"
	filedesc = "Direct Server Access Port Software"
	program_icon_state = "server_access"
	program_key_state = "generic_key"
	program_menu_icon = "wrench"
	extended_desc = "This program allows direct access to mainframe servers, as long as you have an uplink cable and the proper access."
	size = 12
	requires_ntnet = FALSE
	//required_access = access_network_admin
	network_destination = "NTNet Statistics & Configuration"
	available_on_ntnet = TRUE
	nanomodule_path = /datum/nano_module/program/computer_serveraccessport
	category = PROG_ADMIN

/datum/nano_module/program/computer_serveraccessport
	name = "Direct Server Access Port Software"
	available_to_ai = TRUE

/datum/nano_module/program/computer_serveraccessport/proc/uplink_cable_data(mob/user, /obj/machinery/network/mainframe/M, obj/item/stock_parts/computer/uplink_cable/C = locate() in user.contents)

	if(C.isUplinkCableActive)
		return TRUE
	else
		return FALSE


/datum/nano_module/program/computer_serveraccessport/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, datum/topic_state/state = GLOB.default_state)

	var/list/data = host.initial_data()
	var/admin_access = list(access_network_admin)
	var/authenticated = check_access(user, admin_access)
	var/message1 = null
	var/message2 = null
	//var/isMainframeEmagged = FALSE
	var/intrusion = FALSE

	if(!user.skill_check(SKILL_COMPUTER, SKILL_TRAINED))
		return

	data["message1"] = message1
	data["message2"] = message2

	if(!uplink_cable_data())
		message1 = "ERR: Device(Uplink_cable) not connected!"
	else
		message1 = "Cable Connected: Data Stream Active"

	if(intrusion)
		message2 = "WARNING! Intrusion detected! Immediate action required!"
	else
		message2 = "No intrusions detected"

	if(!authenticated)
		message1 = "ERR: User not authenticated. Contact your supervisor if you thing this is a mistake."
		message2 = null

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "accessport.tmpl", name, 700, 540, state = state)
		ui.auto_update_layout = 1
		ui.set_initial_data(data)
		ui.open()
