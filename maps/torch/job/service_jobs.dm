/datum/job/chief_steward
	title = "Community Services Manager"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	minimum_character_age = list(SPECIES_HUMAN = 28)
	ideal_character_age = 35
	economic_power = 6
	minimal_player_age = 7
	supervisors = "The UGN food safety regulations and recreational advisory"
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/service/chief_steward
	allowed_branches = list(/datum/mil_branch/bio)
	allowed_ranks = list(/datum/mil_rank/bio/o1,
	/datum/mil_rank/bio/o2
	)
	min_skill = list( // 9 points
		SKILL_BUREAUCRACY = SKILL_TRAINED, // 2 points
		SKILL_COOKING = SKILL_TRAINED, // 2 points
		SKILL_BOTANY = SKILL_BASIC, // 1 point
		SKILL_CHEMISTRY = SKILL_BASIC // 4 points
	)
	access = list(
		access_bridge,
		access_torch_fax,
		access_chief_steward,
		access_solgov_crew,
		access_radio_comm,
		access_radio_serv,
		access_emergency_storage,
		access_janitor,
		access_commissary,
		access_hydroponics,
		access_kitchen,
		access_o_mess
	)

/datum/job/chaplain
	title = "Reverend"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	minimum_character_age = list(SPECIES_HUMAN = 24)
	ideal_character_age = 40
	economic_power = 6
	minimal_player_age = 0
	supervisors = "UGN Religious code"
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/service/chaplain
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/contractor)
	min_skill = list( // 1 point
		SKILL_BUREAUCRACY = SKILL_BASIC, // 1 point
		SKILL_WEAPONS = SKILL_UNSKILLED // Fleet chaplains may refuse weapon training
	)

	access = list(
		access_morgue, access_chapel_office,
		access_crematorium, access_solgov_crew,
		access_radio_serv
	)

/datum/job/janitor
	title = "B.I.O Sanitation Officer"
	department = "Service"
	department_flag = SRV
	total_positions = 2
	spawn_positions = 2
	supervisors = "Containment protocols for biohazard breaches, otherwise, the Community Services Director"
	minimum_character_age = list(SPECIES_HUMAN = 20)
	ideal_character_age = 20
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/service/janitor
	allowed_branches = list(/datum/mil_branch/bio)
	allowed_ranks = list(/datum/mil_rank/bio/e2,
	/datum/mil_rank/bio/e3,
	/datum/mil_rank/bio/e4
	)
	min_skill = list( // 1 point
		SKILL_HAULING = SKILL_BASIC // 1 point
	)

	access = list(
		access_maint_tunnels, access_emergency_storage,
		access_janitor, access_solgov_crew,
		access_radio_serv
	)


/datum/job/chef
	title = "B.I.O Mess Technician"
	department = "Service"
	department_flag = SRV
	total_positions = 2
	spawn_positions = 2
	alt_titles = list(
		"B.I.O Commisioned Barista",
		"B.I.O Commisioned Bartender"
	)
	minimum_character_age = list(SPECIES_HUMAN = 20)
	supervisors = "UGN Food regulations and the Community Services Director"
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/service/cook
	allowed_branches = list(/datum/mil_branch/bio)
	allowed_ranks = list(/datum/mil_rank/bio/e2,
	/datum/mil_rank/bio/e3,
	/datum/mil_rank/bio/e4
	)
	min_skill = list( // 7 points
		SKILL_BOTANY = SKILL_BASIC, // 1 point
		SKILL_CHEMISTRY = SKILL_BASIC, // 4 points
		SKILL_COOKING = SKILL_TRAINED // 2 points
	)
	access = list(
		access_commissary,
		access_hydroponics,
		access_kitchen,
		access_radio_serv,
		access_solgov_crew,
		access_o_mess
	)


/datum/job/crew
	title = "Junior Kitchen Assistant"
	department = "Service"
	department_flag = SRV
	total_positions = 5
	spawn_positions = 5
	supervisors = "The B.I.O Senior Servicemen and everyone above you in service."
	minimum_character_age = list(SPECIES_HUMAN = 20)
	ideal_character_age = 20
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/service/crewman
	allowed_branches = list(
		/datum/mil_branch/bio
	)
	allowed_ranks = list(
		/datum/mil_rank/bio/e1
	)

	access = list(
		access_maint_tunnels, access_emergency_storage,
		access_solgov_crew, access_radio_serv
	)
