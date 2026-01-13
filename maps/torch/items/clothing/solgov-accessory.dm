/obj/item/clothing/accessory/solgov
	name = "master solgov accessory"
	icon = 'maps/torch/icons/obj/obj_accessories_solgov.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi', slot_wear_suit_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi')
	w_class = ITEM_SIZE_TINY
	sprite_sheets = list(
		SPECIES_UNATHI = 'maps/torch/icons/mob/unathi/onmob_accessories_solgov_unathi.dmi'
		)

/*****
medals
*****/
/obj/item/clothing/accessory/medal/solgov
	name = "master solgov medal"
	desc = "You shouldn't be seeing this."
	icon = 'maps/torch/icons/obj/obj_accessories_solgov.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi', slot_wear_suit_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi')

//medals ranked from least to greatest

//Military medals
/obj/item/clothing/accessory/medal/solgov/mil/bronze_heart
	name = "\improper Bronze Heart medal"
	desc = "A bronze heart awarded by the SCG for members of the SCG Defense Forces who suffer injury or death in a combat zone."
	icon_state = "medal_bronze_heart"

/obj/item/clothing/accessory/medal/solgov/mil/home_guard
	name = "\improper Home Guard medal"
	desc = "A bronze medal awarded by the SCG for members of the SCG Defense Forces who have helped defend the border regions of Sol."
	icon_state = "medal_home_guard"

/obj/item/clothing/accessory/medal/solgov/mil/iron_star
	name = "\improper Iron Star medal"
	desc = "An iron star awarded by the SCG to members of the SCG Defense Forces who have performed acts of 'meritorious achievements or service.'"
	icon_state = "medal_iron_star"

/obj/item/clothing/accessory/medal/solgov/mil/medical
	name = "\improper Combat Medical Award"
	desc = "An electrum heart medal with a Staff of Hermes and sanguine cross, awarded by the SCG to individuals who have served as medical personnel in an active combat zone."
	icon_state = "medal_medical"

/obj/item/clothing/accessory/medal/solgov/mil/armed_forces
	name = "\improper Armed Forces Medal"
	desc = "A brass medal awarded by the SCG for members of the SCG Defense Forces who have performed distinguishing acts outside of direct combat with an enemy."
	icon_state = "medal_armed_forces"

/obj/item/clothing/accessory/medal/solgov/mil/silver_sword
	name = "\improper Silver Sword medal"
	desc = "A silver medal awarded by the SCG for members of the SCG Defense Forces who have demonstrated exceptional valor in combat."
	icon_state = "medal_silver_sword"

/obj/item/clothing/accessory/medal/solgov/mil/service_cross
	name = "\improper Superior Service Cross"
	desc = "A copper cross awarded by the SCG for members of the SCG Defense Forces who have performed acts of incredible valor against an enemy of Sol."
	icon_state = "medal_service_cross"

/obj/item/clothing/accessory/medal/solgov/mil/medal_of_honor
	name = "\improper Medal of Honor"
	desc = "An ornate golden medal awarded and conferred by the SCG Secretary-General to members of the SCG Defense Forces who have committed acts of 'conspicuous gallantry beyond the call of duty.'"
	icon_state = "medal_of_honor"

//Civilian medals
/obj/item/clothing/accessory/medal/solgov/civ/expeditionary
	name = "\improper Expeditionary Medal"
	desc = "An iron medal awarded by the UGN for individuals who have participated in missions outside the borders of the United Galactic Nations."
	icon_state = "medal_expeditionary"

/obj/item/clothing/accessory/medal/solgov/civ/sapientarian
	name = "\improper Sapientarian Peace Award"
	desc = "A copper medal awarded by the SCG for individuals who have contributed substantially to sapient rights or fostered greater brotherhood between sapient species. It is embossed with a date, text, and an image of famous Expeditionary Corps sapientarian, Samuel Carr."
	icon_state = "medal_sapientarian"

/obj/item/clothing/accessory/medal/solgov/civ/service
	name = "\improper Distinguished Service Medal"
	desc = "A golden sun medal awarded by the UGN to nonmilitary individuals who have made exceptional contributions to the United Galactic Nations."
	icon_state = "medal_service"

//medal boxes
/obj/item/storage/medalbox/sol
	desc = "A small aluminum box for holding decorations, adorned with gold-on-blue ribbons."
	icon_state = "medalbox_sol"

/obj/item/storage/medalbox/sol/bronze_heart
	startswith = list(
		/obj/item/clothing/accessory/medal/solgov/mil/bronze_heart,
		/obj/item/clothing/accessory/ribbon/solgov/medal/bronze_heart
	)

/obj/item/storage/medalbox/sol/home_guard
	startswith = list(
		/obj/item/clothing/accessory/medal/solgov/mil/home_guard,
		/obj/item/clothing/accessory/ribbon/solgov/medal/home_guard
	)

/obj/item/storage/medalbox/sol/iron_star
	startswith = list(
		/obj/item/clothing/accessory/medal/solgov/mil/iron_star,
		/obj/item/clothing/accessory/ribbon/solgov/medal/iron_star
	)

/obj/item/storage/medalbox/sol/medical
	startswith = list(
		/obj/item/clothing/accessory/medal/solgov/mil/medical,
		/obj/item/clothing/accessory/ribbon/solgov/medal/medical
	)

/obj/item/storage/medalbox/sol/armed_forces
	startswith = list(
		/obj/item/clothing/accessory/medal/solgov/mil/armed_forces,
		/obj/item/clothing/accessory/ribbon/solgov/medal/armed_forces
	)

/obj/item/storage/medalbox/sol/silver_sword
	startswith = list(
		/obj/item/clothing/accessory/medal/solgov/mil/silver_sword,
		/obj/item/clothing/accessory/ribbon/solgov/medal/silver_sword
	)

