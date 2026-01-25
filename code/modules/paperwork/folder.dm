/obj/item/material/folder
	name = "folder"
	desc = "A folder."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "folder"
	item_state = "clipboard"
	default_material = MATERIAL_CARDBOARD
	applies_material_name = FALSE
	applies_material_colour = FALSE
	unbreakable = TRUE
	matter = list(MATERIAL_CARDBOARD = 70)
	w_class = ITEM_SIZE_SMALL

	/// The window name to use for folder UIs
	var/window_name = "gray folder"


/obj/item/material/folder/Destroy()
	QDEL_CONTENTS
	return ..()


/obj/item/material/folder/Initialize()
	. = ..()
	update_icon()


/obj/item/material/folder/on_update_icon()
	ClearOverlays()
	if (length(contents))
		AddOverlays("folder_paper")


/obj/item/material/folder/use_tool(obj/item/item, mob/living/user, list/click_params)
	if (is_type_in_list(item, list(/obj/item/paper, /obj/item/photo, /obj/item/paper_bundle)))
		if (!user.unEquip(item, src))
			FEEDBACK_UNEQUIP_FAILURE(user, item)
			return TRUE
		user.visible_message(
			SPAN_ITALIC("\The [user] adds \a [item] to \a [src]."),
			SPAN_ITALIC("You add \the [item] to \the [src]."),
			range = 5
		)
		update_icon()
		return TRUE
	if (istype(item, /obj/item/pen))
		var/response = input(user, null, "Label \the [src]") as null | text
		response = sanitize(response, MAX_LNAME_LEN)
		if (!response || !user.use_sanity_check(src, item))
			return TRUE
		AddLabel(response, user)
		return TRUE
	return ..()


/obj/item/material/folder/use_after(atom/target, mob/living/user, click_parameters)
	if (is_type_in_list(target, list(/obj/item/paper, /obj/item/photo, /obj/item/paper_bundle)))
		if (istype(src, /obj/item/material/folder/envelope))
			var/obj/item/material/folder/envelope/envelope = src
			if (envelope.sealed)
				to_chat(user, SPAN_WARNING("\The [src] is sealed."))
				return TRUE
		user.visible_message(
			SPAN_ITALIC("\The [user] adds \a [target] to \a [src]."),
			SPAN_ITALIC("You add \the [target] to \the [src]."),
			range = 5
		)
		var/obj/obj = target
		obj.forceMove(src)
		if (istype(target, /obj/item/paper))
			var/obj/item/material/folder/clipboard/clipboard = src
			if (istype(clipboard))
				clipboard.top_paper = target
		update_icon()
		return TRUE
	return ..()


/obj/item/material/folder/attack_self(mob/living/user)
	var/list/document = list("<title>Folder</title>")
	for (var/obj/item/item as anything in contents)
		if (!istype(item, /obj/item/paper) && !istype(item, /obj/item/photo) && !istype(item, /obj/item/paper_bundle))
			continue
		var/ref = any2ref(item)
		document += "[aref(item.name, "view=[ref]")] [aref("Remove", "remove=[ref]")]<br>"
	show_browser(user, jointext(document, ""), "window=[window_name]")
	onclose(user, window_name)
	add_fingerprint(usr)


/obj/item/material/folder/MouseDrop(atom/over_atom)
	if (!ishuman(usr))
		return
	if (!istype(over_atom, /obj/screen))
		return ..()
	if (!CanPhysicallyInteractWith(usr, src))
		return
	var/obj/screen/screen = over_atom
	switch (screen.name)
		if ("r_hand")
			if (usr.unEquip(src))
				usr.put_in_r_hand(src)
		if ("l_hand")
			if (usr.unEquip(src))
				usr.put_in_l_hand(src)
	add_fingerprint(usr)


/obj/item/material/folder/Topic(href_text, list/href_list, datum/topic_state/state)
	if (!CanPhysicallyInteractWith(usr, src))
		to_chat(usr, SPAN_WARNING("You're no longer able to do that!"))
		return
	if (href_list["view"])
		var/obj/item/item = locate(href_list["view"]) in contents
		if (!item)
			to_chat(usr, SPAN_WARNING("That's no longer held by \the [src]."))
			return
		examinate(usr, item)
		return
	if (href_list["remove"])
		var/obj/item/item = locate(href_list["remove"]) in contents
		if (!item)
			to_chat(usr, SPAN_WARNING("That's no longer held by \the [src]."))
			return
		usr.put_in_hands(item)
		attack_hand(usr)
		update_icon()
		return


