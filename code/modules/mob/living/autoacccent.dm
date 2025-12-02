// Autoaccent
#define AUTOACCENT_NUM 3


/mob/living/proc/handle_auto_accent(message, datum/language/L)
	return message // no autoaccent at this level

/mob/living/carbon/human/handle_auto_accent(message, datum/language/L)
	if(!client || get_preference_value(/datum/client_preference/autoaccent) == GLOB.PREF_OFF) // no need to process if there's no client or they have autoaccent off.
		return message

var/list/auto_accent_map_mars = list( "moon" = "luna")
var/list/auto_accent_map_pax = list( "moon" = "luna", "nitros" = "nitroñ")
var/list/auto_accent_map_nitros = list( "credits" = "crэvs", "money" = "crэvs", "phoron" = "plásmium", "peacekeeper" = "soldár")
var/list/auto_accent_map_outer = list( "peacekeeper" = "militiaman")
var/list/auto_accent_map_spacer = list( "EVA" = "spacewalk", "supermatter" = "engine")
var/list/auto_accent_map_tribal = list( "earth" = "terra", "space" = "the void")
var/list/auto_accent_map_pirx = list( "storks" = "corporate", "pax" = "the capitol")

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
	var/singleton/species/S = ishuman(src) ? get_species_singleton(src) : null
	if(accent_background == "MSD")
		for(var/word in S?.autoaccent_map_mars)
			var/value = S.singleton/species/autoaccent_map_mars[word]
			processed_message = replacetext( processed_message, word, value)
	if(accent_background == "PSD")
		for(var/word in S?.autoaccent_map_pax)
			var/value = S.autoaccent_map_pax[word]
			processed_message = replacetext( processed_message, word, value)
	if(accent_background == "SPACER")
		for(var/word in S?.autoaccent_map_spacer)
			var/value = S.autoaccent_map_spacer[word]
			processed_message = replacetext( processed_message, word, value)
	if(accent_background == "NITROS")
		for(var/word in S?.autoaccent_map_nitros)
			var/value = S.autoaccent_map_nitros[word]
			processed_message = replacetext( processed_message, word, value)
	if(accent_background == "OUTER")
		for(var/word in S?.autoaccent_map_outer)
			var/value = S.autoaccent_map_outer[word]
			processed_message = replacetext( processed_message, word, value)
	if(accent_background == "TRIBAL")
		for(var/word in S?.autoaccent_map_tribal)
			var/value = S.autoaccent_map_tribal[word]
			processed_message = replacetext( processed_message, word, value)
	if(accent_background == "PIRX")
		for(var/word in S?.autoaccent_map_pirx)
			var/value = S.autoaccent_map_pirx[word]
			processed_message = replacetext( processed_message, word, value)
	return processed_message
}
