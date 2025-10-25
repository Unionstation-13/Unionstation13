/singleton/species/aquatic_mech
	name = "Aquatic Mech"
	name_plural = "Aquatic Mechs"
	description = "A fish-like aquatic species housed in a robotic water-filled suit for survival in air environments."
	icobase = 'code/modules/aquatic_species/icons/aquatic_mech.dmi'  // Custom fish-in-suit sprites
	deform = 'code/modules/aquatic_species/icons/aquatic_mech_deformed.dmi'  // Damage sprites
	preview_icon = 'code/modules/aquatic_species/icons/aquatic_mech_preview.dmi'  // For char creator

	// Environmental requirements
	breath_type = null  // Suit handles breathing
	breath_pressure = 0
	cold_level_1 = 200
	cold_level_2 = 150
	cold_level_3 = 100
	heat_level_1 = 400
	heat_level_2 = 450
	heat_level_3 = 600

	// Hybrid organs
	has_organ = list(
		BP_BRAIN = /obj/item/organ/internal/brain/fish,
		BP_EYES = /obj/item/organ/internal/eyes/fish,
		BP_HEART = /obj/item/organ/internal/heart/robotic/pump,
		BP_LUNGS = /obj/item/organ/internal/lungs/robotic/fishfilter
	)

	// Flags
	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_PAIN
	appearance_flags = SPECIES_APPEARANCE_HAS_SKIN_COLOR | SPECIES_APPEARANCE_HAS_UNDERWEAR  // For char creator
	spawn_flags = SPECIES_CAN_JOIN

	// Combat stats
	total_health = 150
	brute_mod = 0.7  // Armored suit
	burn_mod = 0.9   // Heat-resistant
	slowdown = 0.5

	// Custom bodyparts for suit
	bodypart_overrides = list(
		BP_HEAD = /obj/item/bodypart/head/aquatic_mech,
		BP_CHEST = /obj/item/bodypart/chest/aquatic_mech,
		BP_L_ARM = /obj/item/bodypart/l_arm/aquatic_mech,
		BP_R_ARM = /obj/item/bodypart/r_arm/aquatic_mech,
		BP_L_LEG = /obj/item/bodypart/l_leg/aquatic_mech,
		BP_R_LEG = /obj/item/bodypart/r_leg/aquatic_mech
	)

	// Verbs
	available_verbs = list(/mob/living/carbon/human/proc/eject_aquatic_mech)

/singleton/species/aquatic_mech/proc/handle_environment_special_aquatic(mob/living/carbon/human/H)
	if(!has_valid_suit(H))
		if(isturf(H.loc) && istype(H.loc, /turf/open/water))  // Safe in water
			return TRUE
		H.take_organ_damage(10, 0)
		H.visible_message(
			SPAN_DANGER("[H]'s aquatic body begins to dry out!"),
			SPAN_DANGER("You feel your body drying out! You need your suit or water!")
		)
		return FALSE
	return TRUE

/singleton/species/aquatic_mech/proc/has_valid_suit(mob/living/carbon/human/H)
	if(!H.wear_suit || !istype(H.wear_suit, /obj/item/clothing/suit/aquatic_mech))
		return FALSE
	var/obj/item/clothing/suit/aquatic_mech/suit = H.wear_suit
	return suit.systems && suit.systems.is_functional()