/obj/item/storage/medalbox/sol/service_cross
	startswith = list(
		/obj/item/clothing/accessory/medal/solgov/mil/service_cross,
		/obj/item/clothing/accessory/ribbon/solgov/medal/service_cross
	)

/obj/item/storage/medalbox/sol/medal_of_honor
	startswith = list(
		/obj/item/clothing/accessory/medal/solgov/mil/medal_of_honor,
		/obj/item/clothing/accessory/ribbon/solgov/medal/medal_of_honor
	)

/obj/item/storage/medalbox/sol/expeditionary
	startswith = list(
		/obj/item/clothing/accessory/medal/solgov/civ/expeditionary,
		/obj/item/clothing/accessory/ribbon/solgov/medal/expeditionary_medal
	)

/obj/item/storage/medalbox/sol/sapientarian
	startswith = list(
		/obj/item/clothing/accessory/medal/solgov/civ/sapientarian,
		/obj/item/clothing/accessory/ribbon/solgov/medal/sapientarian
	)

/obj/item/storage/medalbox/sol/service
	startswith = list(
		/obj/item/clothing/accessory/medal/solgov/civ/service,
		/obj/item/clothing/accessory/ribbon/solgov/medal/service
	)


/obj/item/clothing/accessory/solgov
	var/check_codex_val = FACTION_UGNFLEET

/obj/item/clothing/accessory/solgov/get_codex_value()
	return check_codex_val || ..()

/*****
patches
*****/
/obj/item/clothing/accessory/solgov/titen_patch
	name = "\improper titen mission patch"
	desc = "A fire resistant shoulder patch, worn by the personnel involved in the Titen Project, and the overall Operation Beacon."
	icon_state = "torchpatch"
	on_rolled_down = ACCESSORY_ROLLED_NONE
	slot = ACCESSORY_SLOT_INSIGNIA

/obj/item/clothing/accessory/solgov/ec_patch
	name = "\improper Observatory patch"
	desc = "A laminated shoulder patch, carrying the symbol of the United Galactic Nations Expeditionary Corpss Observatory, or UGNEO for short, the eyes and ears of the Expeditionary Corps' missions."
	icon_state = "ecpatch1"
	on_rolled_down = ACCESSORY_ROLLED_NONE
	slot = ACCESSORY_SLOT_INSIGNIA
	check_codex_val = FACTION_EXPEDITIONARY

/obj/item/clothing/accessory/solgov/ec_patch/fieldops
	name = "\improper Field Operations patch"
	desc = "A radiation-shielded shoulder patch, carrying the symbol of the United Galactic Nations Expeditionary Corps Field Operations, or UGNECFO for short, the hands-on workers of every Expeditionary Corps mission."
	icon_state = "ecpatch2"

/obj/item/clothing/accessory/solgov/cultex_patch
	name = "\improper Cultural Exchange patch"
	desc = "A radiation-shielded shoulder patch, denoting service in the the United Galactic Nations Expeditionary Corps Cultural Exchange program."
	icon_state = "ecpatch3"
	on_rolled_down = ACCESSORY_ROLLED_NONE
	slot = ACCESSORY_SLOT_INSIGNIA
	check_codex_val = FACTION_EXPEDITIONARY

/obj/item/clothing/accessory/solgov/fleet_patch
	name = "\improper First Fleet patch"
	desc = "A fancy shoulder patch carrying insignia of First Fleet, the Sol Guard, stationed in Sol."
	icon_state = "fleetpatch1"
	on_rolled_down = ACCESSORY_ROLLED_NONE
	slot = ACCESSORY_SLOT_INSIGNIA

/obj/item/clothing/accessory/solgov/fleet_patch/second
	name = "\improper Second Fleet patch"
	desc = "A well-worn shoulder patch carrying insignia of Second Fleet, the Home Defense Group, tasked with defense of Sol territories."
	icon_state = "fleetpatch2"

/obj/item/clothing/accessory/solgov/fleet_patch/third
	name = "\improper Third Fleet patch"
	desc = "A scuffed shoulder patch carrying insignia of Third Fleet, the Border Guard, guarding borders of Sol territory against Vox and pirates."
	icon_state = "fleetpatch3"

/obj/item/clothing/accessory/solgov/fleet_patch/fourth
	name = "\improper Fourth Fleet patch"
	desc = "A pristine shoulder patch carrying insignia of Fourth Fleet, stationed on Skrell border."
	icon_state = "fleetpatch4"

/obj/item/clothing/accessory/solgov/fleet_patch/fifth
	name = "\improper Fifth Fleet patch"
	desc = "A tactical shoulder patch carrying insignia of Fifth Fleet, the Quick Reaction Force, recently formed and outfited with the latest tech."
	icon_state = "fleetpatch5"

/*****
scarves
*****/
/obj/item/clothing/accessory/solgov/ec_scarf
	name = "UGN scarf"
	desc = "An UGN blue silk scarf."
	icon = 'icons/obj/clothing/obj_accessories.dmi'
	accessory_icons = list(slot_w_uniform_str = 'icons/mob/onmob/onmob_accessories.dmi', slot_wear_suit_str = 'icons/mob/onmob/onmob_accessories.dmi')
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_accessories_unathi.dmi'
		)
	icon_state = "whitescarf"
	on_rolled_down = ACCESSORY_ROLLED_NONE
	color = "#68a0ce"
	check_codex_val = FACTION_EXPEDITIONARY

/obj/item/clothing/accessory/solgov/ec_scarf/observatory
	name = "\improper Observatory scarf"
	desc = "A silk scarf in Expeditionary Corps Observatory section colors, meant to be worn with Expeditionary Corps uniforms."
	color = "#58bb59"

