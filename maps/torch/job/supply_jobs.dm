/datum/job/qm
	title = "Supply Manager"
	department = "Supply"
	department_flag = SUP
	total_positions = 1
	spawn_positions = 1
	supervisors = "Customs and Cooran Supply approved transit laws"
	economic_power = 5
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 27)
	ideal_character_age = 35
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/supply/deckofficer
	allowed_branches = list(/datum/mil_branch/cooran)
	allowed_ranks = list(/datum/mil_rank/cooran/o1,
	/datum/mil_rank/cooran/o2,
	/datum/mil_rank/cooran/o3
	)
	skill_points = 24
	min_skill = list( // 9 points
		SKILL_BUREAUCRACY = SKILL_TRAINED, // 2 points
		SKILL_FINANCE = SKILL_BASIC, // 1 point
		SKILL_HAULING = SKILL_BASIC, // 1 point
		SKILL_EVA = SKILL_BASIC, // 1 point
		SKILL_PILOT = SKILL_BASIC, // 2 points
		SKILL_MECH = SKILL_BASIC // 2 points
	)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	access = list(
		access_maint_tunnels, access_bridge, access_emergency_storage, access_tech_storage,  access_cargo, access_guppy_helm,
		access_cargo_bot, access_qm, access_mailsorting, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar,
		access_mining, access_mining_office, access_mining_station, access_commissary, access_teleporter, access_eva, access_torch_fax,
		access_radio_sup, access_radio_exp, access_radio_comm
	)

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/cargo_tech
	title = "Logistics Agent"
	department = "Supply"
	department_flag = SUP
	total_positions = 3
	spawn_positions = 3
	supervisors = "Whoever pays you the most"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 24
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/supply/tech
	allowed_branches = list(/datum/mil_branch/cooran)
	allowed_ranks = list(/datum/mil_rank/cooran/e1,
	/datum/mil_rank/cooran/e2,
	/datum/mil_rank/cooran/e3,
	/datum/mil_rank/cooran/e4
	)
	min_skill = list( // 5 points
		SKILL_BUREAUCRACY = SKILL_BASIC, // 1 point
		SKILL_FINANCE = SKILL_BASIC, // 1 point
		SKILL_HAULING = SKILL_BASIC, // 1 point
		SKILL_MECH =	SKILL_BASIC // 2 points
	)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	access = list(
		access_maint_tunnels, access_emergency_storage, access_cargo, access_guppy_helm,
		access_cargo_bot, access_mailsorting, access_solgov_crew, access_expedition_shuttle,
		access_guppy, access_hangar, access_commissary, access_radio_sup
	)

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/mining
	title = "Prospector"
	department = "Supply"
	department_flag = SUP
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Deck Chief"
	economic_power = 7
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 25
	alt_titles = list(
		"Drill Technician",
		"Shaft Miner",
		"Salvage Technician")
	min_skill = list( // 3 points
		SKILL_HAULING = SKILL_TRAINED, // 2 points
		SKILL_EVA = SKILL_BASIC // 1 point
		)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)

	outfit_type = /singleton/hierarchy/outfit/job/torch/passenger/research/prospector
	allowed_branches = list(/datum/mil_branch/cooran)
	allowed_ranks = list(/datum/mil_rank/cooran/e1,
	/datum/mil_rank/cooran/e2,
	/datum/mil_rank/cooran/e3,
	/datum/mil_rank/cooran/e4
	)

	access = list(
		access_mining, access_mining_office, access_mining_station,
		access_expedition_shuttle, access_guppy, access_hangar,
		access_guppy_helm, access_solgov_crew, access_eva, access_radio_sup
	)