/singleton/species/aquatic_mech/proc
/singleton/species/aquatic_mech_ejected
	name = "Ejected Aquatic Mech"
	name_plural = "Ejected Aquatic Mechs"
	description = "A fish-like aquatic species, vulnerable without its robotic suit."
	icobase = 'code/modules/aquatic_species/icons/aquatic_mech_ejected.dmi'
	deform = 'code/modules/aquatic_species/icons/aquatic_mech_ejected_deformed.dmi'
	preview_icon = 'code/modules/aquatic_species/icons/aquatic_mech_ejected_preview.dmi'

	// Environmental requirements
	breath_type = "oxygen"  // Needs water or oxy
	breath_pressure = 16
	cold_level_1 = 200
	cold_level_2 = 150
	cold_level_3 = 100
	heat_level_1 = 330
	heat_level_2 = 350
	heat_level_3 = 400

	// Minimal organs
	has_organ = list(
		BP_BRAIN = /obj/item/organ/internal/brain/fish,
		BP_EYES = /obj/item/organ/internal/eyes/fish
	)

	// Flags
	species_flags = SPECIES_FLAG_NO_SCAN
	appearance_flags = SPECIES_APPEARANCE_HAS_SKIN_COLOR
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_NO_FBP_CONSTRUCTION  // No full-body prosthetics
	species_traits = list(TRAIT_NOLIMBS)  // No limbs

	// Combat stats
	total_health = 30  // Super frail
	brute_mod = 2.0
	burn_mod = 1.5
	slowdown = 1.0  // Slow without suit

	// Only head
	bodypart_overrides = list(
		BP_HEAD = /obj/item/bodypart/head/aquatic_mech_ejected
	)

	// Verbs
	available_verbs = list(/mob/living/carbon/human/proc/reenter_aquatic_mech)

/singleton/species/aquatic_mech_ejected/proc/handle_environment_special_aquatic(mob/living/carbon/human/H)
	if(isturf(H.loc) && istype(H.loc, /turf/open/water))  // Safe in water
		return TRUE
	H.take_organ_damage(10, 0)
	H.visible_message(
		SPAN_DANGER("[H]'s aquatic body begins to dry out!"),
		SPAN_DANGER("You feel your body drying out! You need water or your suit!")
	)
	return FALSE
/mob/living/carbon/human/proc/eject_aquatic_mech()
	if(!istype(species, /singleton/species/aquatic_mech))
		return
	var/turf/T = get_turf(src)
	var/obj/item/clothing/suit/aquatic_mech/suit = wear_suit
	if(suit)
		unequip_item(suit, TRUE)
	else
		suit = new /obj/item/clothing/suit/aquatic_mech(T)
	var/mob/living/carbon/human/newfish = new(T)
	newfish.set_species(/singleton/species/aquatic_mech_ejected)
	newfish.real_name = real_name
	newfish.ckey = ckey
	newfish.copy_from(src)  // Transfer mind, health
	newfish.forceMove(T)
	to_chat(newfish, SPAN_DANGER("You've ejected from your suit! Find water or re-enter!"))
	qdel(src)

/mob/living/carbon/human/proc/reenter_aquatic_mech()
	if(!istype(species, /singleton/species/aquatic_mech_ejected))
		return
	var/obj/item/clothing/suit/aquatic_mech/suit = locate() in range(1, src)
	if(!suit)
		to_chat(src, SPAN_WARNING("No aquatic suit nearby to re-enter!"))
		return
	var/turf/T = get_turf(src)
	var/mob/living/carbon/human/newsuited = new(T)
	newsuited.set_species(/singleton/species/aquatic_mech)
	newsuited.real_name = real_name
	newsuited.ckey = ckey
	newsuited.copy_from(src)
	newsuited.forceMove(T)
	newsuited.equip_to_slot_or_del(suit, slot_wear_suit)
	to_chat(newsuited, SPAN_NOTICE("You climb back into your aquatic suit."))
	qdel(src)
/proc/is_vacuum(turf/T)
	if(!T || !isspaceturf(T))
		return FALSE
	var/datum/gas_mixture/env = T.return_air()
	return env && env.return_pressure() < 10  // Low pressure = vacuum
/singleton/species/aquatic_mech/proc/handle_environment_special_aquatic(mob/living/carbon/human/H)
	if(!has_valid_suit(H))
		if(isturf(H.loc) && istype(H.loc, /turf/open/water))
			return TRUE
		var/damage = is_vacuum(H.loc) ? 15 : 10  // More damage in vacuum
		H.take_organ_damage(damage, 0)
		H.visible_message(
			SPAN_DANGER("[H]'s aquatic body begins to dry out!"),
			SPAN_DANGER("You feel your body drying out[ is_vacuum(H.loc) ? " and suffocating in vacuum" : ""]! You need your suit or water!")
		)
		return FALSE
	return TRUE