/obj/item/clothing/accessory/solgov/ec_scarf/fieldops
	name = "\improper Field Operations scarf"
	desc = "A silk scarf in Expeditionary Corps Field Operations section colors, meant to be worn with Expeditionary Corps uniforms."
	color = "#9f84b3"

/******
ribbons
******/
/obj/item/clothing/accessory/ribbon
	on_rolled_down = ACCESSORY_ROLLED_NONE

/obj/item/clothing/accessory/ribbon/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()
	if (parent)
		var/order = 0
		var/total = 0
		var/found = FALSE
		for(var/obj/item/clothing/accessory/ribbon/ribbon in parent.accessories)
			if(ribbon == src)
				found = TRUE
			total += 1
			if(!found)
				order += 1
			else if(total > 4)
				break

		var/per_row = total < 4 ? 1 : 2
		var/row = floor(order / per_row)
		var/column = (order - (row * per_row))
		ret.pixel_x = column - (per_row - 1)
		ret.pixel_y = (total > 1) - row
	return ret

/obj/item/clothing/accessory/ribbon/solgov
	name = "ribbon"
	desc = "A simple military decoration."
	icon_state = "ribbon_marksman"
	on_rolled_down = ACCESSORY_ROLLED_NONE
	slot = ACCESSORY_SLOT_MEDAL
	icon = 'maps/torch/icons/obj/obj_accessories_solgov.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi', slot_wear_suit_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi')
	w_class = ITEM_SIZE_TINY

//General ribbons/decorations
/obj/item/clothing/accessory/ribbon/solgov/marksman
	name = "marksmanship ribbon"
	desc = "A military ribbon awarded to members of the SCG Defense Forces for good marksmanship scores in training. Common in the days of energy weapons."
	icon_state = "ribbon_marksman"

/obj/item/clothing/accessory/ribbon/solgov/peace
	name = "peacekeeping ribbon"
	desc = "A military ribbon awarded to members of the SCG Defense Forces for service during a peacekeeping operation."
	icon_state = "ribbon_peace"

/obj/item/clothing/accessory/ribbon/solgov/frontier
	name = "frontier ribbon"
	desc = "A military ribbon awarded to members of the SCG Defense Forces for service along the frontier."
	icon_state = "ribbon_frontier"

/obj/item/clothing/accessory/ribbon/solgov/instructor
	name = "instructor ribbon"
	desc = "A military ribbon awarded to members of the SCG Defense Forces for service as an instructor or professional development agent."
	icon_state = "ribbon_instructor"

/obj/item/clothing/accessory/ribbon/solgov/combat
	name = "combat action ribbon"
	desc = "A military ribbon awarded to members of the SCG Defense Forces for serving in active combat. Colloquially known as 'blood gold.'"
	icon_state = "ribbon_combat"

/obj/item/clothing/accessory/ribbon/solgov/gaiaconflict
	name = "\improper Gaia Conflict ribbon"
	desc = "A military ribbon awarded to members of the SCG Defense Forces for serving in the Gaia Conflict."
	icon_state = "ribbon_gaiaconflict"

/obj/item/clothing/accessory/ribbon/solgov/distinguished_unit
	name = "distinguished unit ribbon"
	desc = "A military ribbon awarded to members of the SCG Defense Forces for service as part of a unit that has performed a distinguishing act of valor."
	icon_state = "ribbon_distinguished_unit"

//Medal ribbons
/obj/item/clothing/accessory/ribbon/solgov/medal/bronze_heart
	name = "\improper Bronze Heart ribbon"
	desc = "A military ribbon awarded by the SCG alongside the Bronze Heart. To be worn when it is impossible or undesirable to wear the Bronze Heart."
	icon_state = "ribbon_medal_bronze_heart"

/obj/item/clothing/accessory/ribbon/solgov/medal/home_guard
	name = "\improper Home Guard ribbon"
	desc = "A military ribbon awarded by the SCG alongside the Home Guard medal. To be worn when it is impossible or undesirable to wear the Home Guard medal."
	icon_state = "ribbon_medal_home_guard"

/obj/item/clothing/accessory/ribbon/solgov/medal/iron_star
	name = "\improper Iron Star ribbon"
	desc = "A military ribbon awarded by the SCG alongside the Iron Star medal. To be worn when it is impossible or undesirable to wear the Iron Star."
	icon_state = "ribbon_medal_iron_star"

/obj/item/clothing/accessory/ribbon/solgov/medal/armed_forces
	name = "\improper Armed Forces ribbon"
	desc = "A military ribbon awarded by the SCG alongside the Armed Forces Medal. To be worn when it is impossible or undesirable to wear the Armed Forces Medal."
	icon_state = "ribbon_medal_armed_forces"

/obj/item/clothing/accessory/ribbon/solgov/medal/silver_sword
	name = "\improper Silver Sword ribbon"
	desc = "A military ribbon awarded by the SCG alongside the Silver Sword medal. To be worn when it is impossible or undesirable to wear the Silver Sword."
	icon_state = "ribbon_medal_silver_sword"

/obj/item/clothing/accessory/ribbon/solgov/medal/service_cross
	name = "\improper Superior Service ribbon"
	desc = "A military ribbon awarded by the SCG alongside the Superior Service Cross. To be worn when it is impossible or undesirable to wear the Service Cross."
	icon_state = "ribbon_medal_service_cross"

/obj/item/clothing/accessory/ribbon/solgov/medal/medal_of_honor
	name = "\improper Medal of Honor ribbon"
	desc = "A military ribbon awarded by the SCG alongside the Medal of Honor. To be worn when it is impossible or undesirable to wear the Medal of Honor."
	icon_state = "ribbon_medal_of_honor"

