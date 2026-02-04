/datum/job/captain
	title = "Commanding Officer"
	supervisors = "The United Galatic Nations"
	minimal_player_age = 35
	economic_power = 16
	minimum_character_age = list(SPECIES_HUMAN = 40)
	ideal_character_age = 50
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/command/CO
	allowed_branches = list(/datum/mil_branch/ugn_fleet)
	allowed_ranks = list(/datum/mil_rank/ugn_fleet/o5)
	skill_points = 36
	min_skill = list( // 9 points
		SKILL_BUREAUCRACY = SKILL_BASIC, // 1 point
		SKILL_SCIENCE = SKILL_TRAINED, // 4 point
		SKILL_PILOT = SKILL_TRAINED // 4 points
	)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/captain/get_description_blurb()
	return "You are the Commanding Officer. You are the top dog. You are an experienced professional officer in control of an entire ship, and ultimately responsible for all that happens onboard. Your job is to make sure [GLOB.using_map.full_name] fulfils its space exploration mission. Delegate to your First Lieutenant, your department heads, and your Senior Enlisted Advisor to effectively manage the ship, and listen to and trust their expertise."

/datum/job/captain/post_equip_rank(mob/person, alt_title)
	var/sound/announce_sound = (GAME_STATE <= RUNLEVEL_SETUP)? null : sound('sound/misc/boatswain.ogg', volume=20)
	captain_announcement.Announce("All hands, [alt_title || title] [person.real_name] on deck!", new_sound = announce_sound)
	..()

