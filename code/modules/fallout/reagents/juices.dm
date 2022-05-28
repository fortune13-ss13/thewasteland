/datum/reagent/consumable/mutjuice
	name = "Mutfruit Juice"
	description = "The sweet-salty juice of the mutfruit."
	color = "#660099"
	taste_description = "sweet and salty"
	glass_name = "glass of mutfruit juice"
	glass_desc = "A glass of sweet-salty mutfruit juice."
	thirst_factor = THIRST_FACTOR * 12

/datum/reagent/consumable/mutjuice/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(50))
		M.heal_bodypart_damage(0,1, 0)
		. = TRUE
	..()

/datum/reagent/consumable/yuccajuice
	name = "Yucca Juice"
	description = "The raw essence of a	banana yucca."
	color = "#863333" // rgb: 175, 175, 0
	taste_description = "sand and bunker-air"
	glass_icon_state = "banana"
	glass_name = "glass of yucca juice"
	glass_desc = "A wastelanders favourite."
	thirst_factor = THIRST_FACTOR * 12

/datum/reagent/consumable/tato_juice
	name = "Tato Juice"
	description = "Juice of the tato. Smells like bad eggs."
	nutriment_factor = 3 * REAGENTS_METABOLISM
	color = "#302000" // rgb: 48, 32, 0
	taste_description = "rotten ketchup"
	glass_icon_state = "glass_brown"
	glass_name = "glass of tato juice"
	glass_desc = "Juice of the tato. Smells like bad eggs."
	thirst_factor = THIRST_FACTOR * 12