/obj/item/clothing/accessory/ribbon/solgov/medal/expeditionary_medal
	name = "\improper Expeditionary Ribbon"
	desc = "A military ribbon awarded by the SCG alongside the Expeditionary Medal. To be worn when it is impossible or undesirable to wear the Expeditionary Medal."
	icon_state = "ribbon_medal_expeditionary"

/obj/item/clothing/accessory/ribbon/solgov/medal/sapientarian
	name = "\improper Sapientarian ribbon"
	desc = "A military ribbon awarded by the SCG alongside the Sapientarian Peace Award. To be worn when it is impossible or undesirable to wear the Sapientarian Award."
	icon_state = "ribbon_medal_sapientarian"

/obj/item/clothing/accessory/ribbon/solgov/medal/service
	name = "\improper Distinguished Service ribbon"
	desc = "A military ribbon awarded by the SCG alongside the Distinguished Service Medal. To be worn when it is impossible or undesirable to wear the Distinguished Service Medal."
	icon_state = "ribbon_medal_service"

/obj/item/clothing/accessory/ribbon/solgov/medal/medical
	name = "\improper Combat Medical ribbon"
	desc = "A military ribbon awarded by the SCG alongside the Combat Medical Award. To be worn when it is impossible or undesirable to wear the Combat Medical Award."
	icon_state = "ribbon_medal_medical"


/*************
specialty pins
*************/
/obj/item/clothing/accessory/solgov/specialty
	name = "speciality blaze"
	desc = "A color blaze denoting fleet personnel in some special role. This one is silver."
	icon_state = "marinerank_command"
	slot = ACCESSORY_SLOT_INSIGNIA
	icon_state = "fleetspec"
	on_rolled_down = ACCESSORY_ROLLED_NONE

/obj/item/clothing/accessory/solgov/specialty/janitor
	name = "custodial blazes"
	desc = "Purple blazes denoting a custodial technician."
	color = "#913da7"

/obj/item/clothing/accessory/solgov/specialty/brig
	name = "brig blazes"
	desc = "Red blazes denoting a brig chief."
	color = "#bf0000"

/obj/item/clothing/accessory/solgov/specialty/forensic
	name = "forensics blazes"
	desc = "Steel blazes denoting a forensic technician."
	color = "#939fb1"

/obj/item/clothing/accessory/solgov/specialty/atmos
	name = "atmospherics blazes"
	desc = "Turquoise blazes denoting an atmospheric technician."
	color = "#469085"

/obj/item/clothing/accessory/solgov/specialty/counselor
	name = "counselor blazes"
	desc = "Blue blazes denoting a counselor."
	color = "#4c9ce4"

/obj/item/clothing/accessory/solgov/specialty/chemist
	name = "pharmacy blazes"
	desc = "Orange blazes denoting a pharmacist."
	color = "#ff6600"

/obj/item/clothing/accessory/solgov/specialty/enlisted
	name = "enlisted qualification pin"
	desc = "An iron pin denoting some special qualification."
	icon_state = "fleetpin_enlisted"

/obj/item/clothing/accessory/solgov/specialty/officer
	name = "officer's qualification pin"
	desc = "A golden pin denoting some special qualification."
	icon_state = "fleetpin_officer"

/obj/item/clothing/accessory/solgov/specialty/pilot
	name = "pilot's qualification pin"
	desc = "An iron pin denoting the qualification to fly SCG spacecraft."
	icon_state = "pin_pilot"

/*****
badges
*****/
/obj/item/clothing/accessory/badge/solgov
	name = "master solgov badge"
	icon = 'maps/torch/icons/obj/obj_accessories_solgov.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi', slot_wear_suit_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi')

/obj/item/clothing/accessory/badge/solgov/security
	name = "security forces badge"
	desc = "A silver law enforcement badge. Stamped with the words 'Master at Arms'."
	icon_state = "silverbadge"
	slot_flags = SLOT_TIE
	badge_string = "United Galactic Nations"

/obj/item/clothing/accessory/badge/solgov/tags
	name = "dog tags"
	desc = "Plain identification tags made from a durable metal. They are stamped with a variety of informational details."
	gender = PLURAL
	icon_state = "tags"
	badge_string = "United Galactic Nations"
	slot_flags = SLOT_MASK | SLOT_TIE
	var/owner_rank
	var/owner_name
	var/owner_branch

/obj/item/clothing/accessory/badge/solgov/tags/proc/loadout_setup(mob/M)
	set_name(M.real_name)
	set_desc(M)

/obj/item/clothing/accessory/badge/solgov/tags/set_desc(mob/living/carbon/human/H)
	if(!istype(H))
		return
	owner_rank = H.char_rank && H.char_rank.name
	owner_name = H.real_name
	owner_branch = H.char_branch && H.char_branch.name
	var/singleton/cultural_info/culture = H.get_cultural_value(TAG_RELIGION)
	var/religion = culture ? culture.name : "Unset"
	desc = "[desc]\nName: [H.real_name] ([H.get_species()])[H.char_branch ? "\nBranch: [H.char_branch.name]" : ""]\nReligion: [religion]\nBlood type: [H.b_type]"

/obj/item/clothing/accessory/badge/solgov/representative
	name = "representative's badge"
	desc = "A leather-backed plastic badge with a variety of information printed on it. Belongs to a representative of the United Galactic Nations."
	icon_state = "solbadge"
	slot_flags = SLOT_TIE
	badge_string = "United Galactic Nations"

/*******
armbands
*******/
/obj/item/clothing/accessory/armband/solgov
	name = "master solgov armband"
	icon = 'maps/torch/icons/obj/obj_accessories_solgov.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi', slot_wear_suit_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi')

/obj/item/clothing/accessory/armband/solgov/mp
	name = "military police brassard"
	desc = "An armlet, worn by the crew to display which department they're assigned to. This one is black with 'MP' in white."
	icon_state = "mpband"

