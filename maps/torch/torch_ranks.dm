/datum/job/submap
	branch = /datum/mil_branch/civilian
	rank =   /datum/mil_rank/civ/civ
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)
	required_language = null

/datum/map/torch
	branch_types = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet,
		/datum/mil_branch/civilian,
		/datum/mil_branch/solgov,
		/datum/mil_branch/alien,
		/datum/mil_branch/skrell_fleet,
		/datum/mil_branch/iccgn,
		/datum/mil_branch/scga,
		/datum/mil_branch/auf
	)

	spawn_branch_types = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet,
		/datum/mil_branch/civilian,
		/datum/mil_branch/solgov,
		/datum/mil_branch/alien,
		/datum/mil_branch/skrell_fleet,
		/datum/mil_branch/iccgn,
		/datum/mil_branch/scga,
		/datum/mil_branch/auf
	)

	species_to_branch_blacklist = list(
		/singleton/species/human   = list(/datum/mil_branch/alien, /datum/mil_branch/skrell_fleet),
		/singleton/species/machine = list(/datum/mil_branch/alien, /datum/mil_branch/skrell_fleet),
		/singleton/species/vox     = list(
			/datum/mil_branch/expeditionary_corps,
			/datum/mil_branch/fleet,
			/datum/mil_branch/civilian,
			/datum/mil_branch/solgov,
			/datum/mil_branch/skrell_fleet
		),
		/singleton/species/skrell = list(/datum/mil_branch/alien),
		/singleton/species/unathi = list(/datum/mil_branch/alien, /datum/mil_branch/skrell_fleet)
	)

	species_to_branch_whitelist = list(
		/singleton/species/diona        = list(/datum/mil_branch/civilian),
		/singleton/species/nabber       = list(/datum/mil_branch/civilian),
		/singleton/species/adherent     = list(/datum/mil_branch/civilian),
		/singleton/species/vox          = list(/datum/mil_branch/alien)
	)

	species_to_rank_blacklist = list(
		/singleton/species/machine = list(
			/datum/mil_branch/solgov = list(
				/datum/mil_rank/sol/agent
			)
		)
	)

	species_to_rank_whitelist = list(
		/singleton/species/machine = list(
			/datum/mil_branch/expeditionary_corps = list(
				/datum/mil_rank/ec/e3,
				/datum/mil_rank/ec/e5,
				/datum/mil_rank/ec/e7,
				/datum/mil_rank/ec/o1
			),
			/datum/mil_branch/fleet = list(
				/datum/mil_rank/fleet/e1,
				/datum/mil_rank/fleet/e2,
				/datum/mil_rank/fleet/e3,
				/datum/mil_rank/fleet/e4,
				/datum/mil_rank/fleet/e5,
				/datum/mil_rank/fleet/e6,
				/datum/mil_rank/fleet/e7,
				/datum/mil_rank/fleet/o1
			)
		),
		/singleton/species/vox = list(
			/datum/mil_branch/alien = list(
				/datum/mil_rank/alien
			)
		)
	)

/*
 *  Branches
 *  ========
 */

/datum/mil_branch/expeditionary_corps
	name = "URC Exploration and Ecology Division"
	name_short = "URCE&E"
	email_domain = "torch.ec.scg"

	rank_types = list(
		/datum/mil_rank/ec/e3,
		/datum/mil_rank/ec/o10
	)

	spawn_rank_types = list(
		/datum/mil_rank/ec/e3,
		/datum/mil_rank/ec/o10
	)

	assistant_job = /datum/job/crew

	min_skill = list( // 4 points
		SKILL_HAULING = SKILL_BASIC, // 1 point
		SKILL_SCIENCE = SKILL_BASIC, // 2 points
		SKILL_EVA = SKILL_BASIC // 1 point
	)

