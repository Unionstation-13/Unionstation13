/obj/machinery/uniform_vendor
	name = "uniform vendor"
	desc= "A uniform vendor for utility, service, and dress uniforms."
	icon = 'icons/obj/machines/vending.dmi'
	icon_state = "uniform"
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	density = TRUE

	// Power
	use_power = 1
	idle_power_usage = 10
	var/vend_power_usage = 150 //actuators and stuff

	var/obj/item/card/id/ID
	var/list/uniforms = list()
	var/list/selected_outfit = list()

/obj/machinery/uniform_vendor/on_update_icon()
	if(MACHINE_IS_BROKEN(src))
		icon_state = "[initial(icon_state)]-broken"
	else if(is_powered())
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-off"

/obj/machinery/uniform_vendor/interface_interact(mob/user)
	interact(user)
	return TRUE

/obj/machinery/uniform_vendor/interact(mob/user)
	var/dat = list()
	dat += "User ID: <a href='byond://?src=\ref[src];ID=1'>[ID ? "[ID.registered_name], [ID.military_rank], [ID.military_branch]" : "--------"]</a>"
	dat += "<hr>"
	if(!ID)
		dat += "Insert your ID card to proceed."
	else
		var/datum/job/job = SSjobs.get_by_path(ID.job_access_type)
		if(job)
			uniforms = find_uniforms(ID.military_rank, ID.military_branch, job.department_flag)
		for(var/T in uniforms)
			dat += "<b>[T]</b> <a href='byond://?src=\ref[src];get_all=[T]'>Select All</a>"
			var/list/uniform = uniforms[T]
			for(var/piece in uniform)
				if(piece)
					var/obj/item/clothing/C = piece
					if(piece in selected_outfit)
						dat += "[SPAN_CLASS("linkOn", "[sanitize(initial(C.name))]")]<a href='byond://?src=\ref[src];rem=\ref[piece]'>X</a>"
					else if (can_issue(C))
						dat += "<a href='byond://?src=\ref[src];add=\ref[piece]'>[sanitize(initial(C.name))]</a>"
					else
						dat += "[sanitize(initial(C.name))] (ISSUED)"
			dat += "<hr>"
		dat += "<a href='byond://?src=\ref[src];vend=[1]'>Dispense</a>"
	dat = jointext(dat,"<br>")
	var/datum/browser/popup = new(user, "Uniform Dispenser","Uniform Dispenser", 300, 700, src)
	popup.set_content(dat)
	popup.open()

/obj/machinery/uniform_vendor/OnTopic(mob/user, href_list)
	if(href_list["ID"])
		if(ID)
			if(!issilicon(user))
				user.put_in_hands(ID)
			else
				ID.dropInto(loc)
			ID = null
			selected_outfit.Cut()
		else
			var/obj/item/card/id/I = user.get_active_hand()
			if(istype(I) && user.unEquip(I, src))
				ID = I
		. = TOPIC_REFRESH
	if(href_list["get_all"])
		if(!(href_list["get_all"] in uniforms))
			return TOPIC_NOACTION
		var/list/addition = uniforms[href_list["get_all"]]
		for(var/G in addition)
			if(can_issue(G))
				selected_outfit |= addition
		. = TOPIC_REFRESH
	if(href_list["add"])
		var/uniform_path = locate(href_list["add"])
		if(ispath(uniform_path))
			selected_outfit |= uniform_path
			. = TOPIC_REFRESH
		else
			. = TOPIC_NOACTION
	if(href_list["rem"])
		selected_outfit -= locate(href_list["rem"])
		. = TOPIC_REFRESH
	if(href_list["vend"])
		flick("uniform-vend", src)
		spawn_uniform(selected_outfit)
		selected_outfit.Cut()
		. = TOPIC_REFRESH
	if(.)
		attack_hand(user)

/obj/machinery/uniform_vendor/use_tool(obj/item/W, mob/living/user, list/click_params)
	if(istype(W, /obj/item/clothingbag))
		if(length(W.contents))
			to_chat(user, SPAN_WARNING("You must empty \the [W] before you can put it in \the [src]."))
			return TRUE
		to_chat(user, SPAN_NOTICE("You put \the [W] into \the [src]'s recycling slot."))
		qdel(W)
		return TRUE

	if (istype(W, /obj/item/card/id) && !ID && user.unEquip(W, src))
		to_chat(user, SPAN_NOTICE("You slide \the [W] into \the [src]!"))
		ID = W
		attack_hand(user)
		return TRUE
	return ..()

/obj/machinery/uniform_vendor/proc/spawn_uniform(list/selected_outfit)
	listclearnulls(selected_outfit)
	if(!GLOB.uniform_issued_items[user_id()])
		GLOB.uniform_issued_items[user_id()] = list()
	var/list/checkedout = GLOB.uniform_issued_items[user_id()]
	if(length(selected_outfit) > 1)
		var/obj/item/clothingbag/bag = new /obj/item/clothingbag
		for(var/item in selected_outfit)
			new item(bag)
			checkedout += item
		bag.dropInto(loc)
	else if (length(selected_outfit))
		var/obj/item/clothing/C = selected_outfit[1]
		new C(get_turf(src))
		checkedout += C

/obj/machinery/uniform_vendor/proc/user_id()
	if(!ID)
		return "UNKNOWN"
	else
		return "[ID.registered_name], [ID.military_rank], [ID.military_branch]"

/obj/machinery/uniform_vendor/proc/can_issue(gear)
	var/list/issued = GLOB.uniform_issued_items[user_id()]
	if(!issued || !length(issued))
		return TRUE
	return !(gear in issued)
