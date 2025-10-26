/obj/item/clothing/suit/aquatic_mech
	name = "Aquatic Environment Suit"
	desc = "A sophisticated robotic suit filled with water, designed to keep aquatic species alive in air environments."
	icon = 'code/modules/aquatic_species/icons/aquatic_suit.dmi'
	icon_state = "aquaticsuit"
	item_state = "aquaticsuit"

	// Equipment properties
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEJUMPSUIT|HIDETAIL|HIDEGLOVES|HIDESHOES
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	armor = list(
		melee = 30,
		bullet = 25,
		laser = 20,
		energy = 15,
		bomb = 20,
		bio = 100,
		rad = 50
	)

	// Suit systems
	var/datum/aquatic_mech_systems/systems = null

/obj/item/clothing/suit/aquatic_mech/New()
	..()
	systems = new /datum/aquatic_mech_systems(src)

/obj/item/clothing/suit/aquatic_mech/Destroy()
	if(systems)
		qdel(systems)
	return ..()

/obj/item/clothing/suit/aquatic_mech/equipped(mob/user, slot)
	..()
	if(slot == slot_wear_suit && istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(H.species && H.species.type == /singleton/species/aquatic_mech)
			to_chat(H, SPAN_NOTICE("You feel the water circulating around your gills."))

/obj/item/clothing/suit/aquatic_mech/dropped(mob/user)
	..()
	if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(H.species && H.species.type == /singleton/species/aquatic_mech)
			to_chat(H, SPAN_DANGER("You've left your suit! You need to get back in water!"))

/obj/item/clothing/suit/aquatic_mech/attack_self(mob/user)
	if(systems)
		systems.show_ui(user)

/obj/item/clothing/suit/aquatic_mech/proc/process_suit()
	if(systems)
		systems.process()

// Suit systems datum
/datum/aquatic_mech_systems
	var/obj/item/clothing/suit/aquatic_mech/suit = null
	var/water_level = 100
	var/power_level = 100
	var/integrity = 100
	var/active = TRUE

	// Consumption rates
	var/water_consumption_rate = 0.1
	var/power_consumption_rate = 0.2

	New(obj/item/clothing/suit/aquatic_mech/S)
		suit = S

/datum/aquatic_mech_systems/Destroy()
	suit = null
	return ..()

/datum/aquatic_mech_systems/proc/is_functional()
	return active && integrity > 0 && water_level > 0 && power_level > 0

/datum/aquatic_mech_systems/proc/process()
	if(!active || !suit)
		return

	// Consume resources
	water_level = max(0, water_level - water_consumption_rate)
	if(water_level <= 0)
		trigger_emergency("WATER DEPLETED")

	power_level = max(0, power_level - power_consumption_rate)
	if(power_level <= 0)
		trigger_emergency("POWER DEPLETED")

	if(integrity <= 0)
		trigger_emergency("SUIT BREACH")

/datum/aquatic_mech_systems/proc/trigger_emergency(alert_type)
	active = FALSE
	if(suit && suit.loc && istype(suit.loc, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = suit.loc
		H.visible_message(
			SPAN_DANGER("[H]'s suit flashes: [alert_type]!"),
			SPAN_DANGER("CRITICAL: [alert_type]!")
		)

/datum/aquatic_mech_systems/proc/show_ui(mob/user)
	if(!user || !user.client)
		return

	var/dat = list()
	dat += "<h3>Aquatic Environment Suit</h3>"
	dat += "<hr>"
	dat += "<b>Water Level:</b> [water_level]%<br>"
	dat += "<b>Power Level:</b> [power_level]%<br>"
	dat += "<b>Integrity:</b> [integrity]%<br>"
	dat += "<b>Status:</b> [active ? "OPERATIONAL" : "MALFUNCTION"]<br>"
	dat += "<hr>"
	dat += "<small>Right-click suit to access advanced functions</small>"

	show_browser(user, jointext(dat, null), "window=aquatic_suit;size=400x300")

/datum/aquatic_mech_systems/proc/recharge_water(amount)
	water_level = min(100, water_level + amount)

/datum/aquatic_mech_systems/proc/recharge_power(amount)
	power_level = min(100, power_level + amount)

/datum/aquatic_mech_systems/proc/repair_integrity(amount)
	integrity = min(100, integrity + amount)
	if(integrity > 0 && !active)
		active = TRUE