/obj/item/material/folder/shatter()
	DROP_CONTENTS
	..()


/obj/item/material/folder/blue
	desc = "A blue folder."
	icon_state = "folder_blue"
	window_name = "blue folder"


/obj/item/material/folder/red
	desc = "A red folder."
	icon_state = "folder_red"
	window_name = "red folder"


/obj/item/material/folder/yellow
	desc = "A yellow folder."
	icon_state = "folder_yellow"
	window_name = "yellow folder"


/obj/item/material/folder/white
	desc = "A white folder."
	icon_state = "folder_white"
	window_name = "white folder"


/obj/item/material/folder/nt
	desc = "A corporate folder."
	icon_state = "folder_nt"
	window_name = "corporate folder"


/obj/item/material/folder/envelope
	name = "envelope"
	desc = "A thick envelope."
	icon_state = "envelope0"
	window_name = "envelope"

	/// Whether the envelope has been opened or not
	var/sealed = FALSE

	/// If this envelope was sealed with a stamp, the stamp name
	var/seal_stamp


/obj/item/material/folder/envelope/preset
	icon_state = "envelope_sealed"
	sealed = TRUE
	seal_stamp = "\improper SCG Expeditionary Command rubber stamp"

/obj/item/material/folder/envelope/preset/bio_envelope
	name = "sealed B.I.O LLC envelope"
	desc = "An official envelope with the B.I.O LLC corporate seal."
	icon_state = "envelope_sealed"
	sealed = TRUE
	seal_stamp = "\improper B.I.O LLC corporate rubber stamp"

