// Autoaccent
var/global/list/auto_accent_map_mars = list( "moon" = "luna")
var/global/list/auto_accent_map_pax = list( "moon" = "luna", "nitros" = "nitroñ")
var/global/list/auto_accent_map_nitros = list( "credits" = "crэvs", "money" = "crэvs", "phoron" = "plásmium", "peacekeeper" = "soldár")
var/global/list/auto_accent_map_outer = list( "peacekeeper" = "militiaman")
var/global/list/auto_accent_map_spacer = list( "EVA" = "spacewalk", "supermatter" = "engine")
var/global/list/auto_accent_map_tribal = list( "earth" = "terra", "space" = "the void")
var/global/list/auto_accent_map_pirx = list( "storks" = "corporate", "pax" = "the capitol")
#define AUTOACCENT_NUM 3


/mob/living/proc/handle_auto_accent(message, datum/language/L)
	return message // no autoaccent at this level

/mob/living/carbon/human/handle_auto_accent(message, datum/language/L)
	if(!client || get_preference_value(/datum/client_preference/autoaccent) == GLOB.PREF_OFF) // no need to process if there's no client or they have autoaccent off.
		return message



// Temporary until other language accents come into play
/singleton/species/var/list/autoaccent_exempt = list(
	LANGUAGE_HUMAN_BRAHE,
	LANGUAGE_HUMAN_ARABIC,
	LANGUAGE_HUMAN_CHINESE,
	LANGUAGE_HUMAN_INDIAN,
	LANGUAGE_HUMAN_IBERIAN,
	LANGUAGE_HUMAN_NITROS,
	LANGUAGE_HUMAN_SELENIAN
);

/singleton/species/proc/handle_autoaccent(message, datum/language/lang, mode) {
	if(!autoaccent_map_pax)
		return message
	if(lang.flags & NO_STUTTER)
		return message
	if(autoaccent_exempt && (lang.name in autoaccent_exempt))
		return message
}
// Handles accent management
/mob/proc/initiate_accent(raw_message as text) {
	var/processed_message = raw_message

	switch(accent_background)
		if("MSD")
			for(var/word in accent_map_mars)
				var/replacement = accent_map_mars[word]
				processed_message = replacetext(processed_message, word, replacement)
		if("PSD")
			for(var/word in accent_map_pax)
				var/replacement = accent_map_pax[word]
				processed_message = replacetext(processed_message, word, replacement)
		if("SPACER")
			for(var/word in accent_map_spacer)
				var/replacement = accent_map_spacer[word]
				processed_message = replacetext(processed_message, word, replacement)
		if("NITROS")
			for(var/word in accent_map_nitros)
				var/replacement = accent_map_nitros[word]
				processed_message = replacetext(processed_message, word, replacement)
		if("OUTER")
			for(var/word in accent_map_outer)
				var/replacement = accent_map_outer[word]
				processed_message = replacetext(processed_message, word, replacement)
		if("TRIBAL")
			for(var/word in accent_map_tribal)
				var/replacement = accent_map_tribal[word]
				processed_message = replacetext(processed_message, word, replacement)
		if("PIRX")
			for(var/word in accent_map_pirx)
				var/replacement = accent_map_pirx[word]
				processed_message = replacetext(processed_message, word, replacement)
	return processed_message
}
