/datum/map/torch/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/torch/get_map_info()
	. = list()
	. +=  "You're aboard the " + replacetext("<b>[station_name]</b>", "\improper", "") + ", a United Galactic Nations starship. Its primary mission is to search for scarce Phoron and explore, at least publicly."
	. +=  "The vessel is staffed with a mixture of UGN Fleet members, corporate personell, Peacekeepers, and civilians."
	. +=  "This area of space is uncharted, ungoverned, and untamed. Horrors hide in hulking masses of metal, while the Union threatens to tear the ship apart from the inside. Can you survive?"
	return jointext(., "<br>")

/datum/map/torch/send_welcome()
	var/obj/overmap/visitable/ship/torch = SSshuttle.ship_by_type(/obj/overmap/visitable/ship/torch)

	var/welcome_text = "<center><img src = sollogo.png /><br />[FONT_LARGE("<b>UGN Titen</b> Sensor Readings:")]<br>"
	welcome_text += "Report generated on [stationdate2text()] at [stationtime2text()]</center><br /><br />"
	welcome_text += "<hr>Current system:<br /><b>[torch ? system_name : "Unknown"]</b><br /><br>"

	if (torch) //If the overmap is disabled, it's possible for there to be no torch.
		var/list/space_things = list()
		welcome_text += "Current Coordinates:<br /><b>[torch.x]:[torch.y]</b><br /><br>"
		welcome_text += "Next system targeted for jump:<br /><b>[generate_system_name()]</b><br /><br>"
		welcome_text += "Travel Time to Pax:<br /><b>[rand(15,45)] days</b><br /><br>"
		welcome_text += "Time since last port visit:<br /><b>[rand(60,180)] days</b><br /><hr>"
		welcome_text += "Scan results show the following points of interest:<br />"

		for(var/zlevel in map_sectors)
			var/obj/overmap/visitable/O = map_sectors[zlevel]
			if(O.name == torch.name)
				continue
			if(istype(O, /obj/overmap/visitable/ship/landable)) //Don't show shuttles
				continue
			if (O.hide_from_reports)
				continue
			space_things |= O

		for(var/obj/overmap/visitable/O in space_things)
			var/location_desc = " at present co-ordinates."
			if(O.loc != torch.loc)
				var/bearing = get_bearing(torch, O)
				location_desc = ", bearing [bearing]."
			welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

		welcome_text += "<hr>"

	post_comm_message("UGN Titen Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "New [GLOB.using_map.company_name] Update available at all communication consoles.")
