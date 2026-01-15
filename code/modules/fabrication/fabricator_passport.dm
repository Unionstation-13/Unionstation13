/obj/machinery/fabricator/passportfab
	name = "Passport Printer"
	desc = "A large device with an advanced encryption system that is able to print valid passports."
	icon = 'icons/obj/machines/fabricators/microlathe.dmi' //Change when new assets imported
	icon_state = "minilathe"
	base_icon_state = "minilathe"
	idle_power_usage = 5
	active_power_usage = 1000
	base_type = /obj/machinery/fabricator/passportfab
	fabricator_class = FABRICATOR_CLASS_PASSPORT
	base_storage_capacity = list(
		/material/plastic =   5000 // I guess plastic paper IS a reality
	)
	machine_name = "Passport Printer"
	machine_desc = "A large device with an advanced proprietary encryption system that is able to print valid passports."

//Subtype for mapping, starts preloaded
/obj/machinery/fabricator/passportfab/printer
	show_category = "Passports"

/obj/machinery/fabricator/passportfab/printer/Initialize()
	. = ..()
	stored_material[/material/glass] = base_storage_capacity[/material/glass]
