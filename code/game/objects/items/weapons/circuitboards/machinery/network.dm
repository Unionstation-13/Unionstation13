/obj/item/stock_parts/circuitboard/network
	board_type = "machine"
	additional_spawn_components = list(
		/obj/item/stock_parts/power/apc/buildable = 1
	)

/obj/item/stock_parts/circuitboard/network/mainframe
	name = "circuit board (server mainframe)"
	build_path = /obj/machinery/network/mainframe
	origin_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4)
	req_components = list(
							/obj/item/stock_parts/manipulator = 2,
							/obj/item/stock_parts/subspace/filter = 1,
							/obj/item/stock_parts/subspace/crystal = 1,
							/obj/item/stock_parts/micro_laser/high = 2,
							/obj/item/stock_parts/computer/hard_drive/portable = 4)
