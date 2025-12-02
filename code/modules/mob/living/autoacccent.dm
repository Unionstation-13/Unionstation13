// Autoaccent
#define AUTOACCENT_NUM 3


/mob/living/proc/handle_auto_accent(message, datum/language/L)
	return message // no autoaccent at this level

/mob/living/carbon/human/handle_auto_accent(message, datum/language/L)
	if(!client || get_preference_value(/datum/client_preference/autoaccent) == GLOB.PREF_OFF) // no need to process if there's no client or they have autoaccent off.
		return message

/singleton/species/var/list/autoaccent_map_mars = list( "moon" = "luna")
/singleton/species/var/list/autoaccent_map_pax = list( "moon" = "luna", "nitros" = "nitroñ")
/singleton/species/var/list/autoaccent_map_nitros = list( "credits" = "crэvs", "money" = "crэvs", "phoron" = "plásmium", "peacekeeper" = "soldár")
/singleton/species/var/list/autoaccent_map_outer = list( "peacekeeper" = "militiaman")
/singleton/species/var/list/autoaccent_map_spacer = list( "EVA" = "spacewalk", "supermatter" = "engine")
/singleton/species/var/list/autoaccent_map_tribal = list( "earth" = "terra", "space" = "the void")
/singleton/species/var/list/autoaccent_map_pirx = list( "storks" = "corporate", "pax" = "the capitol")

// Temporary until other language accents come into play
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

// Handles accent management
/mob/proc/initiate_accent(raw_message as text){
	var/processed_message = raw_message
	if(accent_backround == "MSD"){
		for(var/word in /singleton/species/autoaccent_map_mars){
		var/value = /singleton/species/autoaccent_map_mars[word]
		processed_message = replacetext( processed_message, word, value)
		}
	}
	if(accent_backround == "PSD"){
		for(var/word in /singleton/species/autoaccent_map_pax){
		var/value = /singleton/species/autoaccent_map_pax[word]
		processed_message = replacetext( processed_message, word, value)
		}
	}
	if(accent_backround == "SPACER"){
		for(var/word in /singleton/species/autoaccent_map_spacer){
		var/value = autoaccent_map_spacer[word]
		processed_message = replacetext( processed_message, word, value)
		}
	}
	if(accent_backround == "NITROS"){
		for(var/word in /singleton/species/autoaccent_map_nitros){
		var/value = autoaccent_map_nitros[word]
		processed_message = replacetext( processed_message, word, value)
		}
	}
	if(accent_backround == "OUTER"){
		for(var/word in /singleton/species/autoaccent_map_outer){
		var/value = autoaccent_map_outer[word]
		processed_message = replacetext( processed_message, word, value)
		}
	}
	if(accent_backround == "TRIBAL"){
		for(var/word in /singleton/species/autoaccent_map_tribal){
		var/value = /singleton/species/autoaccent_map_tribal[word]
		processed_message = replacetext( processed_message, word, value)
		}
	}
	if(accent_backround == "PIRX"){
		for(var/word in /singleton/species/autoaccent_map_pirx){
		var/value = /singleton/species/autoaccent_map_pirx[word]
		processed_message = replacetext( processed_message, word, value)
		}
	}
	return processed_message
}
