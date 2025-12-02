// Autoaccent
#define AUTOACCENT_NUM 3


/mob/living/proc/handle_auto_accent(message, datum/language/L)
	return message // no autoaccent at this level

/mob/living/carbon/human/handle_auto_accent(message, datum/language/L)
	if(!client || get_preference_value(/datum/client_preference/autoaccent) == GLOB.PREF_OFF) // no need to process if there's no client or they have autoaccent off.
		return message

/singleton/species/var/list/autoaccent_map_mars = list( "moon" = "luna")
/singleton/species/var/list/autoaccent_map_pax = list( "moon" = "luna", "nitros" = "nitroñ")
/singleton/species/var/list/autoaccent_map_nitros = list( "credits" = "crэvs", "money" = "crэvs", "phoron" = "plásmium", "peacekeeper" = "soldár", "a" = "á")
/singleton/species/var/list/autoaccent_map_outer = list( "peacekeeper" = "militiaman")
/singleton/species/var/list/autoaccent_map_spacer = list( "EVA" = "spacewalk", "supermatter" = "engine")
/singleton/species/var/list/autoaccent_map_tribal = list( "earth" = "terra", "space" = "the void")
/singleton/species/var/list/autoaccent_map_pirx = list( "storks" = "corporate", "pax" = "the capitol")

/singleton/species/var/list/autoaccent_exempt = list(
	LANGUAGE_HUMAN_BRAHE,
	LANGUAGE_HUMAN_ARABIC,
	LANGUAGE_HUMAN_CHINESE,
	LANGUAGE_HUMAN_INDIAN,
	LANGUAGE_HUMAN_IBERIAN,
	LANGUAGE_HUMAN_NITROS,
	LANGUAGE_HUMAN_SELENIAN
)

/singleton/species/proc/handle_autoaccent(message, datum/language/lang, mode)
	if(!autoaccent_map_pax)
		return message
	if(lang.flags & NO_STUTTER)	// Currently prevents EAL, Sign language, and emotes from autoaccenting
		return message
	if(autoaccent_exempt && (lang.name in autoaccent_exempt))
		return message

	var/map_mars = autoaccent_map_mars.Copy()
	var/map_pax = autoaccent_map_pax.Copy()
	var/map_nitros = autoaccent_map_nitros.Copy()
	var/map_spacer = autoaccent_map_spacer.Copy()
	var/map_pirx = autoaccent_map_pirx.Copy()
	var/map_outer = autoaccent_map_outer.Copy()
	var/map_tribal = autoaccent_map_tribal.Copy()

// // Manages Nitros accent
// 	while(length(message))
// 		var/min_index = 10000 // if the message is longer than this, the autoaccent is the least of your problems
// 		var/min_char = null
// 		for(var/char in map)
// 			var/i = findtext_char(message, char)
// 			if(!i) // no more of this word anywhere in the string, don't even bother searching next time
// 				map -= char
// 			else if(i < min_index)
// 				min_index = i
// 				min_char = char
// 		if(!min_char) // we didn't find any of the mapping words
// 			. += message
// 			break
// 		. += copytext_char(message, 1, min_index)
// 		if(copytext_char(message, min_index, min_index+1) == uppertext(min_char))
// 			switch(text2ascii(message, min_index+1))
// 				if(65 to 90) // A-Z, uppercase; uppercase R/S followed by another uppercase letter, uppercase the entire replacement string
// 					. += uppertext(pick(map[min_char]))
// 				else
// 					. += capitalize(pick(map[min_char]))
// 		else
// 			. += pick(map[min_char])
// 		message = copytext_char(message, min_index + 1)

// 	return jointext(., null)

//Below is for word replacement
