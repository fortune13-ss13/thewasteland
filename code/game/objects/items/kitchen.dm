/* Kitchen tools
 * Contains:
 *		Fork
 *		Kitchen knives
 *		Ritual Knife
 *		Bloodletter
 *		Butcher's cleaver
 *		Combat Knife
 *		Rolling Pins
 */

/obj/item/kitchen
	icon = 'icons/fallout/objects/kitchen.dmi'
	lefthand_file = 'icons/fallout/onmob/tools/kitchen_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/tools/kitchen_righthand.dmi'

/obj/item/kitchen/fork
	name = "fork"
	desc = "Pointy."
	icon_state = "fork"
	force = 5
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	throw_speed = 3
	throw_range = 5
	custom_materials = list(/datum/material/iron=80)
	flags_1 = CONDUCT_1
	attack_verb = list("attacked", "stabbed", "poked")
	hitsound = 'sound/weapons/bladeslice.ogg'
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 30)
	sharpness = SHARP_POINTY
	var/datum/reagent/forkload //used to eat omelette

/obj/item/kitchen/fork/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] stabs \the [src] into [user.p_their()] chest! It looks like [user.p_theyre()] trying to take a bite out of [user.p_them()]self!</span>")
	playsound(src, 'sound/items/eatfood.ogg', 50, 1)
	return BRUTELOSS

/obj/item/kitchen/fork/attack(mob/living/carbon/M, mob/living/carbon/user)
	if(!istype(M))
		return ..()

	if(forkload)
		if(M == user)
			M.visible_message("<span class='notice'>[user] eats a delicious forkful of omelette!</span>")
			M.reagents.add_reagent(forkload.type, 1)
		else
			M.visible_message("<span class='notice'>[user] feeds [M] a delicious forkful of omelette!</span>")
			M.reagents.add_reagent(forkload.type, 1)
		icon_state = "fork"
		forkload = null

	else if(user.zone_selected == BODY_ZONE_PRECISE_EYES)
		return eyestab(M,user)
	else
		return ..()

/obj/item/kitchen/knife
	name = "kitchen knife"
	desc = "A simple knife, best suited to cut stuff that doesn't cut back."
	lefthand_file = 'icons/fallout/onmob/weapons/melee1h_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/melee1h_righthand.dmi'
	icon_state = "knife_kitchen"
	item_state = "knife"
	flags_1 = CONDUCT_1
	force = 15
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 15
	hitsound = 'sound/weapons/bladeslice.ogg'
	throw_speed = 3
	throw_range = 6
	custom_materials = list(/datum/material/iron=4000)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	sharpness = SHARP_POINTY
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	var/bayonet = FALSE	//Can this be attached to a gun?
	wound_bonus = -5
	bare_wound_bonus = 10
	custom_price = PRICE_NORMAL

/obj/item/kitchen/knife/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 80 - force, 100, force - 10) //bonus chance increases depending on force

/obj/item/kitchen/knife/attack(mob/living/carbon/M, mob/living/carbon/user)
	if(user.zone_selected == BODY_ZONE_PRECISE_EYES)
		return eyestab(M,user)
	else
		return ..()

/obj/item/kitchen/knife/suicide_act(mob/user)
	user.visible_message(pick("<span class='suicide'>[user] is slitting [user.p_their()] wrists with the [src.name]! It looks like [user.p_theyre()] trying to commit suicide.</span>", \
						"<span class='suicide'>[user] is slitting [user.p_their()] throat with the [src.name]! It looks like [user.p_theyre()] trying to commit suicide.</span>", \
						"<span class='suicide'>[user] is slitting [user.p_their()] stomach open with the [src.name]! It looks like [user.p_theyre()] trying to commit seppuku.</span>"))
	return (BRUTELOSS)


/obj/item/kitchen/knife/butcher
	name = "butcher's cleaver"
	icon_state = "knife_butcher"
	desc = "Keep hackin' and whackin' and smackin'."
	flags_1 = CONDUCT_1
	force = 25
	throwforce = 15
	custom_materials = list(/datum/material/iron=6000)
	attack_verb = list("cleaved", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	w_class = WEIGHT_CLASS_NORMAL
	custom_price = PRICE_EXPENSIVE


/obj/item/kitchen/rollingpin
	name = "rolling pin"
	desc = "Used to knock out the Bartender."
	icon_state = "rolling_pin"
	force = 8
	throwforce = 5
	throw_speed = 3
	throw_range = 7
	w_class = WEIGHT_CLASS_NORMAL
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 1.5)
	attack_verb = list("bashed", "battered", "bludgeoned", "thrashed", "whacked")
	custom_price = PRICE_ALMOST_CHEAP

/obj/item/kitchen/rollingpin/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins flattening [user.p_their()] head with \the [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return BRUTELOSS

/obj/item/kitchen/knife/circumcision
	name = "circumcision knife"
	desc = "A small knife with a plastic handle, used to perform circumcisions."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "shalom"
	force = 6
	throwforce = 6
	armour_penetration = 8
	attack_verb_simple = list("circumcised", "fucking jew", "goyim'd")

/obj/item/kitchen/knife/circumcision/attack(mob/living/carbon/M, mob/living/carbon/user)
	if (ishuman(M))
		var/mob/living/carbon/human/H = M
		if (user.a_intent == INTENT_HELP && user.zone_selected == BODY_ZONE_PRECISE_GROIN && H.gender == MALE)
			if (H.circumcised)
				user << "<span class = 'notice'>[H] is already circumcised!</span>"
				return

			visible_message("<span class = 'notice'>[user] starts to circumcise [H]...</span>")
			if (do_after(user, 90, H) && !H.circumcised)
				visible_message("<span class = 'notice'>[user] successfully circumcises [H].</span>")
				H.circumcised = TRUE
				return
	return ..()

/obj/item/kitchen/knife/circumcision/suicide_act(mob/user)
	if (user.gender == MALE)
		user.visible_message("<span class='suicide'>[user] tries to circumcise himself but there isn't any foreskin! It looks like [user.p_theyre()] trying to commit suicide.</span>")
	else
		user.visible_message("<span class='suicide'>[user] realizes she can't circumcise herself and slits her [pick("wrists", "throat")]! It looks like [user.p_theyre()] trying to commit suicide.</span>")
	return (BRUTELOSS)