/obj/item/clothing/accessory/armband/solgov/ma
	name = "master at arms brassard"
	desc = "An armlet, worn by the crew to display which department they're assigned to. This one is white with 'MA' in navy blue."
	icon_state = "maband"

/obj/item/storage/box/armband
	name = "box of spare military police armbands"
	desc = "A box full of security armbands. For use in emergencies when provisional security personnel are needed."
	startswith = list(/obj/item/clothing/accessory/armband/solgov/mp = 5)

/*****************
armour attachments
*****************/
/obj/item/clothing/accessory/armor_tag/solgov
	name = "\improper UGN Flag"
	desc = "An emblem depicting the United Galactic Nations's flag."
	icon_override = 'maps/torch/icons/obj/obj_accessories_solgov.dmi'
	icon = 'maps/torch/icons/obj/obj_accessories_solgov.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi', slot_wear_suit_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi')
	icon_state = "solflag"
	slot = ACCESSORY_SLOT_ARMOR_MISC

/obj/item/clothing/accessory/armor_tag/solgov/ec
	name = "\improper UGN crest"
	desc = "An emblem depicting the crest of the United Galactic Nations."
	icon_state = "ecflag"

/obj/item/clothing/accessory/armor_tag/solgov/fleet
	name = "\improper Fleet crest"
	desc = "An emblem depicting the crest of the UGN Fleet."
	icon_state = "fleetflag"

/obj/item/clothing/accessory/armor_tag/solgov/sec
	name = "\improper POLICE tag"
	desc = "An armor tag with the word POLICE printed in silver lettering on it."
	icon_state = "sectag"

/obj/item/clothing/accessory/armor_tag/solgov/medic
	name = "\improper MEDIC tag"
	desc = "An armor tag with the word MEDIC printed in red lettering on it."
	icon_state = "medictag"

/obj/item/clothing/accessory/armor_tag/solgov/agent
	name = "\improper SFP AGENT tag"
	desc = "An armor tag with the words SFP AGENT printed in gold lettering on it."
	icon_state = "agenttag"

/obj/item/clothing/accessory/armor_tag/solgov/com
	name = "\improper UGN tag"
	desc = "An armor tag with the words United Galactic Nations printed in gold lettering on it."
	icon_state = "comtag"

/obj/item/clothing/accessory/armor_tag/solgov/com/sec
	name = "\improper POLICE tag"
	desc = "An armor tag with the words POLICE printed in gold lettering on it."

/obj/item/clothing/accessory/armor_tag/solgov/lead
	name = "\improper LEAD tag"
	desc = "An armor tag denoting the leader of a fireteam."
	icon_state = "leadtag"

/obj/item/clothing/accessory/helmet_cover/blue/sol
	name = "peacekeeper helmet cover"
	desc = "A fabric cover for armored helmets. This one is in SCG peacekeeper colors."

/**************
department tags
**************/
/obj/item/clothing/accessory/solgov/department
	name = "department insignia"
	desc = "Insignia denoting assignment to a department. These appear blank."
	icon_state = "dept_exped"
	on_rolled_down = "dept_exped_rolled"
	on_rolled_sleeves = "dept_exped_sleeves"
	slot = ACCESSORY_SLOT_FLASH
	accessory_flags = FLAGS_OFF

/obj/item/clothing/accessory/solgov/department/command
	name = "command insignia"
	desc = "Insignia denoting employment in the command department. These fit the standard UGN uniforms."
	color = "#e5ea4f"

/obj/item/clothing/accessory/solgov/department/command/service
	icon_state = "dept_exped_service"

/obj/item/clothing/accessory/solgov/department/command/fleet
	icon_state = "dept_fleet"
	desc = "Insignia denoting assignment to the command department. These fit Fleet uniforms."
	on_rolled_down = "dept_fleet_rolled"
	on_rolled_sleeves = "dept_fleet_sleeves"


/obj/item/clothing/accessory/solgov/department/engineering
	name = "Nitros Engineering insignia"
	desc = "Insignia denoting employment in Nitros Engineering. These fit the standard UGN Uniforms."
	color = "#ff7f00"

/obj/item/clothing/accessory/solgov/department/engineering/service
	icon_state = "dept_exped_service"

/obj/item/clothing/accessory/solgov/department/engineering/fleet
	icon_state = "dept_fleet"
	desc = "Insignia denoting assignment to the engineering department. These fit Fleet uniforms."
	on_rolled_down = "dept_fleet_rolled"
	on_rolled_sleeves = "dept_fleet_sleeves"


/obj/item/clothing/accessory/solgov/department/security
	name = "security insignia"
	desc = "Insignia denoting assignment to the security department. These fit Expeditionary Corps uniforms."
	color = "#bf0000"

/obj/item/clothing/accessory/solgov/department/security/service
	icon_state = "dept_exped_service"

/obj/item/clothing/accessory/solgov/department/security/fleet
	icon_state = "dept_fleet"
	desc = "Insignia denoting assignment to the security department. These fit Fleet uniforms."
	on_rolled_down = "dept_fleet_rolled"
	on_rolled_sleeves = "dept_fleet_sleeves"


/obj/item/clothing/accessory/solgov/department/medical
	name = "United Rocknall Medical insignia"
	desc = "Insignia denoting employment in the United Rocknall Corporation, specifically the medical department. These fit the standard UGN uniforms."
	color = "#4c9ce4"

/obj/item/clothing/accessory/solgov/department/medical/service
	icon_state = "dept_exped_service"
	color = "#7faad1"

