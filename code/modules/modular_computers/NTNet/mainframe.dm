/obj/machinery/network/mainframe
	name ="\improper Departmental IT Mainframe"
	desc = "You probably shouldn't be able to see this."
	icon = 'icons/obj/machines/telecomms.dmi'
	icon_state = "hub"
	use_power = POWER_USE_ACTIVE
	active_power_usage = 2000
	idle_power_usage = 2000
	anchored = TRUE
	density = TRUE
	construct_state = /singleton/machine_construction/default/panel_closed
	uncreated_component_parts = null
	stat_immune = 0
	machine_name = "\improper Departmental IT Mainframe"
	machine_desc = "A large information bank for a specific department. Better keep this secure."

	var/enabled = TRUE

/obj/machinery/network/mainframe/security
	name = "Security IT Mainframe"
	desc = "A departmental IT mainframe. This one seems to be serving the Security department."
	machine_name = "Security IT Mainframe"

/obj/machinery/network/mainframe/research
	name = "Research IT Mainframe"
	desc = "A departmental IT mainframe. This one seems to be serving the Research department."
	machine_name = "Research IT Mainframe"

/obj/machinery/network/mainframe/medical
	name = "Medical IT Mainframe"
	desc = "A departmental IT mainframe. This one seems to be serving the Medical department."
	machine_name = "Medical IT Mainframe"

/obj/machinery/network/mainframe/engineering
	name = "Engineering IT Mainframe"
	desc = "A departmental IT mainframe. This one seems to be serving the Engineering department."
	machine_name = "Engineering IT Mainframe"

/obj/machinery/network/mainframe/service
	name = "Service IT Mainframe"
	desc = "A departmental IT mainframe. This one seems to be serving the Service department."
	machine_name = "Service IT Mainframe"

/obj/machinery/network/mainframe/exploration
	name = "Exploration IT Mainframe"
	desc = "A departmental IT mainframe. This one seems to be serving the Exploration department."
	machine_name = "Exploration IT Mainframe"

/obj/machinery/network/mainframe/command
	name = "Command IT Mainframe"
	desc = "A departmental IT mainframe. This one seems to be serving the Command department."
	machine_name = "Command IT Mainframe"