/datum/job/hop
	title = "First Lieutenant"
	supervisors = "the Commanding Officer"
	department = "Command"
	department_flag = COM
	minimal_player_age = 35
	economic_power = 14
	minimum_character_age = list(SPECIES_HUMAN = 35)
	ideal_character_age = 45
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/command/XO/fleet
	allowed_branches = list(/datum/mil_branch/ugn_fleet)
	allowed_ranks = list(
		/datum/mil_rank/ugn_fleet/o3
	)
	skill_points = 36
	min_skill = list( // 5 points
		SKILL_BUREAUCRACY = SKILL_TRAINED, // 2 points
		SKILL_COMPUTER = SKILL_BASIC, // 1 point
		SKILL_PILOT = SKILL_BASIC // 2 points
	)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

	access = list(
		access_security, access_brig, access_armory, access_forensics_lockers, access_heads, access_medical, access_morgue, access_tox, access_tox_storage,
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage, access_change_ids,
		access_ai_upload, access_teleporter, access_eva, access_bridge, access_all_personal_lockers, access_chapel_office, access_tech_storage,
		access_atmospherics, access_janitor, access_crematorium, access_kitchen, access_robotics, access_cargo, access_construction,
		access_chemistry, access_cargo_bot, access_hydroponics, access_manufacturing, access_library, access_lawyer, access_virology, access_cmo,
		access_qm, access_network, access_network_admin, access_surgery, access_research, access_mining, access_mining_office, access_mailsorting, access_heads_vault,
		access_mining_station, access_xenobiology, access_ce, access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat,
		access_gateway, access_sec_doors, access_psychiatrist, access_xenoarch, access_medical_equip, access_heads, access_hangar, access_guppy_helm,
		access_expedition_shuttle_helm, access_aquila, access_aquila_helm, access_solgov_crew, access_nanotrasen, access_chief_steward,
		access_emergency_armory, access_sec_guard, access_gun, access_expedition_shuttle, access_guppy, access_seneng, access_senmed, access_senadv,
		access_explorer, access_pathfinder, access_pilot, access_commissary, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
		access_petrov_toxins, access_petrov_chemistry, access_petrov_control, access_petrov_maint, access_rd, access_petrov_rd, access_torch_fax, access_torch_helm,
		access_radio_comm, access_radio_eng, access_radio_med, access_radio_sec, access_radio_sup, access_radio_serv, access_radio_exp, access_radio_sci, access_research_storage,
		access_fabrication, access_ai_core
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/hop/get_description_blurb()
	return "You are the First Lieutenant. You are an experienced senior officer, second in command of the ship, and are responsible for the smooth operation of the ship under your Commanding Officer. In their absence, you are expected to take their place. Your primary duty is directly managing department heads and all those outside a department heading. You are also responsible for the contractors and passengers aboard the ship. Consider the Senior Enlisted Advisor and Bridge Secretary tools at your disposal."

/datum/job/rd
	title = "Sci-Med Officer"
	supervisors = "The United Rocknall Corporation and the UGN"
	department_flag = COM|MED|SCI
	economic_power = 12
	minimal_player_age = 25
	minimum_character_age = list(SPECIES_HUMAN = 35)
	ideal_character_age = 60
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/research/cso
	allowed_branches = list(/datum/mil_branch/rocknall)
	allowed_ranks = list(/datum/mil_rank/rocknall/o4)

	skill_points = 36
	min_skill = list( // 16 points
		SKILL_BUREAUCRACY = SKILL_TRAINED, // 2 points
		SKILL_COMPUTER = SKILL_BASIC, // 1 point
		SKILL_FINANCE = SKILL_TRAINED, // 2 points
		SKILL_BOTANY = SKILL_BASIC, // 1 point
		SKILL_ANATOMY = SKILL_BASIC, // 4 points
		SKILL_DEVICES = SKILL_BASIC, // 2 points
		SKILL_SCIENCE = SKILL_TRAINED // 4 points
	)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

	access = list(
		access_tox, access_tox_storage, access_emergency_storage, access_teleporter, access_bridge, access_rd,
		access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology, access_aquila,
		access_RC_announce, access_keycard_auth, access_xenoarch, access_nanotrasen, access_sec_guard, access_heads,
		access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm,
		access_petrov_analysis, access_petrov_phoron, access_petrov_toxins, access_petrov_chemistry, access_petrov_rd,
		access_petrov_control, access_petrov_maint, access_pathfinder, access_explorer, access_eva, access_solgov_crew,
		access_expedition_shuttle_helm, access_maint_tunnels, access_torch_fax, access_radio_comm, access_radio_sci, access_radio_exp,
		access_radio_med, access_research_storage, access_fabrication, access_medical, access_morgue, access_external_airlocks,
		access_chapel_office, access_crematorium, access_chemistry, access_virology,
		access_cmo, access_surgery, access_psychiatrist, access_medical_equip, access_senmed, access_aquila_helm, access_torch_helm, access_ai_core
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/aidiag,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/rd/get_description_blurb()
	return "You are the Sci-Med Officer. You are responsible for both the research and medical department. You keep the crew healthy, as well as handle the science aspects of the ship. Send people to explore, don't get killed yourself, and advise the CO on relevant matters."
/datum/job/cmo
	title = "Medical Administrator"
	supervisors = "The Sci-Med Officer and your moral code"
	economic_power = 14
	minimal_player_age = 14
	minimum_character_age = list(SPECIES_HUMAN = 35)
	ideal_character_age = 48
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/command/cmo
	allowed_branches = list(/datum/mil_branch/rocknall)
	allowed_ranks = list(/datum/mil_rank/rocknall/o3)
	skill_points = 32
	min_skill = list( // 41 points
		SKILL_BUREAUCRACY = SKILL_BASIC, // 1 point
		SKILL_MEDICAL = SKILL_EXPERIENCED, // 16 points
		SKILL_ANATOMY = SKILL_EXPERIENCED, // 16 points
		SKILL_CHEMISTRY = SKILL_BASIC, // 4 points
		SKILL_DEVICES = SKILL_TRAINED // 4 points
	)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)

	access = list(
		access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_bridge, access_heads,
		access_chapel_office, access_crematorium, access_chemistry, access_virology, access_aquila,
		access_cmo, access_surgery, access_RC_announce, access_keycard_auth, access_psychiatrist,
		access_medical_equip, access_solgov_crew, access_senmed, access_hangar, access_torch_fax, access_radio_comm,
		access_radio_med
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/cmo/get_description_blurb()
	return "You are the Medical Administrator, your job is to maintain the order of medical and ensure paitent survival. You are a subordinate to the Sci-Med Administrator on account of your employment at the United Rocknall Corporation. Refer to Rocknall Code for incidents."

/datum/job/chief_engineer
	title = "Chief Engineer"
	supervisors = "the Commanding Officer and the Executive Officer"
	economic_power = 12
	minimum_character_age = list(SPECIES_HUMAN = 27)
	ideal_character_age = 40
	minimal_player_age = 14
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/command/chief_engineer
	allowed_branches = list(/datum/mil_branch/nitros)
	allowed_ranks = list(/datum/mil_rank/nitros/o1,
	/datum/mil_rank/nitros/o2,
	/datum/mil_rank/nitros/o3,
	/datum/mil_rank/nitros/o4
	)
	skill_points = 36
	min_skill = list( // 31 points
		SKILL_BUREAUCRACY  = SKILL_BASIC, // 1 point
		SKILL_COMPUTER = SKILL_TRAINED, // 2 points
		SKILL_EVA = SKILL_TRAINED, // 2 points
		SKILL_CONSTRUCTION = SKILL_TRAINED, // 2 points
		SKILL_ELECTRICAL = SKILL_TRAINED, // 4 points
		SKILL_ATMOS = SKILL_TRAINED, // 4 points
		SKILL_ENGINES = SKILL_EXPERIENCED // 16 points
	)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
						SKILL_DEVICES = SKILL_EXPERIENCED)

	access = list(
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_ai_upload, access_teleporter, access_eva, access_bridge, access_heads,
		access_tech_storage, access_robotics, access_atmospherics, access_janitor, access_construction,
		access_network, access_network_admin, access_ce, access_RC_announce, access_keycard_auth, access_tcomsat,
		access_solgov_crew, access_aquila, access_seneng, access_hangar, access_torch_fax, access_torch_helm, access_radio_comm,
		access_radio_eng, access_torch_helm, access_ai_core
		)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/ntnetmonitor,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports)

