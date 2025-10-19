
/singleton/hierarchy/mil_uniform/ec
	name = "Master EC outfit"
	hierarchy_type = /singleton/hierarchy/mil_uniform/ec
	branches = list(/datum/mil_branch/expeditionary_corps)

	pt_under = /obj/item/clothing/under/solgov/pt/expeditionary
	pt_shoes = /obj/item/clothing/shoes/black

	utility_under = /obj/item/clothing/under/solgov/utility/expeditionary
	utility_shoes = /obj/item/clothing/shoes/dutyboots
	utility_hat = /obj/item/clothing/head/soft/solgov/expedition
	utility_extra = list(/obj/item/clothing/head/beret/solgov/expedition, /obj/item/clothing/head/ushanka/solgov, /obj/item/clothing/suit/storage/hooded/wintercoat/solgov, /obj/item/clothing/shoes/jackboots/unathi)

	service_over = /obj/item/clothing/suit/storage/solgov/service/expeditionary
	service_hat = /obj/item/clothing/head/solgov/service/expedition

	dress_under = /obj/item/clothing/under/solgov/dress/expeditionary
	dress_skirt = /obj/item/clothing/under/solgov/dress/expeditionary/skirt
	dress_over = /obj/item/clothing/suit/storage/solgov/dress/expedition
	dress_shoes = /obj/item/clothing/shoes/dress
	dress_hat = /obj/item/clothing/head/solgov/service/expedition
	dress_gloves = /obj/item/clothing/gloves/white

	dress_extra = list(/obj/item/clothing/accessory/solgov/ec_scarf)

/singleton/hierarchy/mil_uniform/fleet
	name = "Master fleet outfit"
	hierarchy_type = /singleton/hierarchy/mil_uniform/fleet
	branches = list(/datum/mil_branch/fleet)

	pt_under = /obj/item/clothing/under/solgov/pt/fleet
	pt_shoes = /obj/item/clothing/shoes/black

	utility_under = /obj/item/clothing/under/solgov/utility/fleet
	utility_shoes = /obj/item/clothing/shoes/dutyboots
	utility_hat = /obj/item/clothing/head/solgov/utility/fleet
	utility_extra = list(
		/obj/item/clothing/head/beret/solgov/fleet,
		/obj/item/clothing/head/ushanka/solgov/fleet,
		/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/fleet,
		/obj/item/clothing/head/soft/solgov/fleet
	)

	service_under = /obj/item/clothing/under/solgov/service/fleet
	service_skirt = /obj/item/clothing/under/solgov/service/fleet/skirt
	service_over = /obj/item/clothing/suit/storage/solgov/service/fleet
	service_shoes = /obj/item/clothing/shoes/dress
	service_heels = /obj/item/clothing/shoes/dressheels
	service_hat = /obj/item/clothing/head/solgov/dress/fleet/garrison
	service_extra = list(/obj/item/clothing/suit/solgov/fleet_sweater)

	dress_under = /obj/item/clothing/under/solgov/service/fleet
	dress_skirt = /obj/item/clothing/under/solgov/service/fleet/skirt
	dress_over = /obj/item/clothing/suit/dress/solgov/fleet/sailor
	dress_shoes = /obj/item/clothing/shoes/dress
	dress_heels = /obj/item/clothing/shoes/dressheels
	dress_hat = /obj/item/clothing/head/solgov/dress/fleet/garrison
	dress_gloves = /obj/item/clothing/gloves/white

/singleton/hierarchy/mil_uniform/civilian
	name = "Master civilian outfit"		//Basically just here for the rent-a-tux, ahem, I mean... dress uniform.
	hierarchy_type = /singleton/hierarchy/mil_uniform/civilian
	branches = list(/datum/mil_branch/civilian,/datum/mil_branch/solgov)

	service_under = /obj/item/clothing/under/suit_jacket/really_black
	service_skirt = /obj/item/clothing/under/skirt_c/dress/black
	service_shoes = /obj/item/clothing/shoes/dress
	service_extra = list(/obj/item/clothing/under/skirt_c/dress/eggshell, /obj/item/clothing/shoes/heels/black, /obj/item/clothing/shoes/heels/red)

	dress_under = /obj/item/clothing/under/rank/internalaffairs/plain
	dress_skirt = /obj/item/clothing/under/skirt_c/dress_long/black
	dress_over = /obj/item/clothing/suit/storage/toggle/suit/black
	dress_shoes = /obj/item/clothing/shoes/dress
	dress_extra = list(/obj/item/clothing/accessory/waistcoat/black, /obj/item/clothing/under/skirt_c/dress_long/eggshell, /obj/item/clothing/shoes/flats/black)
