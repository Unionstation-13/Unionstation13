/obj/machinery/cybersec/satellite_dish
	name = "\improper Satellite Dish"
	icon = 'icons/obj/machines/cybersec/cybersecurity.dmi'
	icon_state = "sat_dish"
	base_type = /obj/machinery/r_n_d/server
	construct_state = /singleton/machine_construction/default/panel_closed
	machine_name = "\improper Satellite Dish"
	machine_desc = "A large quantumn antenna used for communication with Pax and PAXNET."
	req_access = list(access_cs) //Only cybersec can access
	var/working = TRUE
	var/destroyed = FALSE
	var/stage = 1 // Stages for repairs

/obj/machinery/cybersec/satellite_dish/resolve_attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/screwdriver) && stage == 1) // exact pathing is likely a temp placeholder; Also this is probably not hte intended way to do maintenance.
		to_chat(user, SPAN_NOTICE("You unscrew the maintenance panel. The panel refuses to come off, but you see a thin red strip on the top with text printed on it reading 'DO NOT USE HANDS; PLEASE USE CROWBAR OR PRYING TOOL'"))
		stage = 2
	if(istype(W, /obj/item/crowbar) && stage == 2)
		to_chat(user, SPAN_NOTICE("You pry off the maitnence panel. Its hinges keep it latched onto the satellite's body, however, now you can see a jumble of wires and a small, glass shielded panel with a red button behind it. If the ID system lets you in, which it won't, you might be able to get the panel open. Otherwise, its best to look back at the employee handbook."))
		stage = 3
	if(istype(W, /obj/item/device/multitool) && stage == 3)
		to_chat(user, SPAN_NOTICE("You pulse the ID scanner on the side of the satellite and the glass pane slides away. Voila. Your a hacker!"))
		stage = 3
	if(istype(W, /obj/item/card/id) && stage == 3)
		var/obj/item/card/id/ID = W
		if(ACCESS_CYBERSECURITY in ID.GetAccess()) // IDK if access_cybersecurity is valid... gulp
			to_chat(user, SPAN_NOTICE("As you question your life choices as a server administrator coming out here to fix the satellite, the small glass pane slides away, revealing a red button with the text above reading 'RESET'"))
			stage = 4
		else
			to_chat(user, SPAN_NOTICE("Nothing happens. Maybe the reader is busted... Anyway, its probably best to try and use your multitool instead."))
	if(stage = 4)
		if (working && !destroyed)
			to_chat(user, SPAN_NOTICE("With whatever you had in your hand, or maybe just your hand, you click the RESET button. The satellite whirs to life... You think."))
			stage = 5
		else
			to_chat(user, SPAN_NOTICE("Well... things have really gone to hell. It looks like the satellite had a bit... *too much fun* sticking out its head into space. It is busted for good."))
	if(istype(W, /obj/item/crowbar) && stage == 5)
		if(working)
			to_chat(user, SPAN_NOTICE("At least all this crap was for something. You seal the panel back in place. But you can only help but look at the floor where four dainty screw lie. Good thing they didn't fly off into space."))
			stage = 6
		if(!working)
			to_chat(user, SPAN_NOTICE("This was all for nothing. You pop the panel back in place with a quick twist of the crowbar."))
			stage = 6
	if(istype(W, /obj/item/screwdriver) && stage == 6)
		to_chat(user, SPAN_NOTICE("You screw the screws back in place. Thats all."))
		stage = 1
	()..

// /obj/machinery/cybersec/satellite_dish/go_offline()
// Do something and disable PAXNET... IDK how to do this. So this is all a comment for now.
// working = FALSE
