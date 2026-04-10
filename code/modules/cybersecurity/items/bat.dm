/obj/item/device/backdooraccesstool
	name = "Backdoor Access Tool"
	desc = "If your seeing this, make an issue on github and message an admin. This is the base class for the backdoor access tool."
	icon = 'icons/obj/machines/cybersecurity.dmi'
	icon_state = "bat_official"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	force = 5.0
	w_class = ITEM_SIZE_SMALL
	throwforce = 5.0
	throw_range = 15
	throw_speed = 3
	matter = list(MATERIAL_PLASTIC = 50, MATERIAL_GLASS = 20, MATERIAL_STEEL = 5)
	origin_tech = list(TECH_MAGNET = 1, TECH_ENGINEERING = 1)
	/// The privelages a BAT has. There are three types. ADMIN, HOMEMADE, and TRAITOR. The default is ADMIN.
	var/privileges = 0
	// The following are to define flags.
	/// Admin gives default sudo access meaning no cracker needed
	var/ADMIN = 0
	/// Doesn't have default sudo access; needs to escalate w/ password cracker(just takes time)
	var/HOMEMADE = 1
	/// Gives malware compilation ability + Homemade needs
	var/TRAITOR = 2

// /obj/item/device/backdooraccesstool/proc/init_hack(device_type, valid_commands)
	// Nothing yet


// Types of BAT's

/obj/item/device/backdooraccesstool/official
	name = "Official Backdoor Access Tool"
	desc = "An official ABCDEFG Backdoor Access Tool. The ABCDEFG logo is printed on the front on a cover covering the circuitry."
	privileges = ADMIN

/obj/device/backdooraccesstool/official/get_antag_info()
	. = ..()
	. += "These things must be worth a fortune on the black market! They can also be used to jack into and hack consoles and computers. Pretty handy, especially given that this one has administrative privileges by default."

/obj/item/device/backdooraccesstool/homemade
	name = "Homemade Access Tool"
	desc = "A small device that fits in the palm of your hand with two prongs sticking out the top. The cover is ripped off and the circuitry is exposed. It is probably very fragile."
	icon_state = "bat_home"
	privileges = HOMEMADE
	// Its smaller and lighter so it can be thrown farther but less power
	throwforce = 4.5
	throw_range = 16
	throw_speed = 4

/obj/device/backdooraccesstool/official/get_antag_info()
	. = ..()
	. +=  "This is a homemade version of the official ABCDEFG patented Backdoor Access Tool. It can jack into computers and hack them. These are VERY, VERY illegal for civilians."

/obj/item/device/backdooraccesstool/traitor
	name = "Suspicious Handheld Device"
	icon_state = "bat_home"
	privileges = TRAITOR

/obj/device/backdooraccesstool/trator/get_antag_info()
	. = ..()
	. +=  "This is definetly not a handheld computer; It is a Union cyber-hacking device that was reverse-engineered from a ABCDEFG Backdoor Access Tool. It is probably a good idea to keep this away from security."
