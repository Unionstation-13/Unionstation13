/datum/map/torch
	name = "\improper Titen"
	full_name = "\improper UGN Titen"
	path = "torch"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK
	config_path = "config/torch_config.txt"

	admin_levels  = list(7)
	escape_levels = list(8)
	empty_levels  = list(9)
	accessible_z_levels = list("1"=1,"2"=3,"3"=1,"4"=1,"5"=1,"6"=1,"9"=30)
	overmap_size = 35
	overmap_event_areas = 34
	usable_email_tlds = list("torch.ec.scg", "torch.fleet.mil", "freemail.net", "torch.scg")

	allowed_spawns = list("Cryogenic Storage", "Cyborg Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "\improper UGN Titen"
	station_short = "\improper Titen"
	dock_name     = "TBD"
	boss_name     = "Expeditionary Command"
	boss_short    = "Command"
	company_name  = "United Galactic Nations"
	company_short = "UGN"

	map_admin_faxes = list(
		"United Rocknall Command HQ",
		"Nitros Engineering Command HQ",
		"ABCDEFG Command HQ",
		"B.I.O Command HQ",
		"Commisionary Dock",
		"UGN Office of Peacekeeper Supreme Command",
		"UGN Office of Internal Affairs",
		"UGN Burea of Internal Criminal Investigations",
		"Cooran Supply Central Office",
		"Pax Supreme Fleet Command",
		"UGN External Affairs Office",
		"UGN Burea of Emergency Affairs",
		"Secure Routing Service"
	)

	//These should probably be moved into the evac controller...
	shuttle_docked_message = "Attention all hands: Jump preparation complete. The bluespace drive is now spooling up, secure all stations for departure. Time to jump: approximately %ETD%."
	shuttle_leaving_dock = "Attention all hands: Jump initiated, exiting bluespace in %ETA%."
	shuttle_called_message = "Attention all hands: Jump sequence initiated. Transit procedures are now in effect. Jump in %ETA%."
	shuttle_recall_message = "Attention all hands: Jump sequence aborted, return to normal operating conditions."

	evac_controller_type = /datum/evacuation_controller/starship

	default_law_type = /datum/ai_laws/solgov
	use_overmap = 1
	num_exoplanets = 1
	using_sun = TRUE

	away_site_budget = 3
	min_offmap_players = 12

	id_hud_icons = 'maps/torch/icons/assignment_hud.dmi'

	welcome_sound = null

	use_bluespace_interlude = TRUE