/obj/item/clothing/accessory/solgov/department/medical/fleet
	icon_state = "dept_fleet"
	desc = "Insignia denoting assignment to the medical department. These fit Fleet uniforms."
	on_rolled_down = "dept_fleet_rolled"
	on_rolled_sleeves = "dept_fleet_sleeves"


/obj/item/clothing/accessory/solgov/department/supply
	name = "Cooran Supply insignia"
	desc = "Insignia denoting employment at Cooran Supply. These fit the standard UGN uniforms."
	color = "#bb9042"

/obj/item/clothing/accessory/solgov/department/supply/service
	icon_state = "dept_exped_service"

/obj/item/clothing/accessory/solgov/department/supply/fleet
	icon_state = "dept_fleet"
	desc = "Insignia denoting assignment to the supply department. These fit Fleet uniforms."
	on_rolled_down = "dept_fleet_rolled"
	on_rolled_sleeves = "dept_fleet_sleeves"


/obj/item/clothing/accessory/solgov/department/service
	name = "BIO insignia"
	desc = "Insignia denoting assignment to BIO. These fit the standard UGNuniforms."
	color = "#6eaa2c"

/obj/item/clothing/accessory/solgov/department/service/service
	icon_state = "dept_exped_service"

/obj/item/clothing/accessory/solgov/department/service/fleet
	icon_state = "dept_fleet"
	desc = "Insignia denoting assignment to the service department. These fit Fleet uniforms."
	on_rolled_down = "dept_fleet_rolled"
	on_rolled_sleeves = "dept_fleet_sleeves"


/obj/item/clothing/accessory/solgov/department/exploration
	name = "United Rocknall Exploration and Ecology insignia"
	desc = "Insignia denoting employment at the United Rocknall Corporation, specifically the Exploration and Ecology department. These fit the standard UGN uniforms."
	color = "#68099e"

/obj/item/clothing/accessory/solgov/department/exploration/service
	icon_state = "dept_exped_service"

/obj/item/clothing/accessory/solgov/department/exploration/fleet
	icon_state = "dept_fleet"
	desc = "Insignia denoting assignment to the exploration department. These fit Fleet uniforms."
	on_rolled_down = "dept_fleet_rolled"
	on_rolled_sleeves = "dept_fleet_sleeves"


/obj/item/clothing/accessory/solgov/department/research
	name = "research insignia"
	desc = "Insignia denoting assignment to the research department. These fit Expeditionary Corps uniforms."
	color = COLOR_RESEARCH

/obj/item/clothing/accessory/solgov/department/research/service
	icon_state = "dept_exped_service"

/*********
ranks - ec
*********/

/obj/item/clothing/accessory/solgov/rank
	name = "ranks"
	desc = "Insignia denoting rank of some kind. These appear blank."
	icon_state = "fleetrank"
	on_rolled_down = ACCESSORY_ROLLED_NONE
	slot = ACCESSORY_SLOT_RANK
	gender = PLURAL
	accessory_flags = ACCESSORY_REMOVABLE | ACCESSORY_HIGH_VISIBILITY

/obj/item/clothing/accessory/solgov/rank/ec
	name = "explorer ranks"
	desc = "Insignia denoting rank of some kind. These appear blank."
	icon_state = "ecrank_e1"

/obj/item/clothing/accessory/solgov/rank/ec/enlisted/e3
	name = "ranks (E-3 explorer)"
	desc = "Insignia denoting the rank of Explorer."
	icon_state = "ecrank_e3"

/obj/item/clothing/accessory/solgov/rank/ec/officer/o10
	name = "ranks (O-10 expedition commander)"
	desc = "Insignia denoting the rank of Expedition Commander."
	icon_state = "ecrank_o10"

/*********
ranks - nitros
*********/
/obj/item/clothing/accessory/solgov/rank/ec/nitros/e1
	name = "ranks (E-1 Engineer Recruit)"
	desc = "Nitros insignia denoting the rank of Engineer Recruit."
	icon_state = "ecrank_e1"

/obj/item/clothing/accessory/solgov/rank/ec/nitros/e2
	name = "ranks (E-2 Junior Engineer)"
	desc = "Nitros Insignia denoting the rank of Junior Engineer."
	icon_state = "ecrank_e1"

/obj/item/clothing/accessory/solgov/rank/ec/nitros/e3
	name = "ranks (E-3 Engineer)"
	desc = "Nitros Insignia denoting the rank of Engineer."
	icon_state = "ecrank_e3"

/obj/item/clothing/accessory/solgov/rank/ec/nitros/e4
	name = "ranks (E-4 Specialist Engineer)"
	desc = "Nitros Insignia denoting the rank of Specialist Engineer."
	icon_state = "ecrank_e5"

/obj/item/clothing/accessory/solgov/rank/ec/nitros/e5
	name = "ranks (E-5 Senior Engineer)"
	desc = "Nitros Insignia denoting the rank of Junior Engineer Officer."
	icon_state = "ecrank_e5"

/obj/item/clothing/accessory/solgov/rank/ec/nitros/e6
	name = "ranks (E-6 Master Engineer)"
	desc = "Nitros Insignia denoting the rank of Master Engineer."
	icon_state = "ecrank_e7"

/obj/item/clothing/accessory/solgov/rank/ec/nitros/o1
	name = "ranks (O-1 Junior Foreman)"
	desc = "Nitros Insignia denoting the rank of Junior Foreman."
	icon_state = "ecrank_o1"

/obj/item/clothing/accessory/solgov/rank/ec/nitros/o2
	name = "ranks (O-2 Foreman)"
	desc = "Nitros Insignia denoting the rank of Foreman."
	icon_state = "ecrank_o3"

/obj/item/clothing/accessory/solgov/rank/ec/nitros/o3
	name = "ranks (O-3 Senior Foreman)"
	desc = "Nitros Insignia denoting the rank of Senior Foreman."
	icon_state = "ecrank_o5"

