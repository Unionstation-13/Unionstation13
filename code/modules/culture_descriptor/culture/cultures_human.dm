// Establish a variable to keep track of accents
var/global/accent_backround = ""

/singleton/cultural_info/culture/generic
	name = CULTURE_OTHER
	description = "You are from one of the many small, relatively unknown cultures scattered across the galaxy."

/singleton/cultural_info/culture/human
	name = CULTURE_HUMAN
	description = "You are from one of various planetary cultures of humankind."
	secondary_langs = list(
		LANGUAGE_HUMAN_PAX,
		LANGUAGE_HUMAN_CHINESE,
		LANGUAGE_HUMAN_ARABIC,
		LANGUAGE_HUMAN_INDIAN,
		LANGUAGE_HUMAN_IBERIAN,
		LANGUAGE_HUMAN_NITROS,
		LANGUAGE_SPACER,
		LANGUAGE_SIGN
	)
/singleton/cultural_info/culture/human/martian_tunneller
	name = CULTURE_HUMAN_MARS
	description = "You were born on Mars, a planet scarred by a harrowing war, an oppresive\
	autocracy, and a failing economy. For your early years, you lived in scorched\
	huts, destroyed structures, and refugee camps. Your whole life has been under\
	the thumb of the Peacekeepers. However, your fate changed one day.\
	The UGN arrived, they took you, they took you to the stars. To your dreams.\
	Or that is what you thought."
	accent_backround = list(ACCENT_MSD)
	economic_power = 0.9
/singleton/cultural_info/culture/human/paxupper
	name = CULTURE_HUMAN_PAXUPPER
	description = "You are from the paradise planet of Pax. Wealth inequality has run rampant on the UGN’s capital, and you are certainly one of its products.\
	You are from one of the Upper class districts or privileged skylines overlooking the slums."
	economic_power = 1.4
	accent_backround = list(ACCENT_PAX)

/singleton/cultural_info/culture/human/venusian_surfacer
	name = CULTURE_HUMAN_PAXLOWER
	description = "You are from the paradise planet of Pax. Wealth inequality has run rampant on the UGN’s capital, and you are certainly one of its products.\
	You are from the slums or shanty towns that underlook the towering corporate buildings."
	economic_power = 0.9
	accent_backround = list(ACCENT_PAX)

/singleton/cultural_info/culture/human/venusian_upper
	name = CULTURE_HUMAN_VENUSIAN
	description = "You are from one of the many zones of Venus. Floating high above the ground of the planet on massive platforms, you are one of the many who live on one of the most decadent locations in the \
	SCG. As a Venusian, you know luxury, wealth and entertainment. Primarily a tourist destination, many of the permanent residents work in the tourism industry and are notably middle-income. \
	Those above are exceptionally wealthy: being hotel, casino, resort owners, politicians, bankers or rich retirees."
	economic_power = 1.4
	accent_backround = list(ACCENT_NSD)

/singleton/cultural_info/culture/human/paxlower
	name = CULTURE_HUMAN_VENUSLOW
	description = "You are from the surface of Venus, one of many employed in mining, industry and services industries. Venusian Surfacers are fairly poor, especially compared to Zoners and \
	have far lower standards of living than those above. A hardy people who spend much of their time working in mostly unpleasant conditions in order to prop up the society above, \
	surfacers are a people who value hard work, solidarity, unity and democracy. Unfortunately, while they support noble ideals, the reality of their situation does not always \
	match them, and much of the surface of Venus finds itself rife with organised crime, separatist groups and other criminal organisations."
	economic_power = 0.9
	accent_backround = list(ACCENT_MSD)

/singleton/cultural_info/culture/human/belter
	name = CULTURE_HUMAN_BELTER
	description = "You are from Ceres. You were a former prisoner, warden, or guard. You escaped by some whim of the UGN, and now you've found your way aboard the Titen in hopes of surviving. If your time on Ceres has taught you anything, its that power always breeds corruption."
	economic_power = 1
	accent_backround = list(ACCENT_SPACER)

/singleton/cultural_info/culture/human/ceti_south
	name = CULTURE_HUMAN_CETIS //change to nitros-6IPC
	description = "#IPC ONLY# You were constructed on the south pole of Nitros-6, abused by your creators, and left to rot in a magma pit for weeks. After the riots broke out, you were found and recruited into the Nitros-6 People's Front. It didn't last long. You're free now. What will you do?  #IPC ONLY#"
	economic_power = 1.2
	accent_backround = list(ACCENT_NITROS)

/singleton/cultural_info/culture/human/tadmor
	name = CULTURE_HUMAN_ANTIDO
	description = "The Antido people are stuck in a cataclysmic schism between the autocratic\
	and oppressive Antidian Eighth Reich with their extremist policies and the\
	corrupt, bloated, so-called egalitarian, and morally ambiguous WALDO\
	Initiative, both seeking to restore order to the now fractured state. Due to the\
	state of Antido being an ecologically protected planet, the UGN cannot bomb\
	the Pole to eradicate the Eighth Reich, and thus the tyranny still continues."
	economic_power = 1.2
	accent_backround = list(ACCENT_OUTER)

