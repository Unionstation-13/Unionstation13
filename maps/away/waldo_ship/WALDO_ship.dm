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
