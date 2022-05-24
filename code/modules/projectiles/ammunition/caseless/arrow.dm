//FO13 arrows
/obj/item/ammo_casing/caseless/arrow
	name = "metal arrow"
	desc = "A simple arrow with a metal head."
	projectile_type = /obj/item/projectile/bullet/reusable/arrow
	caliber = "arrow"
	icon_state = "arrow"
	custom_materials = list(/datum/material/iron = 500)
	throwforce = 8 //good luck hitting someone with the pointy end of the arrow
	throw_speed = 3
	w_class = WEIGHT_CLASS_NORMAL
	is_pickable = FALSE

/obj/item/ammo_casing/caseless/arrow/cheap
	name = "cheap arrow"
	desc = "A cheap, small, lightweight arrow made from wood. Not as effective against armor."
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/cheap
	icon_state = "cheaparrow"
	throwforce = 6
	custom_materials = list(/datum/material/wood = 500)
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_casing/caseless/arrow/ap
	name = "sturdy arrow"
	desc = "A reinforced arrow with a metal shaft and heavy duty head."
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/ap
	icon_state = "arrow_ap"

/obj/item/ammo_casing/caseless/arrow/poison
	name = "poison arrow"
	desc = "A simple arrow, tipped in a poisonous paste."
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/poison
	icon_state = "arrow_poison"

/obj/item/ammo_casing/caseless/arrow/burning
	name = "burn arrow"
	desc = "A simple arrow slathered in a paste that burns skin on contact."
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/burning
	icon_state = "arrow_burning"

/obj/item/ammo_casing/caseless/arrow/broadhead
	name = "broadhead arrow"
	desc = "A sharp metal arrow with a broad head. Likely to stick in a wound."
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "arrow_broadhead"
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/broadhead

/obj/item/ammo_casing/caseless/arrow/serrated
	name = "serrated arrow"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	desc = "A sharp metal arrow with a wicked sharp serrated teeth. Likely to shred an artery."
	icon_state = "arrow_serrated"
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/serrated

//CIT ARROWS
/obj/item/ammo_casing/caseless/arrow/wood
	name = "wooden arrow"
	desc = "An arrow made of wood, typically fired from a bow."

/obj/item/ammo_casing/caseless/arrow/ash
	name = "ashen arrow"
	desc = "An arrow made of wood, hardened by fire."
	icon_state = "ashenarrow"
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/ash

/obj/item/ammo_casing/caseless/arrow/bone
	name = "bone arrow"
	desc = "An arrow made of bone and sinew. The tip is sharp enough to pierce through deathclaw hide."
	icon_state = "bonearrow"
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/bone

/obj/item/ammo_casing/caseless/arrow/bronze
	name = "bronze arrow"
	desc = "An arrow made of wood, tipped with bronze. The tip is dense enough to provide some armor penetration."
	icon_state = "bronzearrow"
	projectile_type = /obj/item/projectile/bullet/reusable/arrow/bronze
