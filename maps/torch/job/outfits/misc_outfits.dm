/singleton/hierarchy/outfit/job/torch/passenger/passenger
	name = OUTFIT_JOB_NAME("Passenger - Titen")
	uniform = /obj/item/clothing/under/color/grey
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	id_types = list(/obj/item/card/id/torch/passenger)

/singleton/hierarchy/outfit/job/torch/passenger/passenger/journalist
	name = OUTFIT_JOB_NAME("Journalist - Titen")
	backpack_contents = list(/obj/item/device/camera/tvcamera = 1,
	/obj/item/clothing/accessory/badge/press = 1)

/singleton/hierarchy/outfit/job/torch/passenger/passenger/investor
	name = OUTFIT_JOB_NAME("Investor - Titen")

/singleton/hierarchy/outfit/job/torch/passenger/passenger/investor/post_equip(mob/living/carbon/human/H)
	..()
	var/obj/item/storage/secure/briefcase/money/case = new(H.loc)
	H.put_in_hands(case)

/singleton/hierarchy/outfit/job/torch/merchant
	name = OUTFIT_JOB_NAME("Merchant - Titen")
	uniform = /obj/item/clothing/under/color/black
	l_ear = null
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda
	id_types = list(/obj/item/card/id/torch/merchant)
/singleton/hierarchy/outfit/job/torch/ert/hostile
	name = OUTFIT_JOB_NAME("Fleet - Hostile")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat
	suit = /obj/item/clothing/suit/armor/pcarrier/light/sol
	head = /obj/item/clothing/head/helmet
	mask = /obj/item/clothing/mask/gas/half
	glasses = /obj/item/clothing/glasses/tacgoggles
	flags = OUTFIT_RESET_EQUIPMENT | OUTFIT_ADJUSTMENT_ALL_SKIPS
	l_ear = null

/singleton/hierarchy/outfit/job/torch/ert/hostile/leader
	name = OUTFIT_JOB_NAME("Fleet Leader - Hostile")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat
	suit = /obj/item/clothing/suit/armor/bulletproof/armsman
	head = /obj/item/clothing/head/helmet/armsman

/singleton/hierarchy/outfit/job/torch/ert/hostile/suit
	name = OUTFIT_JOB_NAME("Fleet Heavy - Hostile")
	back = /obj/item/rig/ert/fleet
	gloves = null
	suit = null
	head = null
