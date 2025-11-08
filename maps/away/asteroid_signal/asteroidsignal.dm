#include "asteroidbase.dmm"
#include "asteroidbase_areas.dm"

/datum/map_template/ruin/away_site/asteroid_signal
	name = "Asteroid Signal"
	id = "awaysite_asteroid_signal"
	description = "A strange asteroid in the middle of a barren area"
	suffixes = list("asteroid_signal/asteroidbase.dmm")
	spawn_cost = 1
	accessibility_weight = 10
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED
