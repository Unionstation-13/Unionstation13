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
		// /datum/mil_branch/scga,
		/datum/mil_branch/auf,
		/datum/mil_branch/nitros,
		/datum/mil_branch/rocknall,
		/datum/mil_branch/bio,
		/datum/mil_branch/abc,
		/datum/mil_branch/cooran
	)

	spawn_branch_types = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet,
		/datum/mil_branch/civilian,
		/datum/mil_branch/solgov,
		/datum/mil_branch/alien,
		/datum/mil_branch/skrell_fleet,
		/datum/mil_branch/iccgn,
		// /datum/mil_branch/scga,
		/datum/mil_branch/auf,
		/datum/mil_branch/nitros,
		/datum/mil_branch/rocknall,
		/datum/mil_branch/bio,
		/datum/mil_branch/abc,
		/datum/mil_branch/cooran
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
		/singleton/species/vox          = list(/datum/mil_branch/alien),
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
				/datum/mil_rank/ec/e3
			),
			/datum/mil_branch/fleet = list(
				/datum/mil_rank/fleet/e1,
				/datum/mil_rank/fleet/e2,
				/datum/mil_rank/fleet/e3,
				/datum/mil_rank/fleet/e4,
				/datum/mil_rank/fleet/o9,
				/datum/mil_rank/fleet/o10
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
	email_domain = "titen.ec.scg"

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
	name_short = "UGNGF"
	email_domain = "titen.fleet.mil"

	rank_types = list(
		/datum/mil_rank/fleet/e1,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/o9,
		/datum/mil_rank/fleet/o10,
	)

	spawn_rank_types = list(
		/datum/mil_rank/fleet/e1,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/o9,
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

/datum/mil_branch/nitros
	name = "Nitros Employee"
	name_short = "NIT"
	email_domain = "nitros.corp"
	rank_types = list(
		/datum/mil_rank/nitros/e1,
		/datum/mil_rank/nitros/e2,
		/datum/mil_rank/nitros/e3,
		/datum/mil_rank/nitros/e4,
		/datum/mil_rank/nitros/e5,
		/datum/mil_rank/nitros/e6,
		/datum/mil_rank/nitros/o1,
		/datum/mil_rank/nitros/o2,
		/datum/mil_rank/nitros/o3,
		/datum/mil_rank/nitros/o4
	)

	spawn_rank_types = list(
		/datum/mil_rank/nitros/e1,
		/datum/mil_rank/nitros/e2,
		/datum/mil_rank/nitros/e3,
		/datum/mil_rank/nitros/e4,
		/datum/mil_rank/nitros/e5,
		/datum/mil_rank/nitros/e6,
		/datum/mil_rank/nitros/o1,
		/datum/mil_rank/nitros/o2,
		/datum/mil_rank/nitros/o3,
		/datum/mil_rank/nitros/o4
	)

/datum/mil_branch/rocknall

	name = "United Rocknall Employee"
	name_short = "URC"
	email_domain = "rocknall.corp"
	rank_types = list(
		/datum/mil_rank/rocknall/e1,
		/datum/mil_rank/rocknall/e2,
		/datum/mil_rank/rocknall/e3,
		/datum/mil_rank/rocknall/e4,
		/datum/mil_rank/rocknall/e5,
		/datum/mil_rank/rocknall/e6,
		/datum/mil_rank/rocknall/o1,
		/datum/mil_rank/rocknall/o2,
		/datum/mil_rank/rocknall/o3,
		/datum/mil_rank/rocknall/o4
	)
	spawn_rank_types = list(
		/datum/mil_rank/rocknall/e1,
		/datum/mil_rank/rocknall/e2,
		/datum/mil_rank/rocknall/e3,
		/datum/mil_rank/rocknall/e4,
		/datum/mil_rank/rocknall/e5,
		/datum/mil_rank/rocknall/e6,
		/datum/mil_rank/rocknall/o1,
		/datum/mil_rank/rocknall/o2,
		/datum/mil_rank/rocknall/o3,
		/datum/mil_rank/rocknall/o4
	)

/datum/mil_branch/bio

	name = "BioTech Services Employee"
	name_short = "BIO"
	email_domain = "biotech.srvs.corp"
	rank_types = list(
		/datum/mil_rank/bio/e1,
		/datum/mil_rank/bio/e2,
		/datum/mil_rank/bio/e3,
		/datum/mil_rank/bio/e4,
		/datum/mil_rank/bio/o1,
		/datum/mil_rank/bio/o2
	)

	spawn_rank_types = list(
		/datum/mil_rank/bio/e1,
		/datum/mil_rank/bio/e2,
		/datum/mil_rank/bio/e3,
		/datum/mil_rank/bio/e4,
		/datum/mil_rank/bio/o1,
		/datum/mil_rank/bio/o2
	)

/datum/mil_branch/abc

	name = "ABCDEFG Employee"
	name_short = "ABC"
	email_domain = "abcdefg.corp"
	rank_types = list(
		/datum/mil_rank/abc/e1,
		/datum/mil_rank/abc/e2,
		/datum/mil_rank/abc/e3,
		/datum/mil_rank/abc/e4,
		/datum/mil_rank/abc/e5,
		/datum/mil_rank/abc/o1,
		/datum/mil_rank/abc/o2,
		/datum/mil_rank/abc/o3
	)

	spawn_rank_types = list(
		/datum/mil_rank/abc/e1,
		/datum/mil_rank/abc/e2,
		/datum/mil_rank/abc/e3,
		/datum/mil_rank/abc/e4,
		/datum/mil_rank/abc/e5,
		/datum/mil_rank/abc/o1,
		/datum/mil_rank/abc/o2,
		/datum/mil_rank/abc/o3
	)

/datum/mil_branch/cooran

	name = "Cooran Supply Agent"
	name_short = "COR"
	email_domain = "cooran.supply.corp"
	rank_types = list(
		/datum/mil_rank/cooran/e1,
		/datum/mil_rank/cooran/e2,
		/datum/mil_rank/cooran/e3,
		/datum/mil_rank/cooran/e4,
		/datum/mil_rank/cooran/o1,
		/datum/mil_rank/cooran/o2,
		/datum/mil_rank/cooran/o3
	)

	spawn_rank_types = list(
		/datum/mil_rank/cooran/e1,
		/datum/mil_rank/cooran/e2,
		/datum/mil_rank/cooran/e3,
		/datum/mil_rank/cooran/e4,
		/datum/mil_rank/cooran/o1,
		/datum/mil_rank/cooran/o2,
		/datum/mil_rank/cooran/o3
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

/datum/mil_rank/fleet/o1
	name = "Colonel"
	name_short = "CL"
	accessory = list(/obj/item/clothing/accesory/solgov/rank/fleet/enlisted/o1, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 40

/datum/mil_rank/fleet/o9
	name = "Staff Commander"
	name_short = "SC"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/flag/o9, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 50

/datum/mil_rank/fleet/o10
	name = "Commanding Officer"
	name_short = "CO"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/flag/o10, /obj/item/clothing/accessory/solgov/specialty/enlisted)
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


// Nitros Engineering Ranks
/datum/mil_rank/nitros/e1
	name = "Engineer Recruit"
	name_short = "ER"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/nitros/e1)
	sort_order = 10

/datum/mil_rank/nitros/e2
	name = "Apprentice Engineer"
	name_short = "AENG"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/nitros/e2)
	sort_order = 20

/datum/mil_rank/nitros/e3
	name = "Engineer"
	name_short = "ENG"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/nitros/e3)
	sort_order = 30

