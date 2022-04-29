/datum/martial_art/melee_belt
	name = "Leg Sweep"
	id = MARTIALART_MELEEBELT
	var/datum/action/leg_sweep/melee_belt = new/datum/action/leg_sweep()

/datum/action/leg_sweep
	name = "Leg Sweep - Trips the victim, knocking them down for a brief moment."
	icon_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "legsweep"

/datum/action/leg_sweep/Trigger()
	if(owner.incapacitated())
		to_chat(owner, "<span class='warning'>You can't use [name] while you're incapacitated.</span>")
		return
	var/mob/living/carbon/human/H = owner
	if (H.mind.martial_art.streak == "leg_sweep")
		owner.visible_message("<span class='danger'>[owner] assumes a neutral stance.</span>", "<b><i>Your next attack is cleared.</i></b>")
		H.mind.martial_art.streak = ""
	else
		if(HAS_TRAIT(H, TRAIT_PACIFISM))
			to_chat(H, "<span class='warning'>You don't want to harm other people!</span>")
			return
		owner.visible_message("<span class='danger'>[owner] assumes the leg sweep stance!</span>", "<b><i>Your next attack will be a leg sweep.</i></b>")
		H.mind.martial_art.streak = "leg_sweep"

/datum/martial_art/melee_belt/disarm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(check_streak(A,D))
		return TRUE

/datum/martial_art/melee_belt/grab_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(check_streak(A,D))
		return TRUE
	..()

/datum/martial_art/melee_belt/harm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(check_streak(A,D))
		return TRUE

/datum/martial_art/melee_belt/proc/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	switch(streak)
		if("leg_sweep")
			streak = ""
			leg_sweep(A,D)
			return TRUE
	return FALSE

/datum/martial_art/melee_belt/teach(mob/living/carbon/human/H,make_temporary=0)
	if(..())
		ADD_TRAIT(H, TRAIT_NOGUNS, "No_guns")
		to_chat(H, "<span class = 'userdanger'>You know the arts of [name]!</span>")
		to_chat(H, "<span class = 'danger'>Place your cursor over a move at the top of the screen to see what it does.</span>")
		melee_belt.Grant(H)

/datum/martial_art/melee_belt/on_remove(mob/living/carbon/human/H)
	REMOVE_TRAIT(H, TRAIT_NOGUNS, "No_guns")
	to_chat(H, "<span class = 'userdanger'>You suddenly forget the arts of [name]...</span>")
	melee_belt.Remove(H)

/datum/martial_art/melee_belt/proc/leg_sweep(mob/living/carbon/human/A, mob/living/carbon/human/D)
	var/obj/item/bodypart/affecting = D.get_bodypart(BODY_ZONE_CHEST)
	var/armor_block = D.run_armor_check(affecting, "melee")
	var/damage = (damage_roll(A,D)*2 + 25)
	if(!CHECK_MOBILITY(D, MOBILITY_STAND))
		return FALSE
	D.visible_message("<span class='warning'>[A] leg sweeps [D]!</span>", \
						"<span class='userdanger'>[A] leg sweeps you!</span>")
	playsound(get_turf(A), 'sound/effects/hit_kick.ogg', 50, 1, -1)
	D.apply_damage(damage, STAMINA, affecting, armor_block)
	D.DefaultCombatKnockdown(80, override_hardstun = 1, override_stamdmg = 0)
	log_combat(A, D, "leg sweeped")
	return TRUE

/obj/item/storage/belt/bigleagues/melee
	name = "combat belt"
	var/datum/martial_art/melee_belt/style = new

/obj/item/storage/belt/bigleagues/melee/mob_can_equip(mob/user, mob/equipper, slot, disable_warning = 1)
	var/mob/living/carbon/human/H = user
	if(src == H.belt) //Suit is already equipped
		return ..()
	if (!HAS_TRAIT(H, TRAIT_BIG_LEAGUES) && slot == SLOT_BELT)
		to_chat(user, "<span class='warning'>You don't have the proper melee training to wear this!</span>")
		return 0
	if(slot == SLOT_BELT)
		return ..()
	return

/obj/item/storage/belt/bigleagues/melee/equipped(mob/user, slot)
	. = ..()
	if(ishuman(user) && slot == SLOT_BELT)
		var/mob/living/carbon/human/H = user
		style.teach(H,1)

/obj/item/storage/belt/bigleagues/melee/dropped(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.get_item_by_slot(SLOT_BELT) == src)
		style.remove(H)