/obj/item/clothing/accessory/solgov/rank/ec/nitros/o4
	name = "ranks (O-4 Master Foreman)"
	desc = "Nitros Insignia denoting the rank of Master Foreman."
	icon_state = "ecrank_o6"

/*********
ranks - rocknall
*********/
/obj/item/clothing/accessory/solgov/rank/ec/rocknall/e1
	name = "ranks (E-1 Intern)"
	desc = "Rocknall insignia denoting the rank of Intern."
	icon_state = "ecrank_e1"

/obj/item/clothing/accessory/solgov/rank/ec/rocknall/e2
	name = "ranks (E-2 Junior Associate)"
	desc = "Rocknall Insignia denoting the rank of Junior Associate."
	icon_state = "ecrank_e1"

/obj/item/clothing/accessory/solgov/rank/ec/rocknall/e3
	name = "ranks (E-3 Associate)"
	desc = "Rocknall Insignia denoting the rank of Associate."
	icon_state = "ecrank_e3"

/obj/item/clothing/accessory/solgov/rank/ec/rocknall/e4
	name = "ranks (E-4 Senior Associate)"
	desc = "Rocknall Insignia denoting the rank of Senior Associate."
	icon_state = "ecrank_e5"

/obj/item/clothing/accessory/solgov/rank/ec/rocknall/e5
	name = "ranks (E-5 Junior Team Specialist)"
	desc = "Rocknall Insignia denoting the rank of Junior Team Specialist."
	icon_state = "ecrank_e5"

/obj/item/clothing/accessory/solgov/rank/ec/rocknall/e6
	name = "ranks (E-6 Team Specialist)"
	desc = "Rocknall Insignia denoting the rank of Team Specialist."
	icon_state = "ecrank_e7"

/obj/item/clothing/accessory/solgov/rank/ec/rocknall/o1
	name = "ranks (O-1 Junior Supervisor)"
	desc = "Rocknall Insignia denoting the rank of Junior Supervisor."
	icon_state = "ecrank_o1"

/obj/item/clothing/accessory/solgov/rank/ec/rocknall/o2
	name = "ranks (O-2 Supervisor)"
	desc = "Rocknall Insignia denoting the rank of Supervisor."
	icon_state = "ecrank_o3"

/obj/item/clothing/accessory/solgov/rank/ec/rocknall/o3
	name = "ranks (O-3 Junior Administrator)"
	desc = "Rocknall Insignia denoting the rank of Junior Administrator."
	icon_state = "ecrank_o5"

/obj/item/clothing/accessory/solgov/rank/ec/rocknall/o4
	name = "ranks (O-4 Administrator)"
	desc = "Rocknall Insignia denoting the rank of Administrator."
	icon_state = "ecrank_o6"

/*********
ranks - BIO
*********/
/obj/item/clothing/accessory/solgov/rank/ec/bio/e1
	name = "ranks (E-1 Trainee)"
	desc = "BIO insignia denoting the rank of Trainee."
	icon_state = "ecrank_e1"

/obj/item/clothing/accessory/solgov/rank/ec/bio/e2
	name = "ranks (E-2 Junior Attendant)"
	desc = "BIO Insignia denoting the rank of Junior Attendant."
	icon_state = "ecrank_e3"

/obj/item/clothing/accessory/solgov/rank/ec/bio/e3
	name = "ranks (E-3 Attendant)"
	desc = "BIO Insignia denoting the rank of Attendant."
	icon_state = "ecrank_e5"

/obj/item/clothing/accessory/solgov/rank/ec/bio/e4
	name = "ranks (E-4 Senior Attendant)"
	desc = "BIO Insignia denoting the rank of Senior Attendant."
	icon_state = "ecrank_e7"

/obj/item/clothing/accessory/solgov/rank/ec/bio/o1
	name = "ranks (O-1 Junior Manager)"
	desc = "BIO Insignia denoting the rank of Junior Manager."
	icon_state = "ecrank_o1"

/obj/item/clothing/accessory/solgov/rank/ec/bio/o2
	name = "ranks (O-2 Manager)"
	desc = "BIO Insignia denoting the rank of Manager."
	icon_state = "ecrank_o3"

/*********
ranks - ABCDEFG
*********/
/obj/item/clothing/accessory/solgov/rank/ec/abc/e1
	name = "ranks (E-1 Junior Technician)"
	desc = "ABCDEFG Insignia denoting the rank of Junior Technician."
	icon_state = "ecrank_e1"

/obj/item/clothing/accessory/solgov/rank/ec/abc/e2
	name = "ranks (E-2 Technician)"
	desc = "ABCDEFG Insignia denoting the rank of Technician."
	icon_state = "ecrank_e3"

/obj/item/clothing/accessory/solgov/rank/ec/abc/e3
	name = "ranks (E-3 Senior Technician)"
	desc = "ABCDEFG Insignia denoting the rank of Senior Technician."
	icon_state = "ecrank_e3"

/obj/item/clothing/accessory/solgov/rank/ec/abc/e4
	name = "ranks (E-4 Specialist)"
	desc = "ABCDEFG Insignia denoting the rank of Specialist."
	icon_state = "ecrank_e5"

/obj/item/clothing/accessory/solgov/rank/ec/abc/e5
	name = "ranks (E-5 Senior Specialist)"
	desc = "ABCDEFG Insignia denoting the rank of Senior Specialist."
	icon_state = "ecrank_e7"

/obj/item/clothing/accessory/solgov/rank/ec/abc/o1
	name = "ranks (O-1 Analyst)"
	desc = "ABCDEFG Insignia denoting the rank of Analyst."
	icon_state = "ecrank_o1"