/singleton/cultural_info/culture/human/brahe
	name = CULTURE_HUMAN_BRAHE
	description = "The people of Brahe are extremely hostile to outsiders, and by a whim of fate,\
	you were able to escape. With a dying ecosystem, it is unlikely that the Brahe's\
	isolation will last long."
	economic_power = 1.0
	accent_backround = list(ACCENT_TRIBAL)

/singleton/cultural_info/culture/human/eos
	name = CULTURE_HUMAN_EOS
	description = "You come from the dying planet of Eos, scarred by your past.\
	Your people fear the sun, which is why you have boarded the Titen in hopes of escaping its wrath."
	economic_power = 0.8
	accent_backround = list(ACCENT_OUTER)

/singleton/cultural_info/culture/human/pirx_high
	name = CULTURE_HUMAN_PIRXABC
	description = "The ABCDEFG Corporation workers on Pirx, better known as The Storks due to\
	their tendency to abandon their children to the lower levels of the cities are the\
	ruling class of the Pirx Planetary Administration, and control the planets laws\
	almost completely due to a lack of UGN presence."
	economic_power = 1.9
	accent_backround = list(ACCENT_PIRX)

/singleton/cultural_info/culture/human/pirx_bug
	name = CULTURE_HUMAN_PIRXS
	description = "The Solus are an organized crime group living on Pirx, ruled by a clan nearly a\
	century old. They conduct seasonal raids on cities and are the main rivals to\
	the ABCDEFG Corporation's presence on Pirx."
	economic_power = 1.6
	accent_backround = list(ACCENT_PIRX)

/singleton/cultural_info/culture/human/stationeer
	name = CULTURE_HUMAN_STATION
	description = "You are from a station or other artificial habitat spread across Humanities reach. You are well adapted to the harsh lights and cramped spaces. Station-life acts like a melting pot of cultures across the galaxy."
	economic_power = 1.1
	language = LANGUAGE_SPACER
	accent_backround = list(ACCENT_SPACER)

/singleton/cultural_info/culture/human/offworld
	name = CULTURE_HUMAN_OFFWORLD
	description =  "You are from one of the many worlds that the UGN controls. "
	economic_power = 0.9
	language = LANGUAGE_HUMAN_PAX
	accent_backround = list(ACCENT_SPACER)

// NON UGN BELOW
/singleton/cultural_info/culture/human/spacer
	name = CULTURE_HUMAN_SPACER
	description = "You are not from any specific region, planet, or habitat. You drift through the stars on your journey through life. "
	economic_power = 1
	language = LANGUAGE_SPACER
	accent_backround = list(ACCENT_SPACER)

/singleton/cultural_info/culture/human/confederate_terra
	name = CULTURE_HUMAN_NITROS
	description = "You are from the Nitros system, hailing from the scarred landmasses of Nitros-11 or the stations surrounding Nitros-6.\
	Your once prosperous federated democracy has been in a state of disarray for nearly over a century.\
	Your people are known for their resilience, and hatred towards outsiders."
	language = LANGUAGE_HUMAN_NITROS
	economic_power = 1.1
	accent_backround = list(ACCENT_NITROS)

/singleton/cultural_info/culture/human/other
	name = CULTURE_HUMAN_OTHERS
	description = "You are from a star system far away from the UGN’s or Union’s grip, mystifying your background."
	economic_power = 1
	secondary_langs = list (LANGUAGE_HUMAN_PAX,
		LANGUAGE_HUMAN_CHINESE,
		LANGUAGE_HUMAN_ARABIC,
		LANGUAGE_HUMAN_INDIAN,
		LANGUAGE_HUMAN_IBERIAN,
		LANGUAGE_HUMAN_NITROS,
		LANGUAGE_SPACER,
		LANGUAGE_GUTTER,
		LANGUAGE_SIGN)
	accent_backround = list(ACCENT_SPACER)

/singleton/cultural_info/culture/human/vatgrown
	name = CULTURE_HUMAN_VATGROWN
	description = "You were grown in a vat, either as clone or as a gene-adapt, and you must hide your identity to avoid being criminalized for your existence."
	accent_backround = list(ACCENT_SPACER)

/singleton/cultural_info/culture/human/vatgrown/sanitize_name(name)
	return sanitizeName(name, allow_numbers=TRUE)

/singleton/cultural_info/culture/human/vatgrown/get_random_name(gender)
	// #defines so it's easier to read what's actually being generated
	#define LTR ascii2text(rand(65,90)) // A-Z
	#define NUM ascii2text(rand(48,57)) // 0-9
	#define FIRST capitalize(pick(gender == FEMALE ? GLOB.first_names_female : GLOB.first_names_male))
	#define NAME capitalize(pick(gender == FEMALE ? GLOB.first_names_female : GLOB.first_names_male)) + " " + capitalize(pick(GLOB.last_names))
	switch(rand(1,4))
		if(1) return NAME
		if(2) return "[LTR][LTR]-[FIRST]"
		if(3) return "[FIRST]-[NUM][NUM][NUM]"
		if(4) return "[NUM][NUM][NUM]-[FIRST]"
	. = 1 // Never executed, works around http://www.byond.com/forum/?post=2072419
	#undef LTR
	#undef NUM
	#undef FIRST
	#undef NAME
