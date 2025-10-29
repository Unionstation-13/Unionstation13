/datum/mil_branch/UGNa
	name = "United Galactic Nations Army"
	name_short = "UGNA"
	email_domain = "army.mil.UGN"
	assistant_job = null
	min_skill = list( // 6 points
		SKILL_HAULING = SKILL_TRAINED, // 2 points
		SKILL_WEAPONS = SKILL_BASIC, // 2 points
		SKILL_COMBAT = SKILL_BASIC // 2 points
	)

	rank_types = list(
		/datum/mil_rank/UGNa/e1,
		/datum/mil_rank/UGNa/e3,
		/datum/mil_rank/UGNa/e4,
		/datum/mil_rank/UGNa/e5,
		/datum/mil_rank/UGNa/e6,
		/datum/mil_rank/UGNa/e7,
		/datum/mil_rank/UGNa/e8,
		/datum/mil_rank/UGNa/e8_alt,
		/datum/mil_rank/UGNa/e9,
		/datum/mil_rank/UGNa/e9_alt1,
		/datum/mil_rank/UGNa/e9_alt2,
		/datum/mil_rank/UGNa/o1,
		/datum/mil_rank/UGNa/o2,
		/datum/mil_rank/UGNa/o3,
		/datum/mil_rank/UGNa/o4,
		/datum/mil_rank/UGNa/o5,
		/datum/mil_rank/UGNa/o6,
		/datum/mil_rank/UGNa/o7,
		/datum/mil_rank/UGNa/o8,
		/datum/mil_rank/UGNa/o9,
		/datum/mil_rank/UGNa/o10,
		/datum/mil_rank/UGNa/o10_alt
	)

	spawn_rank_types = list(
		/datum/mil_rank/UGNa/e1,
		/datum/mil_rank/UGNa/e3,
		/datum/mil_rank/UGNa/e4,
		/datum/mil_rank/UGNa/e5,
		/datum/mil_rank/UGNa/e6,
		/datum/mil_rank/UGNa/e7,
		/datum/mil_rank/UGNa/e8,
		/datum/mil_rank/UGNa/e8_alt,
		/datum/mil_rank/UGNa/e9,
		/datum/mil_rank/UGNa/e9_alt1,
		/datum/mil_rank/UGNa/e9_alt2,
		/datum/mil_rank/UGNa/o1,
		/datum/mil_rank/UGNa/o2,
		/datum/mil_rank/UGNa/o3,
		/datum/mil_rank/UGNa/o4,
		/datum/mil_rank/UGNa/o5,
		/datum/mil_rank/UGNa/o6,
		/datum/mil_rank/UGNa/o7,
		/datum/mil_rank/UGNa/o8,
		/datum/mil_rank/UGNa/o9,
		/datum/mil_rank/UGNa/o10,
		/datum/mil_rank/UGNa/o10_alt
	)


/datum/mil_branch/UGNa/New()
	rank_types = subtypesof(/datum/mil_rank/UGNa)
	..()


/datum/mil_rank/UGNa/e1
	name = "Private"
	name_short = "Pvt"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/e1,
		/obj/item/clothing/accessory/UGNa_badge/enlisted
	)
	sort_order = 10


/datum/mil_rank/UGNa/e2
	name = "Private Second Class"
	name_short = "Pv2"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/e2,
		/obj/item/clothing/accessory/UGNa_badge/enlisted
	)
	sort_order = 20


/datum/mil_rank/UGNa/e3
	name = "Private First Class"
	name_short = "PFC"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/e3,
		/obj/item/clothing/accessory/UGNa_badge/enlisted
	)
	sort_order = 30


/datum/mil_rank/UGNa/e4
	name = "Corporal"
	name_short = "Cpl"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/e4,
		/obj/item/clothing/accessory/UGNa_badge/enlisted
	)
	sort_order = 40


/datum/mil_rank/UGNa/e5
	name = "Sergeant"
	name_short = "Sgt"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/e5,
		/obj/item/clothing/accessory/UGNa_badge/enlisted
	)
	sort_order = 50