/datum/job/chief_engineer/get_description_blurb()
	return "You are the Chief Engineer. You manage the Engineering Department. You are responsible for the Senior engineer, who is your right hand and (should be) an experienced, skilled engineer. Delegate to and listen to them. Manage your engineers, ensure vessel power stays on, breaches are patched and problems are fixed. Advise the CO on engineering matters. You are also responsible for the maintenance and control of any vessel synthetics. You are an experienced engineer with a wealth of theoretical knowledge. You should also know vessel regulations to a reasonable degree."

/datum/job/hos
	title = "Marshal"
	supervisors = "The Security Code of Conduct and your own instincts"
	economic_power = 10
	minimal_player_age = 14
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 35
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/command/cos
	allowed_branches = list(
		/datum/mil_branch/fleet = /singleton/hierarchy/outfit/job/torch/crew/command/cos/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4
	)
	skill_points = 34
	min_skill = list( // 15 points
		SKILL_BUREAUCRACY = SKILL_TRAINED, // 2 points
		SKILL_EVA = SKILL_BASIC, // 1 point
		SKILL_COMBAT = SKILL_BASIC, // 2 points
		SKILL_WEAPONS = SKILL_TRAINED, // 6 points
		SKILL_FORENSICS = SKILL_BASIC // 4 points
	)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)

	access = list(
		access_security, access_brig, access_armory, access_forensics_lockers,
		access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_bridge, access_heads, access_aquila,
		access_hos, access_RC_announce, access_keycard_auth, access_sec_doors,
		access_solgov_crew, access_gun, access_emergency_armory, access_hangar, access_torch_fax,
		access_radio_comm, access_radio_sec, access_ai_core
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/hos/get_description_blurb()
	return "You are the Marshall. You manage ship security. The Masters at Arms and the Military Police, as well as the Brig Chief and the Forensic Technician. You keep the vessel safe. You handle both internal and external security matters. You are the law. You are subordinate to the CO and the First Lieutenant. You are expected to know the law, ship regulations, and alert procedure to a very high degree."

/datum/job/representative
	title = "United Galactic Nations Representative"
	department = "Support"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "the United Galactic Nations council"
	selection_color = "#2f2f7f"
	economic_power = 16
	minimal_player_age = 0
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/representative
	allowed_branches = list(/datum/mil_branch/solgov)
	allowed_ranks = list(/datum/mil_rank/sol/gov)
	skill_points = 26
	min_skill = list( // 5 points
		SKILL_BUREAUCRACY = SKILL_EXPERIENCED, // 4 points
		SKILL_FINANCE = SKILL_BASIC // 1 point
	)
	minimum_character_age = list(SPECIES_HUMAN = 27)

	access = list(
		access_representative, access_security, access_medical,
		access_bridge, access_cargo, access_solgov_crew,
		access_hangar, access_torch_fax, access_radio_comm
	)

	software_on_spawn = list(/datum/computer_file/program/reports)

/datum/job/representative/get_description_blurb()
	return "You are the United Galactic Nations Representative. You are a civilian assigned as both a diplomatic liaison for first contact and foreign affair situations on board. You are also responsible for monitoring for any serious missteps of justice, law or other ethical or legal issues aboard and informing and advising the Commanding Officer of them. You are a mid-level bureaucrat. You liaise between the crew and corporate interests on board. Send faxes back to the UGN on mission progress and important events."

/datum/job/bridgeofficer
	title = "Command Secretary"
	department = "Support"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Commanding Officer and heads of staff"
	selection_color = "#2f2f7f"
	minimal_player_age = 0
	economic_power = 8
	minimum_character_age = list(SPECIES_HUMAN = 22)
	ideal_character_age = 24
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/command/bridgeofficer
	allowed_branches = list(
		/datum/mil_branch/civilian = /singleton/hierarchy/outfit/job/torch/crew/command/bridgeofficer/fleet
	)
	allowed_ranks = list(/datum/mil_rank/civ/contractor)
	skill_points = 26
	min_skill = list( // 5 points
		SKILL_BUREAUCRACY = SKILL_BASIC, // 1 point
		SKILL_PILOT = SKILL_TRAINED // 4 points
	)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)


	access = list(
		access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
		access_bridge, access_janitor, access_kitchen, access_cargo, access_mailsorting, access_RC_announce, access_keycard_auth,
		access_solgov_crew, access_aquila, access_aquila_helm, access_guppy, access_guppy_helm, access_external_airlocks,
		access_eva, access_hangar, access_cent_creed, access_explorer, access_expedition_shuttle, access_expedition_shuttle_helm, access_teleporter,
		access_torch_fax, access_torch_helm, access_radio_comm, access_radio_eng, access_radio_exp, access_radio_serv, access_radio_sci, access_radio_sup
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports,
							 /datum/computer_file/program/deck_management)

