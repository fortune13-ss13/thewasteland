/obj/mecha/medical/odysseus
	name = "\improper Odysseus"
	desc = "A civilian medical exosuit model, produced to assist in medical bays of the Vaults."
	icon_state = "odysseus"
	step_in = 2
	max_temperature = 15000
	max_integrity = 250
	wreckage = /obj/structure/mecha_wreckage/odysseus
	internal_damage_threshold = 35
	step_energy_drain = 6

/obj/mecha/medical/odysseus/moved_inside(mob/living/carbon/human/H)
	. = ..()
	if(.)
		var/datum/atom_hud/hud = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
		hud.add_hud_to(H)

/obj/mecha/medical/odysseus/go_out()
	if(isliving(occupant))
		var/mob/living/carbon/human/L = occupant
		var/datum/atom_hud/hud = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
		hud.remove_hud_from(L)
	..()

/obj/mecha/medical/odysseus/mmi_moved_inside(obj/item/mmi/mmi_as_oc, mob/user)
	. = ..()
	if(.)
		var/datum/atom_hud/hud = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
		var/mob/living/brain/B = mmi_as_oc.brainmob
		hud.add_hud_to(B)
