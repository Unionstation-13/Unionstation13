/obj/item/commerceid
	name = "Commerce Hub Trade Verification Card"
	desc = "An identification card granted to commerce hub entrepreneurs by Cooran Supply. On the back of it, the words 'PLEASE REMOVE GLOVES BEFORE IMPRINTING' are printed in bold text."
		icon = 'icons/obj/clothing/obj_accessories.dmi'
	icon_state = "intelbadge"
	force = 0.5
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("whipped")
	hitsound = 'sound/weapons/towelwhip.ogg'
	var/info
	var/imprinted = false
	var/authorizer
	var/authorized = false

/obj/item/commerceid/attack_self(mob/user)
	if (user.a_intent == I_GRAB)
		if (!imprinted && authorized)
			var/fingerprint = user.get_fingerprint() || "N/A"
			var/hash = md5("[rand(1, 100000)][world.time]")
			to_chat(user, SPAN_NOTICE("You imprint your identification onto the card."))
			imprinted = true
			info = "\icon[src] [src]:\nName: [user.real_name]\
			\nFingerprint Hash: [fingerprint]\
			\nShip Identifier: UGN TITEN - CIVILIAN EXPLORATORY VESSEL MK. 15\
			\nAuthorizer: [authorizer]\
			\n<small>Stall Verification Card, UGN Titen Certification only\
			\nVERIFICATION-HASH: [hash]</small>"
		else if (authorized)
			read_info(user)
		else if (!authorized)
			to_chat(user, SPAN_NOTICE("[src] needs to be verified by a Cooran Supply identification card before you can imprint on it."))
	else
		read_info(user)
/obj/item/commerceid/attackby(obj/item/W, mob/user) // Handles authorizing a commerce card
	if(istype(W, /obj/item/card/id))
		var/obj/item/card/id/ID = W
		if(access_cargo in ID.GetAccess())
			if(authorized)
				to_chat(user, SPAN_NOTICE("The card has already been authorized."))
				return
			authorized = true
			authorizer = "[ID.registered_name] ([ID.assignment])"
			to_chat(user, SPAN_NOTICE("You authorize the card."))
		else
			to_chat(user, SPAN_NOTICE("You tap your ID card to [src]. Nothing happens."))
	else
		return


/obj/item/commerceid/proc/read_info(mob/user)
	user.visible_message(
		SPAN_ITALIC("[user] swipes through [src]."),
		SPAN_ITALIC("You swipe through [src] and check for some main information."),
		5
	)
	to_chat(user, info || SPAN_WARNING("[src] is completely blank!"))
