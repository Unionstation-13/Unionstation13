GLOBAL_LIST_EMPTY(uniform_issued_items)
/datum/preferences/var/list/uniforms_by_job	= list()	   //List of uniform prefs assigned to each job

/*	Outfit structures
	branch
	branch/department
	branch/department/officer
	branch/department/officer/command

	The one exception to the above is the command department, due to the fact that you have to be an officer to
	be in command, and there are no variants as a result. Also no special CO uniform :(
*/
/proc/find_uniforms(datum/mil_rank/user_rank, datum/mil_branch/user_branch, department, include_pt = TRUE, include_dress = TRUE)
	var/singleton/hierarchy/mil_uniform/user_outfit = GET_SINGLETON(/singleton/hierarchy/mil_uniform)
	var/mil_uniforms = user_outfit
	for(var/singleton/hierarchy/mil_uniform/child in user_outfit.children)
		if(is_type_in_list(user_branch, child.branches))
			user_outfit = child
	if(user_outfit == mil_uniforms) //We haven't found a branch
		return null //Return no uniforms, which will cause the machine to spit out an error.

	// we have found a branch.
	if(department == COM) //Command only has one variant and they have to be an officer
		for(var/singleton/hierarchy/mil_uniform/child in user_outfit.children)
			if(child.departments & COM)
				user_outfit = child
				for(var/singleton/hierarchy/mil_uniform/seniorchild in user_outfit.children) //Check for variants of command outfits
					if(user_rank.sort_order >= seniorchild.min_rank && user_outfit.min_rank < seniorchild.min_rank)
						user_outfit = seniorchild
	else
		var/tmp_department = department
		tmp_department &= ~COM //Parse departments, with complete disconsideration to the command flag (so we don't flag 2 outfit trees)

		for(var/singleton/hierarchy/mil_uniform/child in user_outfit.children) //find base department outfit
			if(child.departments & tmp_department)
				user_outfit = child
				break
		for(var/singleton/hierarchy/mil_uniform/child in user_outfit.children) //find highest applicable ranking department outfit
			if(user_rank.sort_order >= child.min_rank && user_outfit.min_rank < child.min_rank)
				user_outfit = child
		if(department & COM) //user is in command of their department
			if(user_outfit.children[1])// Command outfit exists
				user_outfit = user_outfit.children[1]
				for(var/singleton/hierarchy/mil_uniform/child in user_outfit.children) //Check for variants of command outfits
					if(user_rank.sort_order >= child.min_rank && user_outfit.min_rank < child.min_rank)
						user_outfit = child

	return populate_uniforms(user_outfit, include_pt, include_dress) //Generate uniform lists.

/proc/populate_uniforms(singleton/hierarchy/mil_uniform/user_outfit, include_pt = TRUE, include_dress = TRUE)
	var/list/res = list()
	if(include_pt)
		res["PT"] = list(
			user_outfit.pt_under,
			user_outfit.pt_shoes
			)

	res["Utility"] = list(
		user_outfit.utility_under,
		user_outfit.utility_shoes,
		user_outfit.utility_hat
		)
	if (user_outfit.utility_extra)
		res["Utility Extras"] = user_outfit.utility_extra

	res["Service"] = list(
		user_outfit.service_under,
		user_outfit.service_skirt,
		user_outfit.service_over,
		user_outfit.service_shoes,
		user_outfit.service_heels,
		user_outfit.service_hat,
		user_outfit.service_gloves
		)
	if(user_outfit.service_extra)
		res["Service Extras"] = user_outfit.service_extra

	if(include_dress)
		res["Dress"] = list(
			user_outfit.dress_under,
			user_outfit.dress_skirt,
			user_outfit.dress_over,
			user_outfit.dress_shoes,
			user_outfit.dress_heels,
			user_outfit.dress_hat,
			user_outfit.dress_gloves
			)
		if(user_outfit.dress_extra)
			res["Dress Extras"] = user_outfit.dress_extra

	return res

/proc/uniform_contains_clothing(datum/mil_rank/user_rank, datum/mil_branch/user_branch, department, obj/item/clothing/clothing)

/datum/preferences/proc/Uniform(datum/job/job)
	return job ? uniforms_by_job[job.title] : list()

/datum/category_item/player_setup_item/occupation/proc/open_uniform_setup(mob/user, datum/job/job)
	panel = new(user, "uniform-selection", "Uniform Selection: [job.title]", 350, 590, src)
	panel.set_content(generate_uniform_content(job))
	panel.open()

/datum/category_item/player_setup_item/occupation/proc/get_selected_uniform_list(datum/job/job)
	return job ? pref.uniforms_by_job[job.title] : list()

/datum/category_item/player_setup_item/occupation/proc/generate_uniform_content(datum/job/job)
	var/dat = list()
	var/list/uniforms = list()
	if(job)
		var/datum/mil_branch/player_branch = pref.branches[job.title] ? GLOB.mil_branches.get_branch(pref.branches[job.title]) : null
		var/datum/mil_rank/player_rank = pref.ranks[job.title] ? GLOB.mil_branches.get_rank(player_branch.name, pref.ranks[job.title]) : null
		uniforms = find_uniforms(player_rank, player_branch, job.department_flag, FALSE, FALSE)
	var/list/selected_outfit = get_selected_uniform_list(job)
	for(var/uniform_type in uniforms)
		dat += "<b>[uniform_type]</b>"
		var/list/uniform = uniforms[uniform_type]
		for(var/piece in uniform)
			if(piece)
				var/obj/item/clothing/C = piece
				if("[piece]" in selected_outfit)
					dat += "[SPAN_CLASS("linkOn", "[sanitize(initial(C.name))]")]<a href='byond://?src=\ref[src];remove_uniform=\ref[piece];uniform_job=[job.title]'>X</a>"
				else
					dat += "<a href='byond://?src=\ref[src];add_uniform=\ref[piece];uniform_job=[job.title]'>[sanitize(initial(C.name))]</a>"
		dat += "<hr>"
	return jointext(dat, "<br>")
