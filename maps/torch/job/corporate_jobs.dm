/datum/job/liaison
	title = "Human Resources Manager"
	department = "Command"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "Your own judgement in maintaining workplace stability as well as the laws of the UGN and legislation from Neotrasen Registration LLC."
	selection_color = "#2f2f7f"
	economic_power = 18
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 25)
	outfit_type = /singleton/hierarchy/outfit/job/torch/passenger/workplace_liaison
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/contractor)
	skill_points = 26
	min_skill = list( // 5 points
		SKILL_BUREAUCRACY = SKILL_EXPERIENCED, // 4 points
		SKILL_FINANCE = SKILL_BASIC // 1 point
	)

	access = list(
		access_liaison, access_bridge, access_solgov_crew,
		access_nanotrasen, access_commissary, access_torch_fax,
		access_radio_comm, access_radio_serv
	)

	software_on_spawn = list(/datum/computer_file/program/reports)

/datum/job/liaison/get_description_blurb()
	return "You are the Human Resources Manager, mandated hear by applicable law of NeoTrasen's recruitment systems. Maintain order and stability at any cost. Be the diplomat nobody ever wanted."
