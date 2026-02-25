/********
Synthetic
********/

/datum/job/cyborg
	total_positions = 3
	spawn_positions = 3
	supervisors = "your laws"
	minimal_player_age = 3
	allowed_ranks = list(
		/datum/mil_rank/civ/synthetic
	)

/datum/job/ai
	minimal_player_age = 7
	total_positions = 0
	spawn_positions = 1
	allowed_ranks = list(
		/datum/mil_rank/civ/synthetic
	)

/*******
Civilian
*******/

/datum/job/assistant
	title = "Drifter"
	total_positions = -1
	spawn_positions = -1
	supervisors = "Whoever pays you the most"
	economic_power = 6
	announced = FALSE
	outfit_type = /singleton/hierarchy/outfit/job/torch/passenger/passenger
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/contractor
	)
	min_goals = 2
	max_goals = 7
/datum/job/assistant/get_description_blurb()
		return "You were just another cog in the machine, until your boss fired you on a whim and you lost everything. Now you've boarded the Titen in hopes of getting a job. "

/datum/job/merchant
	title = "Diplomatic Merchant"
	department = "Civilian"
	department_flag = CIV
	total_positions = 2
	spawn_positions = 2
	availablity_chance = 30
	supervisors = "Trade Regulations put in place by Cooran Supply and Trading."
	ideal_character_age = 30
	minimal_player_age = 0
	create_record = 0
	outfit_type = /singleton/hierarchy/outfit/job/torch/merchant
	allowed_branches = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/alien
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/alien
	)
	latejoin_at_spawnpoints = 1
	access = list(access_merchant)
	announced = FALSE
	skill_points = 24
	min_skill = list( // 4 points
		SKILL_FINANCE = SKILL_TRAINED, // 2 points
		SKILL_PILOT = SKILL_BASIC // 2 points
	)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	required_language = null
	give_psionic_implant_on_join = FALSE