/datum/mil_rank/nitros/e4
	name = "Specialist Engineer"
	name_short = "SPENG"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/nitros/e4)
	sort_order = 40

/datum/mil_rank/nitros/e5
	name = "Senior Engineer"
	name_short = "SENG"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/nitros/e5)
	sort_order = 50

/datum/mil_rank/nitros/e6
	name = "Master Engineer"
	name_short = "MENG"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/nitros/e6)
	sort_order = 60

/datum/mil_rank/nitros/o1
	name = "Junior Foreman"
	name_short = "JFM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/nitros/o1)
	sort_order = 110

/datum/mil_rank/nitros/o2
	name = "Foreman"
	name_short = "FM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/nitros/o2)
	sort_order = 120

/datum/mil_rank/nitros/o3
	name = "Senior Foreman"
	name_short = "SFM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/nitros/o3)
	sort_order = 130

/datum/mil_rank/nitros/o4
	name = "Master Foreman"
	name_short = "MFM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/nitros/o4)
	sort_order = 140

// United Rocknall Corporation Ranks
/datum/mil_rank/rocknall/e1
	name = "Intern"
	name_short = "INT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/rocknall/e1)
	sort_order = 10

/datum/mil_rank/rocknall/e2
	name = "Junior Associate"
	name_short = "JA"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/rocknall/e2)
	sort_order = 20

