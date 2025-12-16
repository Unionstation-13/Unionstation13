/datum/job/engineer
	title = "Engineering Technician"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Chief Engineer"
	selection_color = "#5b4d20"
	economic_power = 5
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 19)
	ideal_character_age = 30
	alt_titles = list(
		"EVA Technician",
		"Engineer"
		)
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/engineering/engineer
	allowed_branches = list(
		/datum/mil_branch/nitros = /singleton/hierarchy/outfit/job/torch/crew/engineering/contractor
	)
	allowed_ranks = list(
		/datum/mil_rank/nitros/e3,
		/datum/mil_rank/nitros/e4,
		/datum/mil_rank/nitros/e5,
		/datum/mil_rank/nitros/e6
	)
	skill_points = 26
	min_skill = list( // 22 points
		SKILL_COMPUTER = SKILL_TRAINED, // 2 points
		SKILL_EVA = SKILL_TRAINED, // 2 points
		SKILL_CONSTRUCTION = SKILL_TRAINED, // 2 points
		SKILL_ELECTRICAL = SKILL_TRAINED, // 4 points
		SKILL_ATMOS = SKILL_TRAINED, // 4 points
		SKILL_ENGINES = SKILL_TRAINED // 8 points
	)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)

	access = list(
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_tech_storage, access_atmospherics, access_janitor, access_construction,
		access_tcomsat, access_solgov_crew, access_seneng, access_hangar, access_network, access_network_admin, access_radio_eng
	)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)

/datum/job/engineer/get_description_blurb()
	return "You are the Technician, a jack of all trades of engineering, however you do not excell at one in particular."

/datum/job/engineer_trainee
	title = "Technician Trainee"
	department = "Engineering"
	department_flag = ENG
	total_positions = 2
	spawn_positions = 2
	supervisors = "Technicians"
	selection_color = "#5b4d20"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 20

	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/engineering/engineer
	allowed_branches = list(
		/datum/mil_branch/nitros = /singleton/hierarchy/outfit/job/torch/crew/engineering/contractor
	)
	allowed_ranks = list(
		/datum/mil_rank/nitros/e1,
		/datum/mil_rank/nitros/e2
	)

	skill_points = 10
	min_skill = list( // 23 points
		SKILL_COMPUTER = SKILL_BASIC, // 1 point
		SKILL_HAULING = SKILL_TRAINED, // 2 points
		SKILL_EVA = SKILL_TRAINED, // 2 points
		SKILL_CONSTRUCTION = SKILL_TRAINED, // 2 points
		SKILL_ELECTRICAL = SKILL_TRAINED, // 4 points
		SKILL_ATMOS = SKILL_TRAINED, // 4 points
		SKILL_ENGINES = SKILL_TRAINED // 8 points
	)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)

	access = list(
		access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_eva, access_tech_storage, access_janitor, access_construction,
		access_solgov_crew, access_hangar, access_radio_eng
	)
	extra_access = list(access_engine, access_network, access_network_admin)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)

/datum/job/engineer_trainee/get_description_blurb()
	return "You are an engineering trainee. You are learning how to operate the various onboard engineering systems from senior engineering staff. You are subordinate to all of the other engineers aboard. The role is only for players new to the engineering system and department."

/datum/job/roboticist
	title = "Technical Repair Specialist"
	department = "Technical Service"
	department_flag = ENG|ROB

	total_positions = 2
	spawn_positions = 2
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 25)
	supervisors = "ABCDEFG Inc's software/hardware rules"
	selection_color = "#5b4d20"
	economic_power = 6
	alt_titles = list(
		"Technician")
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/engineering/roboticist
	allowed_branches = list(
		/datum/mil_branch/abc = /singleton/hierarchy/outfit/job/torch/crew/engineering/roboticist
	)
	allowed_ranks = list(
		/datum/mil_rank/abc/e2,
		/datum/mil_rank/abc/e3,
		/datum/mil_rank/abc/e4,
		/datum/mil_rank/abc/e5
	)
	skill_points = 26
	min_skill = list( // 22 points
		SKILL_COMPUTER = SKILL_TRAINED, // 2 points
		SKILL_DEVICES = SKILL_EXPERIENCED, // 4 points
		SKILL_EVA = SKILL_TRAINED, // 2 points
		SKILL_ANATOMY = SKILL_TRAINED, // 8 points
		SKILL_CONSTRUCTION = SKILL_BASIC, // 2 points
		SKILL_ELECTRICAL = SKILL_BASIC, // 2 points
		SKILL_MECH = HAS_PERK // 2 points
	)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_EXPERIENCED,
	                    SKILL_ENGINES      = SKILL_EXPERIENCED,
	                    SKILL_DEVICES      = SKILL_MAX,
	                    SKILL_MEDICAL      = SKILL_EXPERIENCED,
	                    SKILL_ANATOMY      = SKILL_EXPERIENCED)

	access = list(
		access_robotics, access_engine, access_solgov_crew, access_network, access_radio_eng
	)
	extra_access = list(access_research)

/datum/job/roboticist/get_description_blurb()
	return "You are a Technical Repair Specialist.\
	you are responsible for managing the ship's hardware systems such as synthetic units or the artificial intelligence(to a degree), however, please remember that you\
	are not required to follow orders from the Chief Engineer or any other engineering staff, as you are an employee of ABCDEFG inc."
