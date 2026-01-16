/datum/computer_file/program/pass_print
	filename = "cardmod"
	filedesc = "Passport Printer program"
	nanomodule_path = /datum/nano_module/program/pass_print
	program_icon_state = "id"
	program_key_state = "id_key"
	program_menu_icon = "key"
	extended_desc = "Program for printing authorized UGN passports."
	requires_ntnet = FALSE
	size = 8
	category = PROG_COMMAND

/datum/nano_module/program/pass_print
	name = "Passport Printer program"
	var/mod_mode = 1
	var/is_centcom = 0
	var/show_assignments = 0
	var/selected_branch = null // Track currently selected branch for rank selection

/datum/nano_module/program/pass_print/ui_interact(mob/user, ui_key, datum/nanoui/ui, force_open, datum/topic_state/state)
	. = ..()

//Temporarily commented until I go back to it.
