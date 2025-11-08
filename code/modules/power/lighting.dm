// The lighting system
//
// consists of light fixtures (/obj/machinery/light) and light tube/bulb items (/obj/item/light)


// status values shared between lighting fixtures and items
#define LIGHT_STAGE_EMPTY 1
#define LIGHT_STAGE_WIRED 2
#define LIGHT_STAGE_COMPLETE 3

#define LIGHT_BULB_TEMPERATURE 400 //K - used value for a 60W bulb
#define LIGHTING_POWER_FACTOR 5		//5W per luminosity * range


#define LIGHTMODE_EMERGENCY "emergency_lighting"
#define LIGHTMODE_READY "ready"

#define LIGHT_PHORON_EXPLODE_THRESHOLD 5 // This many units of phoron have to be in the bulb for it to explode


// Light frames! The unfinished form of a light fixture.
/obj/machinery/light_construct
	name = "light fixture frame"
	desc = "A light fixture under construction."
	icon = 'icons/obj/structures/lighting.dmi'
	icon_state = "tube-construct-stage1"
	anchored = TRUE
	layer = ABOVE_HUMAN_LAYER

	/// The light fixture's construction state. One of `LIGHT_STAGE_*`.
	var/stage = LIGHT_STAGE_EMPTY
	/// The final light machine to create when construction is finished. Should be `/obj/machinery/light` or a subtype thereof.
	var/fixture_type = /obj/machinery/light
	/// Number of metal sheets created when dismantled.
	var/sheets_refunded = 2

/obj/machinery/light_construct/New(atom/newloc, newdir, atom/fixture = null)
	..(newloc)

	if(newdir)
		set_dir(newdir)

	if(istype(fixture))
		if(istype(fixture, /obj/machinery/light))
			fixture_type = fixture.type
		fixture.transfer_fingerprints_to(src)

	update_icon()

/obj/machinery/light_construct/on_update_icon()
	switch(stage)
		if(LIGHT_STAGE_EMPTY) icon_state = "tube-construct-stage1"
		if(LIGHT_STAGE_WIRED) icon_state = "tube-construct-stage2"
		if(LIGHT_STAGE_COMPLETE) icon_state = "tube-empty"

/obj/machinery/light_construct/examine(mob/user, distance)
	. = ..()
	if(distance > 2)
		return

	switch(stage)
		if(LIGHT_STAGE_EMPTY) to_chat(user, "It's an empty frame.")
		if(LIGHT_STAGE_WIRED) to_chat(user, "It's wired.")
		if(LIGHT_STAGE_COMPLETE) to_chat(user, "The casing is closed.")

/obj/machinery/light_construct/use_tool(obj/item/W, mob/living/user, list/click_params)
	if(isWrench(W))
		switch(stage)
			if (LIGHT_STAGE_EMPTY)
				playsound(loc, 'sound/items/Ratchet.ogg', 50, TRUE)
				to_chat(user, SPAN_NOTICE("You begin deconstructing \the [src]."))
				if (!user.do_skilled((W.toolspeed * 3) SECONDS, SKILL_CONSTRUCTION, src, do_flags = DO_REPAIR_CONSTRUCT))
					return TRUE
				new /obj/item/stack/material/steel( get_turf(loc), sheets_refunded )
				user.visible_message(
					SPAN_NOTICE("\The [user] deconstructs \the [src]."),
					SPAN_NOTICE("You deconstruct \the [src]!"),
					SPAN_ITALIC("You hear ratcheting and metal scraping.")
				)
				playsound(loc, 'sound/items/Deconstruct.ogg', 75, TRUE)
				qdel(src)
				return TRUE

			if (LIGHT_STAGE_WIRED)
				to_chat(user, SPAN_WARNING("You have to remove the wires first."))
				return TRUE

			if (LIGHT_STAGE_COMPLETE)
				to_chat(user, SPAN_WARNING("You have to unscrew the case first."))
				return TRUE

	if(isWirecutter(W))
		if (stage != LIGHT_STAGE_WIRED)
			to_chat(user, SPAN_WARNING("There are no exposed wires to cut!"))
			return TRUE
		stage = LIGHT_STAGE_EMPTY
		update_icon()
		new /obj/item/stack/cable_coil(get_turf(loc), 1, "red")
		user.visible_message(
			SPAN_NOTICE("\The [user] cuts the wires from \the [src]."),
			SPAN_NOTICE("You cut \the [src]'s wires and remove them from the frame'."),
			SPAN_ITALIC("You hear snipping and cables being cut.")
		)
		playsound(loc, 'sound/items/Wirecutter.ogg', 50, TRUE)
		return TRUE

	if(istype(W, /obj/item/stack/cable_coil))
		if (stage != LIGHT_STAGE_EMPTY)
			to_chat(user, SPAN_WARNING("There is no exposed, empty area to wire!"))
			return TRUE
		var/obj/item/stack/cable_coil/coil = W
		if (coil.use(1))
			stage = LIGHT_STAGE_WIRED
			update_icon()
			user.visible_message(
				SPAN_NOTICE("\The [user] adds wires to \the [src]."),
				SPAN_NOTICE("You add wires to \the [src].")
			)
			playsound(loc, 'sound/items/Deconstruct.ogg', 50, TRUE)
		return TRUE

	if(isScrewdriver(W))
		if (stage == LIGHT_STAGE_WIRED)
			stage = LIGHT_STAGE_COMPLETE
			update_icon()
			user.visible_message(
				SPAN_NOTICE("\The [user] closes \the [src]'s casing."),
				SPAN_NOTICE("You close \the [src]'s casing."),
				SPAN_ITALIC("You hear screws being tightened.")
			)
			playsound(loc, 'sound/items/Screwdriver.ogg', 50, TRUE)

			var/obj/machinery/light/newlight = new fixture_type(loc, src)
			newlight.set_dir(dir)

			transfer_fingerprints_to(newlight)
			qdel(src)
			return TRUE

	return ..()