/datum/job/bridgesecretary/get_description_blurb()
	return "You are a Bridge Secretary. You are a very junior officer. You do not give orders of your own. You are subordinate to all of command. You handle matters on the bridge and report directly to the CO and First Lieutenant. You take the Torch's helm and pilot the Aquila if needed. You monitor bridge computer programs and communications and report relevant information to command."
/datum/job/bridgeofficer
	title = "Bridge Officer"
	department = "Support"
	department_flag = SPT
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Commanding Officer and heads of staff"
	selection_color = "#2f2f7f"
	minimal_player_age = 0
	economic_power = 8
	minimum_character_age = list(SPECIES_HUMAN = 28)
	ideal_character_age = 32
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/command/bridgeofficer
	allowed_branches = list(
		/datum/mil_branch/ugn_fleet = /singleton/hierarchy/outfit/job/torch/crew/command/bridgeofficer/fleet
	)
	allowed_ranks = list(/datum/mil_rank/ugn_fleet/o1)
	skill_points = 26
	min_skill = list( // 9 points
		SKILL_BUREAUCRACY = SKILL_BASIC, // 1 point
		SKILL_PILOT = SKILL_EXPERIENCED // 8 points
	)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)


	access = list(
		access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
		access_bridge, access_janitor, access_kitchen, access_cargo, access_mailsorting, access_RC_announce, access_keycard_auth,
		access_solgov_crew, access_aquila, access_aquila_helm, access_guppy, access_guppy_helm, access_external_airlocks,
		access_eva, access_hangar, access_cent_creed, access_explorer, access_expedition_shuttle, access_expedition_shuttle_helm, access_teleporter,
		access_torch_fax, access_torch_helm, access_radio_comm, access_radio_eng, access_radio_exp, access_radio_serv, access_radio_sci, access_radio_sup
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports,
							 /datum/computer_file/program/deck_management)

/datum/job/bridgeofficer/get_description_blurb()
	return "You are a Bridge Officer. You are a skilled officer responsible for navigation and vessel operations. You work directly under the Commanding Officer and First Lieutenant, serving as the primary helmsman for the Titen and pilot for auxiliary craft. Your advanced piloting expertise makes you crucial for complex maneuvers and emergency situations. You monitor all bridge systems, communications, and navigation data, providing critical information to command staff during both routine operations and crisis scenarios"