/obj/item/material/folder/envelope/preset/bio_envelope/New()
	..()
	var/obj/item/paper/bio_memo = new(src)
	bio_memo.name = "B.I.O LLC - Chat Channel Directive"
	bio_memo.info = {"<center><b>B.I.O LLC CORPORATE MEMORANDUM</b></center><br>
		<center><i>Official Communication</i></center><br><br>

		<b>To:</b> Community Services Manager<br>
		<b>From:</b> Leonard Clark, B.I.O LLC Operations Director<br>
		<b>Date:</b> October 19, 2450" <br>
		<b>Subject:</b> Establishment of Public Chat Channel<br><br>

		<b>DIRECTIVE:</b><br>
		You are hereby instructed to create a public NTNRC chat channel with the following specifications:<br><br>

		<b>Channel Name:</b> "BIO Ordering Station"<br><br>

		<b>Purpose:</b> This channel will serve as the primary communication hub for all B.I.O LLC ordering operations and customer service inquiries.<br><br>

		<b>Responsibilities:</b><br>
		• Monitor the channel continuously during your shift<br>
		• Respond promptly to all ordering inquiries<br>
		• Maintain professional communication standards<br>
		• Stay on top of all incoming orders and ensure timely processing<br>
		• Coordinate with other departments as needed to fulfill orders<br><br>

		<b>Priority:</b> HIGH - This directive is to be implemented immediately upon receipt of this memorandum.<br><br>

		<b>Additional Notes:</b> This channel will be monitored by B.I.O LLC corporate oversight. Failure to maintain proper channel management may result in disciplinary action.<br><br>

		<center><i>This directive is authorized by B.I.O LLC corporate policy.</i></center><br><br>

		Signed,<br>
		<b>Leonard Clark</b><br>
		Operations Director<br>
		B.I.O LLC"}
	bio_memo.update_icon()

/obj/item/material/folder/envelope/preset/cooran_envelope
	name = "sealed Cooran Supply envelope"
	desc = "An official envelope with the Cooran Supply corporate seal."
	icon_state = "envelope_sealed"
	sealed = TRUE
	seal_stamp = "\improper Cooran Supply corporate rubber stamp"

/obj/item/material/folder/envelope/preset/bio_envelope/New()
	..()
	var/obj/item/paper/cooran_memo = new(src)
	cooran_memo.name = "Cooran Supply - Commerce Hub Instructions"
	cooran_memo.info = {"<center><b>COORAN SUPPLY CORPORATE MEMORANDUM</b></center><br>
	<center><i>Sanctioned Secure Communication</i></center><br><br>
	<b>To:</b> Cooran Supply Supply Director<br>
		<b>From:</b> James Cooran, Chief Operations Officer of Cooran Supply<br>
		<b>Date:</b> October 19, 2451" <br>
		<b>Subject:</b> Commerce Hub Instructions<br><br>
	You are likely very confused, agitated maybe. You may be wondering, 'Why is James Cooran contacting OUR MEASLY SOULS!?!' <br><br>

	<center>Do not fret.</center>

	Here at Cooran Supply, we strive for a safe, happy, and healthy workforce. But how can we do that without telling you what to do ?<br><br>

	So I just want to say a few things about our new, state-of-the-art, reinforced polycarbonate lined Commerce Hub.

	<b>INSTRUCTIONS:</b><br>
	Please listen carefully, I will only say this once(though I do realize you can simply reread this document).
	The commerce hub is our state of the art entrepreneurship module onboard the UGN Titen, designed to blossom a strong,
	intimate connection from our common drifter to the inner machinations of our utopian capitalist system.

	To do so, we cannot have dystopian 'free policies', so we must charge the common man all he can afford to purchase a rental ticket at one of our beautiful stalls!

	<center><b>REMEMBER: All individuals at stalls must be checked regularly for Commerce ID's!</b></center>
	1. To begin the booking process of an individual, grab a Commerce ID from the supply station.
	2. Tap the ID against your own ID card.
	3. Ensure the individual pays the proper due of 29.99 GSC on Cash or Credit.
	4. (optional) Log the individuals name on a piece of paper to keep track of sales
	5. Start a twenty minute timer.After that time has passed, revoke and incinerate the commerce ID if they would not like to renew it.
	<small>Failure to do so shall result in immediate termination of employment.</small>
	6. Let the individual into an empty stall in the Commerce Hub
	7. <p>Relax<sup><a href="#footnote-1">[1]</a></sup></p>

	And thats all you need to know!

	Great job everyone!

	And remember,

	<center><b>DO NOT FUCK IT UP.</b></center>
<hr>
<p id="footnote-1"><small>1. As cordoned by law of the UGN, all workers of Cooran Supply require a mandatory twenty-minute break for every four hours worked</small></p>
	"}
	cooran_memo.update_icon()

/obj/item/material/folder/envelope/on_update_icon()
	if (sealed)
		icon_state = "envelope_sealed"
	else
		icon_state = "envelope[length(contents) > 0]"


/obj/item/material/folder/envelope/examine(mob/user, distance, is_adjacent)
	. = ..()
	if (distance > 3 && !isobserver(user))
		return
	var/message = "The seal is [sealed ? "intact" : "broken"]."
	if (seal_stamp)
		message = "It has a seal from \a [seal_stamp]. [message]"
	to_chat(user, message)


/obj/item/material/folder/envelope/proc/Unseal(mob/living/user)
	if (user)
		var/response = alert(user, "Break the seal on \the [src]?", null, "Yes", "No")
		if (response != "Yes")
			return FALSE
		if (!user.use_sanity_check(src))
			return FALSE
		user.visible_message(
			SPAN_ITALIC("\The [user] breaks the seal on \a [src]."),
			SPAN_ITALIC("You break the seal on \the [src]."),
			range = 5
		)
	sealed = FALSE
	update_icon()
	return TRUE


/obj/item/material/folder/envelope/attack_self(mob/living/user)
	if (sealed && !Unseal(user))
		return
	return ..()


/obj/item/material/folder/envelope/use_tool(obj/item/item, mob/living/user, list/click_params)
	if (sealed)
		Unseal(user)
		return TRUE
	else if (is_type_in_list(item, list(/obj/item/stamp, /obj/item/clothing/ring/seal)))
		sealed = TRUE
		seal_stamp = item.name
		user.visible_message(
			SPAN_ITALIC("\The [user] seals \a [src] with \a [item]."),
			SPAN_ITALIC("You seal \the [src] with \the [item]."),
			range = 5
		)
		playsound(src, 'sound/effects/stamp.ogg', 50, TRUE)
		update_icon()
		return TRUE
	return ..()


/obj/item/material/folder/clipboard
	name = "clipboard"
	desc = "It's a board with a clip used to organise papers."
	icon_state = "clipboard"
	force = 2
	throwforce = 3
	throw_speed = 3
	throw_range = 10
	slot_flags = SLOT_BELT
	applies_material_colour = TRUE
	default_material = MATERIAL_WOOD
	matter = list(MATERIAL_WOOD = 70)
	window_name = "wood clipboard"

	var/obj/item/pen/stored_pen

	var/obj/item/paper/top_paper


/obj/item/material/folder/clipboard/Destroy()
	stored_pen = null
	top_paper = null
	return ..()


/obj/item/material/folder/clipboard/Initialize()
	. = ..()
	desc += " It's made of [material.use_name]."


/obj/item/material/folder/clipboard/on_update_icon()
	ClearOverlays()
	color = material.icon_colour
	alpha = 100 + material.opacity * 255
	if (top_paper)
		AddOverlays(overlay_image(top_paper.icon, top_paper.icon_state, flags = RESET_COLOR))
		CopyOverlays(top_paper)
	if (stored_pen)
		AddOverlays(overlay_image(icon, "clipboard_pen", flags = RESET_COLOR))
	AddOverlays(overlay_image(icon, "clipboard_over", flags = RESET_COLOR))


/obj/item/material/folder/clipboard/use_after(atom/target, mob/living/user, click_parameters)
	if (istype(target, /obj/item/pen))
		if (stored_pen)
			to_chat(user, SPAN_WARNING("\The [src] already has \a [stored_pen] attached."))
			return
		var/obj/item/pen/pen = target
		pen.forceMove(src)
		user.visible_message(
			SPAN_ITALIC("\The [user] adds \a [pen] to \a [src]."),
			SPAN_ITALIC("You add \the [pen] to \the [src]."),
			range = 5
		)
		stored_pen = pen
		update_icon()
		return TRUE
	return ..()


/obj/item/material/folder/clipboard/use_tool(obj/item/item, mob/living/user, list/click_params)
	if (is_type_in_list(item, list(/obj/item/pen, /obj/item/stamp, /obj/item/clothing/ring/seal)))
		if (top_paper)
			top_paper.use_tool(item, user)
			return TRUE
		if (!istype(item, /obj/item/pen))
			return TRUE
		if (stored_pen)
			to_chat(usr, SPAN_WARNING("\A [stored_pen] is already held by \the [src]."))
			return TRUE
		if (!user.unEquip(item, src))
			FEEDBACK_UNEQUIP_FAILURE(user, item)
		else
			user.visible_message(
				SPAN_ITALIC("\The [user] adds \a [item] to \a [src]."),
				SPAN_ITALIC("You add \the [item] to \the [src]."),
				range = 5
			)
			stored_pen = item
			update_icon()
		return TRUE
	. = ..()
	if (istype(item, /obj/item/paper) && (item in contents))
		top_paper = item
		update_icon()


/obj/item/material/folder/clipboard/attack_self(mob/living/user)
	var/list/document = list("<title>Clipboard</title><center>")
	if (stored_pen)
		document += aref("Take [stored_pen.name]", "getpen=1")
	else
		var/obj/item/pen/pen = usr.IsHolding(/obj/item/pen)
		if (pen)
			document += aref("Store [pen.name]", "putpen=1")
		else
			document += "-"
	document += "</center><br><hr>"
	for (var/i = length(contents) to 1 step -1)
		var/obj/item/item = contents[i]
		if (!is_type_in_list(item, list(/obj/item/paper, /obj/item/photo, /obj/item/paper_bundle)))
			continue
		var/ref = any2ref(item)
		document += "[aref(item.name, "view=[ref]")] [aref("Write", "write=[ref]")] \
			[aref("Rename", "rename=[ref]")] [aref("Remove", "remove=[ref]")]<br>"
	show_browser(user, jointext(document, ""), "window=[window_name]")
	onclose(user, window_name)
	add_fingerprint(usr)

/obj/item/material/folder/clipboard/examine(mob/user, distance, is_adjacent)
	. = ..()
	if (top_paper && is_adjacent)
		top_paper.show_content(user)

/obj/item/material/folder/clipboard/Topic(href_text, list/href_list, datum/topic_state/state)
	if (!CanPhysicallyInteractWith(usr, src))
		to_chat(usr, SPAN_WARNING("You're no longer able to do that!"))
		return
	if (href_list["write"])
		var/obj/item/item = locate(href_list["write"]) in contents
		if (!item)
			to_chat(usr, SPAN_WARNING("That's no longer held by \the [src]."))
			return
		var/obj/item/pen/pen = usr.IsHolding(/obj/item/pen)
		if (!pen && istype(usr.back, /obj/item/rig))
			var/obj/item/rig/rig = usr.back
			if (rig.offline)
				return
			var/obj/item/rig_module/device/pen/module = locate() in rig.installed_modules
			pen = module?.device
		if (!pen)
			pen = stored_pen
			if (!pen)
				to_chat(usr, SPAN_WARNING("You have no pen to write with."))
				return
		item.use_tool(pen, usr)
		update_icon()
		return
	if (href_list["rename"])
		var/obj/item/item = locate(href_list["rename"]) in contents
		if (!item)
			to_chat(usr, SPAN_WARNING("That's no longer held by \the [src]."))
			return
		if (istype(item, /obj/item/paper))
			var/obj/item/paper/paper = item
			paper.rename()
			attack_self(usr)
		else if (istype(item, /obj/item/photo))
			var/obj/item/photo/photo = item
			photo.rename()
			attack_self(usr)
		return
	if (href_list["getpen"])
		if (!istype(stored_pen))
			to_chat(usr, SPAN_WARNING("\The [src] does not hold any pen."))
			return
		usr.visible_message(
			SPAN_ITALIC("\The [usr] removes \a [stored_pen] from \a [src]."),
			SPAN_ITALIC("You remove \the [stored_pen] from \the [src]."),
			range = 5
		)
		usr.put_in_hands(stored_pen)
		stored_pen = null
		attack_self(usr)
		update_icon()
		return
	if (href_list["putpen"])
		if (stored_pen)
			to_chat(usr, SPAN_WARNING("\A [stored_pen] is already held by \the [src]."))
			return
		var/obj/item/pen/pen = usr.IsHolding(/obj/item/pen)
		if (!pen)
			to_chat(usr, SPAN_WARNING("You have no pen to store in \the [src]."))
			return
		if (!usr.unEquip(pen, src))
			return
		usr.visible_message(
			SPAN_ITALIC("\The [usr] stores \a [pen] in \a [src]."),
			SPAN_ITALIC("You store \the [pen] in \the [src]."),
			range = 5
		)
		stored_pen = pen
		attack_self(usr)
		update_icon()
		return
	if (href_list["remove"])
		var/obj/item/removed_item = locate(href_list["remove"]) in contents
		if (!removed_item)
			to_chat(usr, SPAN_WARNING("That's no longer held by \the [src]."))
			return
		usr.put_in_hands(removed_item)
		attack_hand(usr)
		if (removed_item == top_paper)
			top_paper = null
			var/i = length(contents)
			while (i > 0 && !top_paper)
				var/obj/item/item = contents[i]
				if (istype(item, /obj/item/paper))
					top_paper = item
				i--
		update_icon()
		return
	..()


/obj/item/material/folder/clipboard/ebony
	default_material = MATERIAL_EBONY
	matter = list(MATERIAL_EBONY = 70)
	window_name = "ebony clipboard"


/obj/item/material/folder/clipboard/steel
	default_material = MATERIAL_STEEL
	matter = list(MATERIAL_STEEL = 70)
	window_name = "steel clipboard"


/obj/item/material/folder/clipboard/aluminium
	default_material = MATERIAL_ALUMINIUM
	matter = list(MATERIAL_ALUMINIUM = 70)
	window_name = "aluminium clipboard"


/obj/item/material/folder/clipboard/glass
	default_material = MATERIAL_GLASS
	matter = list(MATERIAL_GLASS = 70)
	window_name = "glass clipboard"
	unbreakable = FALSE


/obj/item/material/folder/clipboard/plastic
	default_material = MATERIAL_PLASTIC
	matter = list(MATERIAL_PLASTIC = 70)
	window_name = "plastic clipboard"
