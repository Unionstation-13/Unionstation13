/singleton/cultural_info/faction/scg
	name = FACTION_UNITED_GALACTIC_NATIONS
	description = "The United Galactic Nations, abbreviated the UGN, is a collection of independant councillers founded on Pax. \
	They rule the sole democracy in this grim time. It is the commanding force of the Peacekeeper Division, as well as a managment for the many overreaching conglomerates of this galaxy. \
	They follow strict codes and laws but are quite lenient corporate wise due to corporate assistance during many conflicts. \
	UGN Influence is broad across the surrounding areas of Pax. When in doubt of your superiors please contact your UGN representative and they will inform you of your occupational circumstances. \
	By default, all staff, excluding United Rocknall Employees, are to follow UGN emergency code in the case of an emergency. "
	blacklisted_jobs = list(/datum/job/officer, /datum/job/hos, /datum/job/warden, /datum/job/detective, /datum/job/sec_physician)



/singleton/cultural_info/faction/scg/fleet
	name = FACTION_UGNFLEET
	description = "The United Galactic Nations fleet is the prevelant democratic military faction of the galaxy. They are tied for the largest military fleet with the Union, both being composed of around 800 ships.\
	You, for what ever reason or another, decided to resign from the fleet and were enlisted onboard the Titen, remember, depending on your role in the Fleet, it may change the level of respect people give you.\
	(Ex: an Admiral will get salutes from Peacekeepers while a private won't.)\
	Always remember that UGN veterans are trained in CQC at least to a mediocre level, and know how to respond in emergency situations."
	blacklisted_jobs = list(/datum/job/officer, /datum/job/hos, /datum/job/warden, /datum/job/detective, /datum/job/sec_physician)

/singleton/cultural_info/faction/torchco
	name = FACTION_URC_EXP
	description = "Founded by the United Rocknall Corporation and funded by the UGN, the Exploration and Ecology division, often abbreviated E&E, is the leading expedition and exploration faction of the galaxy"
	blacklisted_jobs = list(/datum/job/officer, /datum/job/hos, /datum/job/warden, /datum/job/detective, /datum/job/sec_physician)
	economic_power = 1.2

/singleton/cultural_info/faction/gcc
	name = FACTION_INDIE_CONFED
	description = "The Federated Republic of Nitros is a newcomer to the galactic spectrum, as it was created only 40 years ago in 2410. \
	Its greatest neighbor is the UGN, where it acquires most of its goods for trade and commerce, it is also home to Nitros Engineering, a pillar of the UGN's engineering wing. \
	It is located in the Nitros system, and due to the abundance of resources in that system,they are able to make exorbiant profits off of the ruins of the Great Union Invasion \
	The Federated Republic of Nitros is a externally independant pacifist nation, however singificant corruption has been unveiled over the past decades, particularly- \
	related to the large population of ex URC employees in their political ranks, and thus the majority of individuals believe the Republic of Nitros to be in leagues with the URC\
	In the year 2450, The Republic is a flourishing economic powerhouse, however individuals from the republic are often nickanmed as \"Wafflers\" in UGN space- \
	due to their often exorbiant inherited riches or pompous attitude."
	economic_power = 1.4
/singleton/cultural_info/faction/remote
	name = FACTION_EXPEDITIONARY
	description = "The Expeditionary Corps is an SCG agency tasked with exploration of uncharted space, uncharted worlds, \
	mineralogy surveys, xenoarchaeological studies, and more recently, the discovery of new alien life. \
	The EC performs a variety of tasks: discovering and cataloging stellar objects in Observatory, \
	initial surveys of prospective colony sites, in-depth exploration of uncharted worlds, staffing \
	long-term scientific outposts, and studying anomalies and xenoarcheological sites. \
	While not military, it was modelled in a naval style, with employees having ranks and uniforms. \
	Any SCG citizen of age (18 and older) with no outstanding SCG-wide warrants can sign up for a 2-year contract. \
	Officer candidates are required to have at least a bachelor's degree in a relevant field (astrogation, engineering, xenoarcheology, etc).  "
	blacklisted_jobs = list(/datum/job/officer, /datum/job/hos, /datum/job/warden, /datum/job/detective, /datum/job/sec_physician)


/singleton/cultural_info/faction/police
// Merge  this into Peacekeepers
	name = FACTION_SPACECOPS
	description = "The Sol Federal Police (SFP) is a government law enforcement agency tasked with enforcing United Galactic Nations law, \
	investigating breaches of law, fugitive recovery and transport, and securing ports of entry. \
	Some agents embedded with other organizations (e.g. an <l>Expeditionary Corps</l> ship) and are expected to answer to their superiours from those organizations. \
	Notable units are: Organized Crime & Vice (self-explanatory), Territory Support (ports of entry and helping local law enforcement), \
	Special Investigations (sensitive and urgent cases) and the Fugitive Recovery Division (for when local authorities are unable or unwilling to arrest someone). \
	The contractor SFP \"Trackers\" are also used find and arrest low-profile fugitives."





