/obj/item/passport
	name = "passport"
	icon = 'icons/obj/passport.dmi'
	icon_state = "passport"
	force = 0.5
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("whipped")
	hitsound = 'sound/weapons/towelwhip.ogg'
	desc = "A passport. Its origin seems unknown."
	var/info
	var/fingerprint

/obj/item/passport/proc/set_info(mob/living/carbon/human/H)
	if(!istype(H))
		return
	var/singleton/cultural_info/culture = H.get_cultural_value(TAG_HOMEWORLD)
	var/residence = culture
	if (!culture.name || culture.name == HOME_SYSTEM_OTHER)
		residence = "Unset"
	if(H.dna)
		fingerprint = md5(H.dna.uni_identity)
	else
		fingerprint = "N/A"
	info = "\icon[src] [src]:\nName: [H.real_name]\nSpecies: [H.get_species()]\nPronouns: [H.pronouns]\nAge: [H.age]\nResidence: [residence]\nFingerprint: [fingerprint]"

/obj/item/passport/attack_self(mob/user as mob)
	user.visible_message(
		SPAN_ITALIC("[user] opens and checks [src]."),
		SPAN_ITALIC("You open [src] and check for some main information."),
		SPAN_ITALIC("You hear the faint rustle of pages."),
		5
	)
	to_chat(user, info || SPAN_WARNING("[src] is completely blank!"))

/obj/item/passport/scg
	name = "\improper UGN passport"
	icon_state = "passport_scg"
	desc = "A passport from the United Galactic Nations."

/obj/item/passport/venus
	name = "\improper Venusian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Venus, within United Galactic Nations space."

/obj/item/passport/mars
	name = "\improper Mars passport"
	icon_state = "passport_scg2"
	desc = "A passport from Mars, within United Galactic Nations space."

/obj/item/passport/phobos
	name = "\improper Phobos passport"
	icon_state = "passport_scg2"
	desc = "A passport from Phobos, within United Galactic Nations space."

/obj/item/passport/ceres
	name = "\improper Ceres passport"
	icon_state = "passport_scg2"
	desc = "A passport from Ceres, within United Galactic Nations space."

/obj/item/passport/pluto
	name = "\improper Pluto passport"
	icon_state = "passport_scg2"
	desc = "A passport from Pluto, within United Galactic Nations space."

/obj/item/passport/tiamat
	name = "\improper Tiamat passport"
	icon_state = "passport_scg2"
	desc = "A passport from Tiamat, within United Galactic Nations space."

/obj/item/passport/eos
	name = "\improper Eos passport"
	icon_state = "passport_scg2"
	desc = "A passport from Eos, within United Galactic Nations space."

/obj/item/passport/ceti_epsilon
	name = "\improper Ceti Epsilon passport"
	icon_state = "passport_scg2"
	desc = "A passport from Ceti Epsilon, within United Galactic Nations space."

/obj/item/passport/iolaus
	name = "\improper Iolaus passport"
	icon_state = "passport_scg2"
	desc = "A passport from Iolaus, within United Galactic Nations space."

/obj/item/passport/pirx
	name = "\improper Pirx passport"
	icon_state = "passport_scg2"
	desc = "A passport from Pirx, within United Galactic Nations space."

/obj/item/passport/tadmor
	name = "\improper Tadmor passport"
	icon_state = "passport_scg2"
	desc = "A passport from Tadmor, within United Galactic Nations space."

/obj/item/passport/brahe
	name = "\improper Brahe passport"
	icon_state = "passport_scg2"
	desc = "A passport from Brahe, within United Galactic Nations space."

/obj/item/passport/saffar
	name = "\improper Saffar passport"
	icon_state = "passport_scg2"
	desc = "A passport from Saffar, within United Galactic Nations space."

/obj/item/passport/theia
	name = "\improper Theia passport"
	icon_state = "passport_scg2"
	desc = "A passport from Theia, within United Galactic Nations space."

/obj/item/passport/south_gaia
	name = "\improper Gaia deleted port"
	icon_state = "passport_scg2"
	desc = "NULL"

/obj/item/passport/iccg
	name = "\improper FRN passport"
	icon_state = "passport_iccg"
	desc = "A passport from the Federated Republic of Nitros."

/obj/item/passport/north_gaia
	name = "\improper Gaia Deleted Port"
	icon_state = "passport_iccg2"
	desc = "NULL"

/obj/item/passport/old_gaia
	name = "\improper Gaia deleted Port"
	icon_state = "passport"
	desc = "NULL"

/obj/item/passport/terra
	name = "\improper Nitros-11 passport"
	icon_state = "passport_iccg2"
	desc = "A passport from Nitros-11, within FRN space."

/obj/item/passport/novayazemlya
	name = "\improper Zemlya passport"
	icon_state = "passport_iccg2"
	desc = "A passport from Zemlya, within ICCG space."

/obj/item/passport/sestris
	name = "\improper Sestris passport"
	icon_state = "passport_iccg2"
	desc = "A passport from Sestris, within ICCG space."

/obj/item/passport/bratis
	name = "\improper Bratis passport"
	icon_state = "passport_iccg2"
	desc = "A passport from Bratis, within ICCG space."

/obj/item/passport/putkari
	name = "\improper Putkari passport"
	icon_state = "passport_iccg2"
	desc = "A passport from Putkari, within ICCG space."

/obj/item/passport/altair
	name = "\improper Altair passport"
	icon_state = "passport_iccg2"
	desc = "A passport from Altair, within ICCG space."

/obj/item/passport/penglai
	name = "\improper Penglai passport"
	icon_state = "passport_iccg2"
	desc = "A passport from Penglai, within ICCG space."

/obj/item/passport/providence
	name = "\improper Providence passport"
	icon_state = "passport_iccg2"
	desc = "A passport from Providence, within ICCG space."

/obj/item/passport/valy
	name = "\improper Valy passport"
	icon_state = "passport_iccg2"
	desc = "A passport from Valy, within ICCG space."

/obj/item/passport/saveel
	name = "\improper Saveel passport"
	icon_state = "passport"
	desc = "A passport from Saveel, an isolationist frontier colony."

/obj/item/passport/magnitka
	name = "\improper Magnitka passport"
	icon_state = "passport"
	desc = "A passport from Magnitka, an independant colony."

/obj/item/passport/empiremohranda
	name = "\improper Mohranda passport"
	icon_state = "passport"
	desc = "A passport from the Empire of Mohranda, a frontier empire established on Lohrene and Mohranda, in the Luggust system."

/obj/item/passport/NCGO

	name = "\improper NCGO Passport"
	icon_state = "NCGO_passport"
	desc = "A passport from the New Christ Galactic Orthodox Church, a religous city state inside the UGN."
