/datum/job/pathfinder
	title = "Exploration Commander"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	supervisors = "The United Rocknall Corporate representative, and the Commanding Officer"
	selection_color = "#68099e"
	minimal_player_age = 1
	economic_power = 10
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 35
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/exploration/pathfinder
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)
	allowed_ranks = list(
		/datum/mil_rank/ec/o10
	)
	skill_points = 28
	min_skill = list( // 9 points
		SKILL_BUREAUCRACY = SKILL_BASIC, // 1 point
		SKILL_EVA = SKILL_TRAINED, // 2 points
		SKILL_SCIENCE = SKILL_TRAINED, // 4 points
		SKILL_PILOT = SKILL_TRAINED // 2 points
	)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERIENCED,
	                    SKILL_WEAPONS     = SKILL_EXPERIENCED)

	access = list(
		access_pathfinder, access_explorer, access_eva, access_maint_tunnels, access_bridge, access_emergency_storage,
		access_guppy_helm, access_solgov_crew, access_expedition_shuttle, access_expedition_shuttle_helm,
		access_guppy, access_hangar, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
		access_petrov_toxins, access_petrov_chemistry, access_petrov_maint, access_tox, access_tox_storage, access_research,
		access_xenobiology, access_xenoarch, access_torch_fax, access_radio_comm,
		access_radio_exp, access_radio_sci, access_research_storage, access_radio_sup
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/pathfinder/get_description_blurb()
	return "You are the Exploration Commander. You are loyal to Rocknall. Your duty is to Explore. Research. Admire. The Rocknall way."

/datum/job/nt_pilot
	title = "Contractor Pilot"
	supervisors = "Whoever pays you the most"
	department = "Contractor"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	selection_color = "#3f3d41"
	economic_power = 8
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 24)
	ideal_character_age = 35
	alt_titles = list(
		"Contractor"
		)
	outfit_type = /singleton/hierarchy/outfit/job/torch/passenger/pilot
	allowed_branches = list(/datum/mil_branch/civilian,)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor = /singleton/hierarchy/outfit/job/torch/passenger/research/nt_pilot,
	)

	access = list(
		access_mining_office, access_petrov, access_petrov_helm, access_petrov_maint, access_mining_station,
		access_expedition_shuttle, access_expedition_shuttle_helm, access_guppy, access_hangar, access_guppy_helm,
		access_mining, access_pilot, access_solgov_crew, access_eva, access_explorer, access_research,
		access_radio_exp, access_radio_sci, access_radio_sup, access_maint_tunnels, access_emergency_storage
	)
	min_skill = list(
		SKILL_EVA = SKILL_BASIC,
		SKILL_PILOT = SKILL_TRAINED,
		SKILL_BUERACRACY = SKILL_BASIC
	)

	max_skill = list(
		SKILL_PILOT = SKILL_MAX,
		SKILL_SCIENCE = SKILL_TRAINED
	)
/datum/job/nt_pilot/get_description_blurb()
	return "After spending 8 years at the URC academy on Pax just to flunk, you lost everything, your apartment, your loved ones, all to the iron fist of the UGN. Forced to the brink of death, you took up a measly job as a contractor, but today you board the UGN Titen in hopes of making a damn good wage and getting the fuck out of there before the corporate snakes kill you."

/datum/job/explorer
	title = "Field Scientist"
	department = "Exploration"
	department_flag = EXP
	total_positions = 6
	spawn_positions = 6
	supervisors = "Your Rocknall Employment Contract and Exploration Commander"
	selection_color = "#68099e"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 24
	alt_titles = list(
		"Field Researcher"
		)
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/exploration/explorer
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)
	allowed_ranks = list(/datum/mil_rank/ec/e3
	)

	min_skill = list( // 1 point
		SKILL_EVA = SKILL_BASIC, // 1 point
		SKILL_PILOT = SKILL_TRAINED,

	)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERIENCED,
	                    SKILL_WEAPONS     = SKILL_EXPERIENCED)

	access = list(
		access_explorer, access_maint_tunnels, access_eva, access_emergency_storage,
		access_guppy_helm, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar,
		access_petrov, access_petrov_maint, access_research, access_radio_exp
	)
	extra_access = list(access_research, access_research_storage, access_medical)

	software_on_spawn = list(/datum/computer_file/program/deck_management)

/datum/job/explorer/get_description_blurb()
	return "You are a Field Scientist. Your duty is to explore and maintain your senior officers goodwill and ensure cooperation of the exploration branch of Rocknall with the science division."
