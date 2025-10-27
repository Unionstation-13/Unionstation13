/obj/machinery/aquatic_mech_charger
	name = "Aquatic Mech Charging Station"
	desc = "A specialized charging station for aquatic environment suits."
	icon = 'code/modules/aquatic_species/icons/aquatic_charger.dmi'
	icon_state = "charger"
	init_flags = INIT_MACHINERY_START_PROCESSING

	density = TRUE
	use_power = POWER_USE_IDLE
	idle_power_usage = 100
	active_power_usage = 5000

	// Charging properties
	var/charging = FALSE
	var/charge_rate = 2.0
	var/water_refill_rate = 1.5

/obj/machinery/aquatic_mech_charger/Process()
	if(stat & MACHINE_STAT_NOPOWER)
		charging = FALSE
		update_icon()
		return

	// Check for suit in range
	var/obj/item/clothing/suit/aquatic_mech/suit = find_suit()
	if(suit && suit.systems)
		charging = TRUE
		update_use_power(POWER_USE_ACTIVE)

		// Charge systems
		suit.systems.recharge_power(charge_rate)
		suit.systems.recharge_water(water_refill_rate)

		// Show feedback
		if(prob(5))
			visible_message("[src] hums as it charges the aquatic suit.")
	else
		charging = FALSE
		update_use_power(POWER_USE_IDLE)

	update_icon()

/obj/machinery/aquatic_mech_charger/proc/find_suit()
	// Check for suit on the ground
	for(var/obj/item/clothing/suit/aquatic_mech/suit in range(1, src))
		return suit

	// Check for person wearing suit
	for(var/mob/living/carbon/human/H in range(1, src))
		if(H.wear_suit && istype(H.wear_suit, /obj/item/clothing/suit/aquatic_mech))
			return H.wear_suit

	return null

/obj/machinery/aquatic_mech_charger/update_icon()
	if(charging)
		icon_state = "charger_active"
	else
		icon_state = "charger"

/obj/machinery/aquatic_mech_charger/use_tool(obj/item/W, mob/user, list/click_params)
	if(istype(W, /obj/item/clothing/suit/aquatic_mech))
		// Place suit on charger
		user.drop_from_inventory(W, get_turf(src))
		to_chat(user, SPAN_NOTICE("You place the aquatic suit on the charger."))
		return TRUE
	else
		return ..()

/obj/machinery/aquatic_mech_charger/attack_hand(mob/user)
	if(charging)
		to_chat(user, SPAN_NOTICE("The charger is currently active."))
	else
		to_chat(user, SPAN_NOTICE("The charger is idle."))
