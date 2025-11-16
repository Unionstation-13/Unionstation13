//Initializes parts
#include maps/event/waldo_ship/WALDO_ship.dmm

/obj/overmap/visitable/ship/waldo_ship
	name = "waldo ship"
	desc = "A strange distress beacon is eminating from this WALDO ship"
	color = "#260fa7"
	vessel_mass = 3000
	max_speed = 1/(2 SECONDS)
	initial_generic_waypoints = list(
		"nav_waldo_ship_1",
		"nav_waldo_ship_2",
		"nav_waldo_ship_3",
		"nav_waldo_ship_antag"
	)

/obj/overmap/visitable/ship/waldo_ship/New(nloc, max_x, max_y)
	name = "WALDO Winston"
	..()

/datum/map_template/ruin/away_site/waldo_ship
	name = "Waldo Ship"
	id = "awaysite_waldo_ship"
	description = "Tiny moveable abandonded(or not) WALDO ship"
	suffixes = list("waldo/WALDO_ship.dmm")
	spawn_cost = 0.5
	area_usage_test_exempted_root_areas = list(/area/waldo_ship)

/obj/shuttle_landmark/nav_waldo/nav1
	name = "Small WALDO Ship Navpoint #1"
	landmark_tag = "nav_waldo_ship_1"

/obj/shuttle_landmark/nav_waldo/nav2
	name = "Small WALDO Ship Navpoint #2"
	landmark_tag = "nav_waldo_ship_2"

/obj/shuttle_landmark/nav_waldo/nav3
	name = "Small WALDO Ship Navpoint #3"
	landmark_tag = "nav_waldo_ship_3"

/obj/shuttle_landmark/nav_waldo/nav4
	name = "Small WALDO Ship Navpoint #4"
	landmark_tag = "nav_waldo_ship_antag"

//WALDO Access
var/global/const/access_waldo = "ACCESS_WALDO"
/datum/access/waldo
	id = access_waldo
	desc = "WALDO Operative Access"
	region = ACCESS_REGION_NONE

//WALDO Id's
/obj/item/card/id/waldo_ship/operative
	desc = "An identification card issued to WALDO Operatives, allowing them access to secure facilities."
	job_access_type = /datum/job/waldo_operative
	color = COLOR_OFF_WHITE
	detail_color = COLOR_GREEN_LIGHT

/obj/item/material/folder/envelope/preset/waldo_nuke
	name = "contingency envelope"
	desc = "A small envelope. The label reads 'open only in event of high emergency'."

/obj/item/material/folder/envelope/preset/waldo_nuke/Initialize()
	. = ..()
	var/obj/item/paper/R = new(src)
	R.set_content("\
	<b><center>Warning: Classified<br>Contingency - Instructions</b></center><br><br>\
	In the event of Anomaly Cheznov being compromised by outside forces, follow these instructions to initiate the intruder protocol. \
	Please read carefully.<br><br>\
	1) (Optional) Inform your partner and do NOT tell the intruders of your intent<br>\
	2) MEMORIZE THE CODE 48567 for the self destruct and press the contingency button in the storage room hallway as well as disarming the turrets and putting on a spacesuit.<br>\
	3) Use the provided nuclear disk to input it into the self destruct unit near the anomaly and then input the memorized code.<br>\
	4) You and your partner are to discreetly, if possible, grab the two nuclear cylinders stored in the contingency locker where this envelope is also stored.<br>\
	5) Place the cylinders into the slots<br>\
	6) Activate the inserters<br>\
	7) Enter the countdown duration of 1:00 minutes<br>\
	8) Disable the safety switch<br>\
	9) Seal the Cheznov Containment module. As long as no intruders have a WALDO operative ID, they will not be able to stop the countdown<br>\
	10) Have you and your partner ingest the provided cyanide pills to avoid agony during the detonation<br><br>\
	If you have any issues with the intruders, do not hesistate to use the provided weapons."
	)

//WALDO Operative
/datum/job/submap/waldo_operative
	title = "WALDO Operative"
	department = "WALDO"
	total_positions = 1
	spawn_positions = 1
	supervisors = "WALDO"
	selection_color = "#1a039b"
	economic_power = 4
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 30
	minimal_player_age = 7
	outfit_type = /obj/item/clothing/under/waldo
	skill_points = 21
	min_skill = list(
		SKILL_COMBAT = SKILL_MAX,
		SKILL_MEDICAL = SKILL_EXPERIENCED,
		SKILL_DEVICES = SKILL_TRAINED
	)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
						SKILL_ANATOMY	  = SKILL_MAX,
						SKILL_DEVICES = SKILL_MAX,
						SKILL_COMBAT = SKILL_MAX)

	access = list(
		access_waldo
	)

/datum/job/waldo_operative/get_description_blurb()
	return "You are a WALDO Operative. DO NOT CHOOSE THIS unless an admin has granted you permission through EVENT SIGNUP."

/area/ship/waldo_ship/bridge
	name = "\improper WALDO Command Center"
	icon_state = "command_center"
	icon = 'WALDO_icons.dmi'
	req_access = list(access_waldo)

/area/ship/waldo_ship/barracks
	name = "\improper WALDO Barracks"
	icon_state = "barracks"
	icon = 'WALDO_icons.dmi'
	req_access = list(access_waldo)

/area/ship/waldo_ship/engine
	name = "\improper Winston Engine Bay"
	icon_state = "engineering"
	icon = 'WALDO_icons.dmi'
	req_access = list(access_waldo)

/area/ship/waldo_ship/cheznovmod

	name = "\improper Cheznov Module"
	icon_state = "engineering"
	icon = 'WALDO_icons.dmi'
	req_access = list(access_waldo)

/obj/item/material/folder/envelope/preset/waldo_orientation
	name = "instructions envelope"
	desc = "A small envelope. The label reads 'WALDO Operative Orientation, OPEN IMMEDIETLY UPON AWAKENING'."

/obj/item/material/folder/envelope/preset/waldo_orientation/Initialize()
	. = ..()
	var/obj/item/paper/R = new(src)
	R.set_content("\
	<b><center>Warning: Classified<br>Orientation - Instructions</b></center><br><br>\
	Welcome to the WALDO Exploratory Initiative, responsible for recovering what little democracy our galaxy has left!\
	We send you this letter not as orientation, but as a warning.\
	For 57 months, the United Rocknall corporation has funded the WALDOEI, a cornerstone of WALDO's revolution against the opressive powers of the UGN\
	Today, on October 8th, we have been betrayed.\
	Remain steadfast, operatives.\
	Do not hesistate to shoot the URC on sight if they have the nerve to come to the Cheznov Module."
	)