/obj/item/clothing/accessory/solgov/rank/ec/abc/o2
	name = "ranks (O-2 Expeditionary Director)"
	desc = "ABCDEFG Insignia denoting the rank of Expeditionary Director."
	icon_state = "ecrank_o5"

/obj/item/clothing/accessory/solgov/rank/ec/abc/o3
	name = "ranks (O-3 Regional Director)"
	desc = "ABCDEFG Insignia denoting the rank of Regional Director."
	icon_state = "ecrank_o6"

/*********
ranks - cooran supply
*********/
/obj/item/clothing/accessory/solgov/rank/ec/cooran/e1
	name = "ranks (E-1 Junior Agent)"
	desc = "Cooran Supply Insignia denoting the rank of Junior Agent."
	icon_state = "ecrank_e1"

/obj/item/clothing/accessory/solgov/rank/ec/cooran/e2
	name = "ranks (E-2 Agent)"
	desc = "Cooran Supply Insignia denoting the rank of Agent."
	icon_state = "ecrank_e3"

/obj/item/clothing/accessory/solgov/rank/ec/cooran/e3
	name = "ranks (E-3 Senior Agent)"
	desc = "Cooran Supply Insignia denoting the rank of Senior Agent."
	icon_state = "ecrank_e5"

/obj/item/clothing/accessory/solgov/rank/ec/cooran/e4
	name = "ranks (E-4 Chief Agent)"
	desc = "Cooran Supply Insignia denoting the rank of Chief Agent."
	icon_state = "ecrank_e7"

/obj/item/clothing/accessory/solgov/rank/ec/cooran/o1
	name = "ranks (O-1 Junior Supervisor)"
	desc = "Cooran Supply Insignia denoting the rank of Junior Supervisor."
	icon_state = "ecrank_o1"

/obj/item/clothing/accessory/solgov/rank/ec/cooran/o2
	name = "ranks (O-2 Supervisor)"
	desc = "Cooran Supply Insignia denoting the rank of Supervisor."
	icon_state = "ecrank_o3"

/obj/item/clothing/accessory/solgov/rank/ec/cooran/o3
	name = "ranks (O-3 Deck Chief)"
	desc = "Cooran Supply Insignia denoting the rank of Deck Chief."
	icon_state = "ecrank_o5"

/obj/item/clothing/accessory/solgov/rank/ec/cooran/o4
	name = "ranks (O-4 Loadmaster)"
	desc = "Cooran Supply Insignia denoting the rank of Loadmaster."
	icon_state = "ecrank_o6"

/************
ranks - fleet
************/
/obj/item/clothing/accessory/solgov/rank/fleet
	name = "naval ranks"
	desc = "Insignia denoting naval rank of some kind. These appear blank."
	icon_state = "fleetrank"

/obj/item/clothing/accessory/solgov/rank/fleet/enlisted
	name = "ranks (E-1 Peacekeeper Recruit)"
	desc = "Insignia denoting the rank of Peacekeeper Recruit."
	icon_state = "fleetrank_e1"

/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e2
	name = "ranks (E-2 Peacekeeper 3rd Class)"
	desc = "Insignia denoting the rank of Peacekeeper 3rd Class."
	icon_state = "fleetrank_e2"

/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e3
	name = "ranks (E-3 Peacekeeper 2nd Class)"
	desc = "Insignia denoting the rank of Peacekeeper 2nd Class."
	icon_state = "fleetrank_e3"

/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e4
	name = "ranks (E-4 Peacekeeper 1st Class)"
	desc = "Insignia denoting the rank of Peacekeeper 1st Class."
	icon_state = "fleetrank_e4"

/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/o1
	name = "ranks (O-1 Sub-lieutenant)"
	desc = "Insignia denoting the rank of Sub-lieutenant."
	icon_state = "fleetrank_o1"

/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/o2
	name = "ranks (O-2 lieutenant)"
	desc = "Insignia denoting the rank of Lieutenant."
	icon_state = "fleetrank_o2"

/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/o3
	name = "ranks (O-3 Peacekeeper Captain)"
	desc = "Insignia denoting the rank of Peacekeeper Captain."
	icon_state = "fleetrank_o3"

/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/o4
	name = "ranks (O-4 Peacekeeper Commander)"
	desc = "Insignia denoting the rank of Peacekeeper Commander."
	icon_state = "fleetrank_o4"




/************
ranks - fleet
************/
/obj/item/clothing/accessory/solgov/rank/ugn_fleet
	name = "naval ranks"
	desc = "Insignia denoting naval rank of some kind. These appear blank."
	icon_state = "fleetrank"

/obj/item/clothing/accessory/solgov/rank/ugn_fleet/enlisted/o1
	name = "ranks (O-1 ensign)"
	desc = "Insignia denoting the rank of Ensign."
	icon_state = "fleetrank_o1"

/obj/item/clothing/accessory/solgov/rank/ugn_fleet/enlisted/o2
	name = "ranks (O-2 2nd Lieutenant)"
	desc = "Insignia denoting the rank of 2nd Lieutenant."
	icon_state = "fleetrank_o2"

/obj/item/clothing/accessory/solgov/rank/ugn_fleet/enlisted/o3
	name = "ranks (O-3 1st Lieutenant)"
	desc = "Insignia denoting the rank of 1st Lieutenant."
	icon_state = "fleetrank_o3"

/obj/item/clothing/accessory/solgov/rank/ugn_fleet/enlisted/o4
	name = "ranks (O-4 commander)"
	desc = "Insignia denoting the rank of Commander."
	icon_state = "fleetrank_o4"

/obj/item/clothing/accessory/solgov/rank/ugn_fleet/enlisted/o5
	name = "ranks (O-5 captain)"
	desc = "Insignia denoting the rank of Captain."
	icon_state = "fleetrank_o5"
