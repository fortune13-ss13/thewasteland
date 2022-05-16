/obj/item/stack/crafting
	name = "crafting part"
	icon = 'icons/fallout/objects/crafting/parts_stack.dmi'
	amount = 1
	max_amount = 5000 // This high number breaks the root icon update thingie so made a new one since visual feedback is important IMO and removing it entirely is a regression.
	throw_speed = 3
	throw_range = 7
	w_class = WEIGHT_CLASS_TINY
	novariants = FALSE

// Update icon adapted for the 5000 max_amount limit, so there will be some visual feedback on how much stuff is in a stack.
/obj/item/stack/crafting/update_icon_state()
	var/amount = get_amount()
	if(amount <= 4)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]_2"

/obj/item/stack/crafting/armor_plate
	name = "armor plate"
	desc = "an armor plate used to upgrade some types of armor."
	icon_state = "sheet-plate"
	merge_type = /obj/item/stack/crafting/armor_plate

/obj/item/stack/crafting/armor_plate/five
	amount = 5

/obj/item/stack/crafting/armor_plate/eight
	amount = 8

/obj/item/stack/crafting/armor_plate/ten
	amount = 10


/obj/item/stack/crafting/metalparts
	name = "metal parts"
	icon_state = "sheet-metalparts"
	singular_name = "metal part"
	custom_materials = list(/datum/material/iron = 10000)
	flags_1 = CONDUCT_1
	merge_type = /obj/item/stack/crafting/metalparts

/obj/item/stack/crafting/metalparts/three
	amount = 3

/obj/item/stack/crafting/metalparts/five
	amount = 5

/obj/item/stack/crafting/goodparts
	name = "high quality metal parts"
	icon_state = "sheet-goodparts"
	singular_name = "high quality metal part"
	custom_materials = list(/datum/material/titanium = 10000)
	flags_1 = CONDUCT_1
	merge_type = /obj/item/stack/crafting/goodparts

/obj/item/stack/crafting/goodparts/three
	amount = 3

/obj/item/stack/crafting/goodparts/five
	amount = 5

/obj/item/stack/crafting/electronicparts
	name = "electronic parts"
	icon_state = "sheet-electronicparts"
	singular_name = "electronic part"
	custom_materials = list(/datum/material/glass = 10000)
	flags_1 = CONDUCT_1
	merge_type = /obj/item/stack/crafting/electronicparts

/obj/item/stack/crafting/electronicparts/three
	amount = 3

/obj/item/stack/crafting/electronicparts/five
	amount = 5

/obj/item/stack/crafting/powder
	name = "bullet remnants"
	desc = "A pouch containing some scoops of blackpowder and empty shell casings."
	icon_state = "sheet-powder"
	singular_name = "bullet remnant"
	max_amount = 240
	full_w_class = WEIGHT_CLASS_SMALL
	merge_type = /obj/item/stack/crafting/powder

GLOBAL_LIST_INIT(powder_recipes, list ( \
	new/datum/stack_recipe("extract blackpowder", /obj/item/reagent_containers/glass/bottle/blackpowder, 80),\
))

/obj/item/stack/crafting/powder/get_main_recipes()
	. = ..()
	. += GLOB.powder_recipes

// Adapted for the specific bullet remnant stacking
/obj/item/stack/crafting/powder/update_icon_state()
	var/amount = get_amount()
	if(amount <= 80)
		icon_state = initial(icon_state)
	else if(amount <= 160)
		icon_state = "[initial(icon_state)]_2"
	else
		icon_state = "[initial(icon_state)]_3"
