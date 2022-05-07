/obj/mecha/working
	internal_damage_threshold = 40
	exit_delay = 10
	enter_delay = 20
	light_power = 9
	light_range = 10

/obj/mecha/working/Move()
	. = ..()
	if(.)
		collect_ore()

/obj/mecha/working/proc/collect_ore()
	if((locate(/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp) in equipment))
		var/obj/structure/ore_box/ore_box = locate(/obj/structure/ore_box) in contents
		if(ore_box)
			for(var/obj/item/stack/ore/ore in range(1, src))
				if(ore.Adjacent(src) && ((get_dir(src, ore) & dir) || ore.loc == loc)) //we can reach it and it's in front of us? grab it!
					ore.forceMove(ore_box)
