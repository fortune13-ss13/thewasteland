/obj/item/modkit
	name = "modkit"
	desc = "A small container of parts made to modify a specific item. Use the target item on this kit to convert it."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "modkit"
	w_class = WEIGHT_CLASS_NORMAL
	var/list/target_items = list()
	var/result_item = null

/obj/item/modkit/pre_attack(obj/item/I, mob/user)
	if(is_type_in_list(I, target_items))
		var/obj/item/R = new result_item(get_turf(user))
		to_chat(user, "<span class='notice'>You apply the [src] to [I], using the custom parts to turn it into [R].</span>")
		remove_item_from_storage(I)
		qdel(I)
		user.put_in_hands(R)
		qdel(src)
		return TRUE
	else
		return ..()

/obj/item/modkit/riotgear
	name = "desert ranger riot gear modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/rangercombat)
	result_item = /obj/item/clothing/suit/armor/f13/rangercombat/desert

/obj/item/modkit/riotgear_helmet
	name = "desert ranger riot helmet modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/ncr/rangercombat)
	result_item = /obj/item/clothing/head/helmet/f13/ncr/rangercombat/desert

/obj/item/modkit/riotgear/fox
	name = "sniper riot gear modkit"
	result_item = /obj/item/clothing/suit/armor/f13/rangercombat/foxcustom

/obj/item/modkit/riotgear_helmet/fox
	name = "reclaimed ranger-hunter combat helmet modkit"
	result_item = /obj/item/clothing/head/helmet/f13/ncr/rangercombat/foxcustom

/obj/item/modkit/riotgear/rigs
	name = "11th armored calvary armor modkit"
	result_item = /obj/item/clothing/suit/armor/f13/rangercombat/rigscustom

/obj/item/modkit/riotgear_helmet/rigs
	name = "11th armored calvary helmet modkit"
	result_item = /obj/item/clothing/head/helmet/f13/ncr/rangercombat/rigscustom

/obj/item/modkit/thax_patrol
	name = "modified patrol armor modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/combat/ncr_patrol)
	result_item = /obj/item/clothing/suit/armor/f13/combat/ncr_patrol/thax

/obj/item/modkit/shank
	name = "follower's duster modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/shankduster

/*
/obj/item/modkit/custom_excess
	name = "champion of kanab's armor modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/legion/centurion,
						/obj/item/clothing/suit/armor/f13/legion/rangercent,
						/obj/item/clothing/suit/armor/f13/legion/palacent)
	result_item = /obj/item/clothing/suit/armor/f13/legion/palacent/custom_excess

/obj/item/modkit/custom_excess_helmet
	name = "champion of kanab's helm modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/legion/centurion,
						/obj/item/clothing/head/helmet/f13/legion/rangercent,
						/obj/item/clothing/head/helmet/f13/legion/palacent)
	result_item = /obj/item/clothing/head/helmet/f13/legion/palacent/custom_excess
*/

/obj/item/modkit/piper_hat
	name = "gambler's hat modkit"
	target_items = list(/obj/item/clothing/head/f13/trailranger)
	result_item = /obj/item/clothing/head/f13/flatranger

/obj/item/modkit/piper_vest
	name = "armoured poncho modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/trailranger)
	result_item = /obj/item/clothing/suit/toggle/armor/f13/cloakranger

/obj/item/modkit/digger_helm
	name = "salvaged riot armor modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/herbertranger

/obj/item/modkit/digger_vest
	name = "salvaged riot helmet modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/raider)
	result_item = /obj/item/clothing/head/helmet/f13/herbertranger

/obj/item/modkit/diohelmet
	name = "galerum lacertarex"
	target_items = list(/obj/item/clothing/head/helmet/f13/legion/venator)
	result_item = /obj/item/clothing/head/helmet/f13/legion/venator/diohelmet

/obj/item/modkit/trenchcoatfollowers
	name = "followers trenchcoat modkit"
	target_items = list(/obj/item/clothing/suit/armor/vest)
	result_item = /obj/item/clothing/suit/armor/vest/trench

/obj/item/modkit/patrolduster
	name = "patrol duster modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/raider/combatduster/patrolduster

/obj/item/modkit/wolfvest
	name = "subdued ranger vest modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/combat/ncr_patrol)
	result_item = /obj/item/clothing/suit/armor/f13/modif_r_vest

/// Donator Modkits (You can use these if you are an public donator if you ask)

/obj/item/modkit/khanbat
	name = "khanbat armor modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/combat)
	result_item = /obj/item/clothing/suit/armor/f13/combat/khan

/obj/item/modkit/khanbatreinforced
	name = "khanbat reinforced armor modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/combat/mk2)
	result_item = /obj/item/clothing/suit/armor/f13/combat/mk2/khan

/obj/item/modkit/rangerpatrolhat
	name = "ranger patrol hat modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/ncr/rangercombat)
	result_item = /obj/item/clothing/head/helmet/f13/rangercombat/rangertrauma

/obj/item/modkit/degancustomarmor
	name = "sniper riot gear armor modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/combat/ncr_patrol)
	result_item = /obj/item/clothing/suit/armor/f13/rangercombat/degancustom

/obj/item/modkit/environmentalhelm
	name = "environmental helmet modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/raider)
	result_item = /obj/item/clothing/head/helmet/f13/combat/environmental

/obj/item/modkit/environmentalarmor
	name = "environmental armor modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/combat/environmental

/obj/item/modkit/daemonhelm
	name = "daemon helmet modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/legion/vet/decan)
	result_item = /obj/item/clothing/head/helmet/f13/legion/vet/decan/daemon

/obj/item/modkit/daemonarmor
	name = "daemon armor modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/legion/heavy)
	result_item = /obj/item/clothing/suit/armor/f13/legion/heavy/daemon
// Daemon said anyone can use his armor as long as they are vet decanius plus, but keep it for supporters only same goes with the khanbat ones too, just ask in supporter channel.



/// Personal Donator Modkits (dont use unless you are them or have permission)

/obj/item/modkit/sokkxxhelm
	name = "experimental x02 power armor helmet conversion kit"
	target_items = list(/obj/item/clothing/head/helmet/f13/power_armor/x02helmet)
	result_item = /obj/item/clothing/head/helmet/f13/power_armor/x02helmet/sokkxxhelm

/obj/item/modkit/sokkxxarmor
	name = "experimental x02 power armor suit conversion kit"
	target_items = list(/obj/item/clothing/suit/armor/f13/power_armor/x02)
	result_item = /obj/item/clothing/suit/armor/f13/power_armor/x02/sokkxx

/obj/item/modkit/enclavencotrenchcoat
	name = "enclave nco trenchcoat modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/enclavetrenchcoat)
	result_item = /obj/item/clothing/suit/armor/f13/enclavetrenchcoat/gunny