/datum/mil_branch/fleet
	name = "Fleet"
	name_short = "SCGF"
	email_domain = "torch.fleet.mil"

	rank_types = list(
		/datum/mil_rank/fleet/e1,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/o10,
	)

	spawn_rank_types = list(
		/datum/mil_rank/fleet/e1,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/o10
	)

	assistant_job = /datum/job/crew
	min_skill = list( // 4 points
		SKILL_HAULING = SKILL_BASIC, // 1 point
		SKILL_WEAPONS = SKILL_BASIC, // 2 points
		SKILL_EVA = SKILL_BASIC // 1 point
	)


/datum/mil_branch/civilian
	name = "Civilian"
	name_short = "Civ"
	email_domain = "freemail.net"
	allow_custom_email = TRUE

	rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/contractor,
		/datum/mil_rank/civ/synthetic
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/contractor,
		/datum/mil_rank/civ/synthetic
	)

/datum/mil_branch/solgov
	name = "SolGov Employee"
	name_short = "SCG"
	email_domain = "torch.scg"

	rank_types = list(
		/datum/mil_rank/sol/gov,
		/datum/mil_rank/sol/agent,
		/datum/mil_rank/sol/scientist
	)

	spawn_rank_types = list(
		/datum/mil_rank/sol/gov,
		/datum/mil_rank/sol/agent,
		/datum/mil_rank/sol/scientist
	)

//This variable returns decimal values for alt-ranks, but isn't player facing.
/datum/mil_rank/grade()
	. = ..()
	if(!sort_order)
		return ""
	if(sort_order <= 100)
		return "E-[floor(sort_order / 10)]"
	return "O-[floor((sort_order - 100) / 10)]"

// Within the scope of the Torch, this is the only necessary differentiation.
/datum/mil_rank/rank_category()
	. = ..()
	if(!sort_order)
		return null
	if(sort_order <= 100)
		return GET_SINGLETON(/singleton/rank_category/enlisted)
	else
		return GET_SINGLETON(/singleton/rank_category/commissioned)

/singleton/rank_category/enlisted
	name = "Enlisted"

/singleton/rank_category/commissioned
	name = "Commissioned"
	add_accesses = list(access_o_mess)

// The Fleet Ranks

/datum/mil_rank/fleet/e1
	name = "Sergeant"
	name_short = "SGT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 10

/datum/mil_rank/fleet/e2
	name = "Staff Sergeant"
	name_short = "SSgt"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e2, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 20

/datum/mil_rank/fleet/e3
	name = "Master Sergeant"
	name_short = "MSgt"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e3, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 30

/datum/mil_rank/fleet/e4
	name = "Vice-Commander"
	name_short = "SC"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e4, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 40

/datum/mil_rank/fleet/o10
	name = "Marshall"
	name_short = "ML"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/o10, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 50


// United Rocknall Corporation E&E Ranks
/datum/mil_rank/ec/e3
	name = "Explorer"
	name_short = "XPL"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/enlisted/e3)
	sort_order = 30

/datum/mil_rank/ec/o10
	name = "Expedition Commander"
	name_short = "EXC"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/officer/o10)
	sort_order = 200

/*
 *  Civilians
 *  =========
 */

/datum/mil_rank/civ/civ
	name = "Civilian"

/datum/mil_rank/civ/contractor
	name = "Contractor"

/datum/mil_rank/civ/synthetic
	name = "Synthetic"

/*
 *  SolGov Employees
 *  ====== =========
 */

/datum/mil_rank/sol/gov
	name = "SolGov Representative"
	name_short = "SGR"
	accessory = list(/obj/item/clothing/accessory/badge/solgov/representative)

/datum/mil_rank/sol/agent
	name = "SFP Agent"
	name_short = "AGT"
	accessory = list(/obj/item/clothing/accessory/badge/agent)

/datum/mil_rank/sol/scientist
	name = "Government Scientist"
	name_short = "GOVT"

// Vox/foreign alien branch.
/datum/mil_branch/alien
	name = "Alien"
	name_short = "Alien"
	rank_types = list(/datum/mil_rank/alien)
	spawn_rank_types = list(/datum/mil_rank/alien)

/datum/mil_rank/alien
	name = "Alien"
