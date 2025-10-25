/obj/item/bodypart/head/aquatic_mech
	icon = 'code/modules/aquatic_species/icons/aquatic_mech.dmi'
	icon_state = "head_aquatic_mech"
	limb_id = "aquatic_mech"
	is_robotic = TRUE
	// Viewport overlay to show fish
	var/mutable_appearance/fish_viewport

/obj/item/bodypart/head/aquatic_mech/New()
	..()
	fish_viewport = mutable_appearance('code/modules/aquatic_species/icons/aquatic_mech.dmi', "fish_viewport", -BODY_ADJ_LAYER)
	update_icon()

/obj/item/bodypart/head/aquatic_mech/update_icon()
	..()
	if(owner)
		owner.add_overlay(fish_viewport)

/obj/item/bodypart/chest/aquatic_mech
	icon = 'code/modules/aquatic_species/icons/aquatic_mech.dmi'
	icon_state = "chest_aquatic_mech"
	limb_id = "aquatic_mech"
	is_robotic = TRUE

/obj/item/bodypart/l_arm/aquatic_mech
	icon = 'code/modules/aquatic_species/icons/aquatic_mech.dmi'
	icon_state = "l_arm_aquatic_mech"
	limb_id = "aquatic_mech"
	is_robotic = TRUE

/obj/item/bodypart/r_arm/aquatic_mech
	icon = 'code/modules/aquatic_species/icons/aquatic_mech.dmi'
	icon_state = "r_arm_aquatic_mech"
	limb_id = "aquatic_mech"
	is_robotic = TRUE

/obj/item/bodypart/l_leg/aquatic_mech
	icon = 'code/modules/aquatic_species/icons/aquatic_mech.dmi'
	icon_state = "l_leg_aquatic_mech"
	limb_id = "aquatic_mech"
	is_robotic = TRUE

/obj/item/bodypart/r_leg/aquatic_mech
	icon = 'code/modules/aquatic_species/icons/aquatic_mech.dmi'
	icon_state = "r_leg_aquatic_mech"
	limb_id = "aquatic_mech"
	is_robotic = TRUE

/obj/item/bodypart/head/aquatic_mech_ejected
	icon = 'code/modules/aquatic_species/icons/aquatic_mech_ejected.dmi'
	icon_state = "head_aquatic_mech_ejected"
	limb_id = "aquatic_mech_ejected"