/singleton/cultural_info/faction/remote/neotrasen
	name = FACTION_NEOTRASEN
	description = "The NeoTrasen Corporation is a megaconglomerate entity that controls a\ majority of the management industry. Its employees are almost always\
members of command or heads of departments, as it prides itself\
on a capable workforce that is both ingenious and industrious\
However, in recent years, NeoTrasen has been exposed for scandalous\
activities revolving around the discovery of the Nitros system and the reported\
Xeno exploitation initiatives NeoTrasen has put into effect under its new management of the NeoBoard. On top of that, NeoTrasen has also been\
exposed in recent years for worker exploitation and wage theft,\
suggesting that NeoTrasen should be investigated further by journalists.\
At the present day, NeoTrasen is the wealthiest of the megacorps, valued at\
609 trillion Galactic Space Currency."
	economic_power = 1.2
	blacklisted_jobs = list(/datum/job/officer, /datum/job/hos, /datum/job/warden, /datum/job/detective, /datum/job/sec_physician)



/singleton/cultural_info/faction/remote/xynergy
	name = FACTION_URC
	description = "The United Rocknall Corporation is a massive Science and Medical conglomerate which owns almost every hospital and research facility in the galaxy.\
	Their current valuation is 5.5 Billion Galactic Space Currency(GSC) They are normally unfriendly to xenos and leave xeno life to the bottom of their command trees."
	economic_power = 1.1
	blacklisted_jobs = list(/datum/job/officer, /datum/job/hos, /datum/job/warden, /datum/job/detective, /datum/job/sec_physician)



/singleton/cultural_info/faction/remote/hephaestus
	name = FACTION_HEPHAESTUS
	description = "Nitros Engineering, known simply as NE or Nitros, is one of the largest megacorporations of the modern day. \
	They are the leading manufacturer of military grade personal weapons, assault vehicles, defence systems, and security measures. \
	Hephaestus has a somewhat controversial reputation as a participant in blatant war profiteering, compounded by their attempts to \
	exploit Unathi equipment and assets for their own gains. In spite of this, Hephaestus maintains a reputation for the quality and \
	reliability of their equipment, as well as its general affordability. Internally, Hephaestus is a desirable employer as a result of its \
	many employee benefits and focus on employee development, though many dread being transferred to one of the 'remote' branches."
	economic_power = 1.2
	blacklisted_jobs = list(/datum/job/officer, /datum/job/hos, /datum/job/warden, /datum/job/detective, /datum/job/sec_physician)



/singleton/cultural_info/faction/free
	name = FACTION_FREETRADE
	description = "Cooran Supply, commonly referred to as CS, is a family owned megacorporation that manages logistics across the stars \
	They bolster an enormous fleet of cargo vessels as well as a propieretary investor of Hilton Capital, a non-profit desirous to end the conflict between the union and the UGN \
	Yet, Cooran Supply is not all perfect, for in a recent investigation, they discovered almost 3/4th's of the workforce during an anonymous census, would work for another employer \
	if they paid more. This includes criminal activity! \
	CS also is admirabily good at catching smuggling operations. As long as the manager is not corrupt of course."
	economic_power = 1.8




/singleton/cultural_info/faction/pcrc
	name = FACTION_PEACEKEEPER
	description = "The Peacekeeper Division is a subdivision of the UGN and is a pseudo-military operation to secure and contain Union influence from spreading.\
The majority of union spies target the Peacekeeper division because of\
It's lucrative information revolving around it, such as the rumors spreading\
of a secret fusion bomb in development, or the rumored draconian methods\
they used to silence dissenters."



/singleton/cultural_info/faction/waldo
// merge into Peacekeeper
	name = FACTION_WALDO
	description = "WALDO (Weaponized Antido Liberation Defensive Organization)\
is an initiative founded in 2449 by Dr. Edward Waldo in spite of the Antido\ dictatorship. It is known for recruiting sleeper agents to its cause, and thus\
all members of WALDO are genuinely benign unless the words Where is WALDO? Are spoken; then they activate into a trance and will do the bidding of all WALDO higher-ups. All WALDO members carry an unlicensed firearm on\ them at all times. Their identity as WALDO conspirators cannot be known\
to the general public, lest the UGN execute them for terrorism."



/singleton/cultural_info/faction/dais
	name = FACTION_ABCDEFG
	description = "ABCDEFG, or Algebraic Boolean Coordinated Distribution Effort for Frontier Grounds, is a hyper advanced anonymously owned tech conglomerate.\
	Founded in an unknown year, it quickly rose to the top with its inventions of hi-tech consoles, tablets, and PDAs.\
	All electronics on the station, including the cybersecurity network, are owned and processed through ABCDEFG's servers.\
	In recent years, the URC and ABCDEFG have grown a festering rivalry.\
	Particularly because ABCDEFG is made primarily of Skrell and Vox with minimal human population. But in recent years they have grown to accept the humans."
	economic_power = 1.1

/singleton/cultural_info/faction/formerunion
	name = FACTION_FORMERUNION
	description = "You were once a citizen of the Union. For one reason or another, you recognized the regime for what it was, and set your mind on leaving. \
	The United Galactic Nations begrudgingly took you in, accepting that you have thrown off your chains for a better life. \
	Despite the immense ridicule, contempt, and discrimination afforded to you by other citizens of the UGN, you carry on to forge your own path."
	economic_power = 0.8



/singleton/cultural_info/faction/other
	name = FACTION_OTHER
	description = "You belong to one of the many other factions that operate in the galaxy. Too numerous to list, these factions represent a variety of interests, purposes, intents and goals."
