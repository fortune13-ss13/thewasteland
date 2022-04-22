///Lavaproof, fireproof, fast mech with low armor and higher energy consumption, cannot strafe and has an internal ore box.
/obj/mecha/working/clarke
	desc = "Combining man and machine for a better, stronger engineer. Can even resist lava!"
	name = "\improper Clarke"
	icon_state = "clarke"
	max_temperature = 65000
	max_integrity = 300
	step_in = 1.75
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	lights_power = 7
	step_energy_drain = 15 //slightly higher energy drain since you movin those wheels FAST
	armor = list("melee" = 30, "bullet" = 20, "laser" = 20, "energy" = 20, "bomb" = 60, "bio" = 0, "rad" = 100, "fire" = 100, "acid" = 100)
	max_equip = 5
	wreckage = /obj/structure/mecha_wreckage/clarke
//	canstrafe = TRUE
	/// Handles an internal ore box for Clarke
	var/obj/structure/ore_box/box

/obj/mecha/working/clarke/Initialize()
	. = ..()
	box = new /obj/structure/ore_box(src)
	var/obj/item/mecha_parts/mecha_equipment/orebox_manager/ME = new(src)
	ME.attach(src)

/obj/mecha/working/clarke/Destroy()
	box.dump_box_contents()
	return ..()

/obj/mecha/working/clarke/moved_inside(mob/living/carbon/human/H)
	. = ..()
	if(.)
		var/datum/atom_hud/hud = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		hud.add_hud_to(H)

/obj/mecha/working/clarke/go_out()
	if(isliving(occupant))
		var/mob/living/L = occupant
		var/datum/atom_hud/hud = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		hud.remove_hud_from(L)
	return ..()

/obj/mecha/working/clarke/mmi_moved_inside(obj/item/mmi/M, mob/user)
	. = ..()
	if(.)
		var/datum/atom_hud/hud = GLOB.huds[DATA_HUD_DIAGNOSTIC_ADVANCED]
		var/mob/living/brain/B = M.brainmob
		hud.add_hud_to(B)

//Ore Box Controls

///Special equipment for the Clarke mech, handles moving ore without giving the mech a hydraulic clamp and cargo compartment.
/obj/item/mecha_parts/mecha_equipment/orebox_manager
	name = "ore storage module"
	desc = "An automated ore box management device."
	icon_state = "mecha_clamp" //None of this should matter, this shouldn't ever exist outside a mech anyway.
	selectable = FALSE
//	detachable = FALSE
	salvageable = FALSE
	/// Var to avoid istype checking every time the topic button is pressed. This will only work inside Clarke mechs.
	var/obj/mecha/working/clarke/hostmech

/obj/item/mecha_parts/mecha_equipment/orebox_manager/attach(obj/mecha/M)
	. = ..()
	if(istype(M, /obj/mecha/working/clarke))
		hostmech = M

/obj/item/mecha_parts/mecha_equipment/orebox_manager/detach()
	hostmech = null //just in case
	return ..()

/obj/item/mecha_parts/mecha_equipment/orebox_manager/Topic(href,href_list)
	. = ..()
	if(!hostmech || !hostmech.box)
		return
	hostmech.box.dump_box_contents()

/obj/item/mecha_parts/mecha_equipment/orebox_manager/get_equip_info()
	return "[..()] [hostmech?.box ? "<a href='?src=[REF(src)];mode=0'>Unload Cargo</a>" : "Error"]"