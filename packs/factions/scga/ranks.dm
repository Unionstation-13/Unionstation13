/obj/item/clothing/accessory/scga_rank
	abstract_type = /obj/item/clothing/accessory/scga_rank
	name = "base rank insignia, SCGA"
	desc = "You should not see this."
	icon = 'packs/factions/scga/ranks.dmi'
	accessory_icons = list(
		slot_w_uniform_str = 'packs/factions/scga/ranks.dmi',
		slot_wear_suit_str = 'packs/factions/scga/ranks.dmi'
	)
	icon_state = null
	overlay_state = "error"
	on_rolled_down = ACCESSORY_ROLLED_NONE
	w_class = ITEM_SIZE_TINY
	slot = ACCESSORY_SLOT_RANK
	accessory_flags = ACCESSORY_REMOVABLE | ACCESSORY_HIGH_VISIBILITY
	gender = PLURAL
	sprite_sheets = list(
		SPECIES_UNATHI = 'packs/factions/scga/species/ranks_unathi.dmi'
	)


/obj/item/clothing/accessory/scga_rank/get_fibers()
	return null


/obj/item/clothing/accessory/scga_rank/e1
	name = "rank insignia, E1 Private"
	desc = "Collar tabs denoting the SCGA E-1 rank of Private."
	icon_state = "e"
	overlay_state = "e_worn"

/obj/item/clothing/accessory/scga_rank/e2
	name = "rank insignia, E2 Private Second Class"
	desc = "Collar tabs denoting the SCGA E-2 rank of Private Second Class."
	icon_state = "e"
	overlay_state = "e_worn"

/obj/item/clothing/accessory/scga_rank/e3
	name = "rank insignia, E3 Private First Class"
	desc = "Collar tabs denoting the SCGA E-3 rank of Private First Class."
	icon_state = "e"
	overlay_state = "e_worn"


/obj/item/clothing/accessory/scga_rank/e4
	name = "rank insignia, E4 Corporal"
	desc = "Collar tabs denoting the SCGA E-4 rank of Corporal."
	icon_state = "e"
	overlay_state = "e_worn"


/obj/item/clothing/accessory/scga_rank/e5
	name = "rank insignia, E5 Sergeant"
	desc = "Collar tabs denoting the SCGA E-5 rank of Sergeant."
	icon_state = "e"
	overlay_state = "e_worn"