/datum/mil_rank/rocknall/e3
	name = "Associate"
	name_short = "AE"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/rocknall/e3)
	sort_order = 30

/datum/mil_rank/rocknall/e4
	name = "Senior Associate"
	name_short = "SE"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/rocknall/e4)
	sort_order = 40

/datum/mil_rank/rocknall/e5
	name = "Junior Team Specialist"
	name_short = "JTS"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/rocknall/e5)
	sort_order = 50

/datum/mil_rank/rocknall/e6
	name = "Team Specialist"
	name_short = "TS"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/rocknall/e6)
	sort_order = 60

/datum/mil_rank/rocknall/o1
	name = "Junior Supervisor"
	name_short = "JSV"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/rocknall/o1)
	sort_order = 110

/datum/mil_rank/rocknall/o2
	name = "Supervisor"
	name_short = "SV"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/rocknall/o2)
	sort_order = 120

/datum/mil_rank/rocknall/o3
	name = "Junior Administrator"
	name_short = "JADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/rocknall/o3)
	sort_order = 130

/datum/mil_rank/rocknall/o4
	name = "Administrator"
	name_short = "ADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/rocknall/o4)
	sort_order = 140

// Biotech Services Ranks
/datum/mil_rank/bio/e1
	name = "Trainee"
	name_short = "TRN"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/bio/e1)
	sort_order = 10

/datum/mil_rank/bio/e2
	name = "Junior Attendant"
	name_short = "JAT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/bio/e2)
	sort_order = 20

/datum/mil_rank/bio/e3
	name = "Attendant"
	name_short = "AT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/bio/e3)
	sort_order = 30

/datum/mil_rank/bio/e4
	name = "Senior Attendant"
	name_short = "SAT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/bio/e4)
	sort_order = 40

/datum/mil_rank/bio/o1
	name = "Junior Manager"
	name_short = "JM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/bio/o1)
	sort_order = 110

/datum/mil_rank/bio/o2
	name = "Manager"
	name_short = "MGR"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/bio/o2)
	sort_order = 120

// ABCDEFG Ranks
/datum/mil_rank/abc/e1
	name = "Junior Technician"
	name_short = "JTEC"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/abc/e1)
	sort_order = 10

/datum/mil_rank/abc/e2
	name = "Technician"
	name_short = "TEC"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/abc/e2)
	sort_order = 20

/datum/mil_rank/abc/e3
	name = "Senior Technician"
	name_short = "STEC"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/abc/e3)
	sort_order = 30

/datum/mil_rank/abc/e4
	name = "Specialist"
	name_short = "SPC"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/abc/e4)
	sort_order = 40

/datum/mil_rank/abc/e5
	name = "Senior Specialist"
	name_short = "SSPC"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/abc/e5)
	sort_order = 50

/datum/mil_rank/abc/o1
	name = "Analyst"
	name_short = "ALS"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/abc/o1)
	sort_order = 110

/datum/mil_rank/abc/o2
	name = "Expeditionary Director"
	name_short = "EDR"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/abc/o2)
	sort_order = 120

/datum/mil_rank/abc/o3
	name = "Regional Director"
	name_short = "RDR"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/abc/o3)
	sort_order = 130

// Cooran Supply Ranks
/datum/mil_rank/cooran/e1
	name = "Junior Agent"
	name_short = "JAGT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/cooran/e1)
	sort_order = 10

/datum/mil_rank/cooran/e2
	name = "Agent"
	name_short = "AGT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/cooran/e2)
	sort_order = 20

/datum/mil_rank/cooran/e3
	name = "Senior Agent"
	name_short = "SAGT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/cooran/e3)
	sort_order = 30

/datum/mil_rank/cooran/e4
	name = "Chief Agent"
	name_short = "CAGT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/cooran/e4)
	sort_order = 40

/datum/mil_rank/cooran/o1
	name = "Junior Supervisor"
	name_short = "JSV"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/cooran/o1)
	sort_order = 110

/datum/mil_rank/cooran/o2
	name = "Supervisor"
	name_short = "SV"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/cooran/o2)
	sort_order = 120

/datum/mil_rank/cooran/o3
	name = "Deck Chief"
	name_short = "DCH"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/cooran/o3)
	sort_order = 130

/datum/mil_rank/rocknall/o4
	name = "Loadmaster"
	name_short = "LDM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/ec/cooran/o4)
	sort_order = 140