/obj/machinery/light_construct/small
	name = "small light fixture frame"
	desc = "A small light fixture under construction."
	icon_state = "bulb-construct-stage1"
	fixture_type = /obj/machinery/light/small
	sheets_refunded = 1

/obj/machinery/light_construct/small/on_update_icon()
	switch(stage)
		if(LIGHT_STAGE_EMPTY) icon_state = "bulb-construct-stage1"
		if(LIGHT_STAGE_WIRED) icon_state = "bulb-construct-stage2"
		if(LIGHT_STAGE_COMPLETE) icon_state = "bulb-empty"

/obj/machinery/light_construct/spot
	name = "large light fixture frame"
	desc = "A large light fixture under construction."
	fixture_type = /obj/machinery/light/spot
	sheets_refunded = 3

/obj/machinery/light
	name = "light fixture"
	icon = 'icons/obj/structures/lighting.dmi'
	var/base_state = "tube"
	icon_state = "tube_map"
	desc = "A lighting fixture."
	anchored = TRUE
	layer = ABOVE_HUMAN_LAYER
	use_power = POWER_USE_ACTIVE
	idle_power_usage = 2
	active_power_usage = 20
	power_channel = LIGHT

	var/on = TRUE
	var/flickering = FALSE
	var/light_type = /obj/item/light/tube
	var/construct_type = /obj/machinery/light_construct
	var/datum/effect/spark_spread/s = new
	var/obj/item/light/lightbulb
	var/current_mode = null

	// HAUNTED LIGHTS
	var/tmp/next_flicker = 0
	var/process = /proc/_haunted_light_process


/obj/machinery/light/Initialize(mapload, obj/machinery/light_construct/construct = null)
	. = ..()
	s.set_up(1, 1, src)
	if(construct)
		construct_type = construct.type
		construct.transfer_fingerprints_to(src)
		set_dir(construct.dir)
	else
		var/light_color = get_color_from_area()
		lightbulb = new light_type(src, light_color)
		if(prob(lightbulb.broken_chance))
			broken(TRUE)
		on = powered()
	update_icon(FALSE)

	if(on && get_status() == LIGHT_OK)
		next_flicker = world.time + rand(1200, 4800)

	switch (dir)
		if(NORTH)  light_offset_y = WORLD_ICON_SIZE * 0.5
		if(SOUTH)  light_offset_y = WORLD_ICON_SIZE * -0.5
		if(EAST)   light_offset_x = WORLD_ICON_SIZE * 0.5
		if(WEST)   light_offset_x = WORLD_ICON_SIZE * -0.5

/obj/machinery/light/seton(state)
	..(state)
	if(!state)
		next_flicker = 0
	else if(get_status() == LIGHT_OK && !next_flicker)
		next_flicker = world.time + rand(1200, 4800)

/obj/machinery/light/broken()
	..()
	next_flicker = 0

/obj/machinery/light/fix()
	..()
	if(on)
		next_flicker = world.time + rand(1200, 4800)

/proc/_haunted_light_process(obj/machinery/light/L)
{
	if(!L || !L.on || L.get_status() != LIGHT_OK)
		return
	if(world.time < L.next_flicker)
		return

	var/roll = rand(1,5000)
	if(roll <= 1)
		L.broken()
		L.visible_message(SPAN_DANGER("\The [L] explodes in a shower of glass!"))
		playsound(L.loc, 'sound/effects/Glassbr1.ogg', 65, TRUE)
	else if(roll <= 25)
		L.s.set_up(2,1,L)
		L.s.start()
		L.flicker(1)
	else if(roll <= 250)
		L.flicker(rand(1,3))
	else
		L.flicker(1)

	L.next_flicker = world.time + rand(1200, 4800)
}