/datum/mil_rank/UGNa/e6
	name = "Staff Sergeant"
	name_short = "SSgt"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/e6,
		/obj/item/clothing/accessory/UGNa_badge/enlisted
	)
	sort_order = 60


/datum/mil_rank/UGNa/e7
	name = "Sergeant First Class"
	name_short = "SFC"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/e7,
		/obj/item/clothing/accessory/UGNa_badge/enlisted
	)
	sort_order = 70


/datum/mil_rank/UGNa/e8
	name = "Master Sergeant"
	name_short = "MSgt"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/e8,
		/obj/item/clothing/accessory/UGNa_badge/enlisted
	)
	sort_order = 80


/datum/mil_rank/UGNa/e8_alt
	name = "First Sergeant"
	name_short = "1Sgt"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/e8_alt,
		/obj/item/clothing/accessory/UGNa_badge/enlisted
	)
	sort_order = 81


/datum/mil_rank/UGNa/e9
	name = "Sergeant Major"
	name_short = "SgtM"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/e9,
		/obj/item/clothing/accessory/UGNa_badge/enlisted
	)
	sort_order = 90


/datum/mil_rank/UGNa/e9_alt1
	name = "Command Sergeant Major"
	name_short = "CSM"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/e9_alt1,
		/obj/item/clothing/accessory/UGNa_badge/enlisted
	)
	sort_order = 91


/datum/mil_rank/UGNa/e9_alt2
	name = "Sergeant Major of the Army"
	name_short = "SMA"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/e9_alt2,
		/obj/item/clothing/accessory/UGNa_badge/enlisted
	)
	sort_order = 92


/datum/mil_rank/UGNa/o1
	name = "Second Lieutenant"
	name_short = "2Lt"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/o1,
		/obj/item/clothing/accessory/UGNa_badge/officer
	)
	sort_order = 110


/datum/mil_rank/UGNa/o2
	name = "First Lieutenant"
	name_short = "1Lt"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/o2,
		/obj/item/clothing/accessory/UGNa_badge/officer
	)
	sort_order = 120


/datum/mil_rank/UGNa/o3
	name = "Captain"
	name_short = "Cpt"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/o3,
		/obj/item/clothing/accessory/UGNa_badge/officer
	)
	sort_order = 130


/datum/mil_rank/UGNa/o4
	name = "Major"
	name_short = "Mjr"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/o4,
		/obj/item/clothing/accessory/UGNa_badge/officer
	)
	sort_order = 140


/datum/mil_rank/UGNa/o5
	name = "Lieutenant Colonel"
	name_short = "LtC"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/o5,
		/obj/item/clothing/accessory/UGNa_badge/officer
	)
	sort_order = 150


/datum/mil_rank/UGNa/o6
	name = "Colonel"
	name_short = "Col"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/o6,
		/obj/item/clothing/accessory/UGNa_badge/officer
	)
	sort_order = 160


/datum/mil_rank/UGNa/o7
	name = "Brigadier General"
	name_short = "BrgG"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/o7,
		/obj/item/clothing/accessory/UGNa_badge/officer
	)
	sort_order = 170


/datum/mil_rank/UGNa/o8
	name = "Major General"
	name_short = "MjrG"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/o8,
		/obj/item/clothing/accessory/UGNa_badge/officer
	)
	sort_order = 180


/datum/mil_rank/UGNa/o9
	name = "Lieutenant General"
	name_short = "LtG"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/o9,
		/obj/item/clothing/accessory/UGNa_badge/officer
	)
	sort_order = 190


/datum/mil_rank/UGNa/o10
	name = "General"
	name_short = "Gen"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/o10,
		/obj/item/clothing/accessory/UGNa_badge/officer
	)
	sort_order = 200


/datum/mil_rank/UGNa/o10_alt
	name = "Field-Marshal"
	name_short = "FldM"
	accessory = list(
		/obj/item/clothing/accessory/UGNa_rank/o10_alt,
		/obj/item/clothing/accessory/UGNa_badge/officer
	)
	sort_order = 201
