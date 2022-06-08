/obj/item/reagent_containers/glass
	name = "glass"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5, 10, 15, 20, 25, 30, 50)
	volume = 50
	reagent_flags = OPENCONTAINER
	spillable = TRUE
	resistance_flags = ACID_PROOF
	container_HP = 2

/obj/item/reagent_containers/glass/attack(mob/M, mob/user, obj/target)
	// WARNING: This entire section is shitcode and prone to breaking at any time.
	INVOKE_ASYNC(src, .proc/attempt_feed, M, user, target)		// for example, the arguments in this proc are wrong
	// but i don't have time to properly fix it right now.

/obj/item/reagent_containers/glass/proc/attempt_feed(mob/M, mob/user, obj/target)
	if(!canconsume(M, user))
		return

	if(!spillable)
		return

	if(!reagents || !reagents.total_volume)
		to_chat(user, "<span class='warning'>[src] is empty!</span>")
		return

	if(istype(M))
		if(user.a_intent == INTENT_HARM)
			M.visible_message("<span class='danger'>[user] splashes the contents of [src] onto [M]!</span>", \
							"<span class='userdanger'>[user] splashes the contents of [src] onto [M]!</span>")
			var/R = reagents?.log_list()
			if(isturf(target) && reagents.reagent_list.len && thrownby)
				log_combat(thrownby, target, "splashed (thrown) [english_list(reagents.reagent_list)]")
				message_admins("[ADMIN_LOOKUPFLW(thrownby)] splashed (thrown) [english_list(reagents.reagent_list)] on [target] at [ADMIN_VERBOSEJMP(target)].")
			reagents.reaction(M, TOUCH)
			log_combat(user, M, "splashed", R)
			var/turf/UT = get_turf(user)
			var/turf/MT = get_turf(M)
			var/turf/OT = get_turf(target)
			log_reagent("SPLASH: attack(target mob [key_name(M)] at [AREACOORD(MT)], from user [key_name(user)] at [AREACOORD(UT)], target object [target] at [AREACOORD(OT)]) - [R]")
			reagents.clear_reagents()
		else
			var/self_fed = M == user
			if(!self_fed)
				M.visible_message("<span class='danger'>[user] attempts to feed something to [M].</span>", \
							"<span class='userdanger'>[user] attempts to feed something to you.</span>")
				log_combat(user, M, "is attempting to feed", reagents.log_list())
				if(!do_mob(user, M))
					return
				if(!reagents || !reagents.total_volume)
					return // The drink might be empty after the delay, such as by spam-feeding
				var/turf/UT = get_turf(user)		// telekenesis memes
				var/turf/MT = get_turf(M)
				M.visible_message("<span class='danger'>[user] feeds something to [M].</span>", "<span class='userdanger'>[user] feeds something to you.</span>")
				log_combat(user, M, "fed", reagents.log_list())
				log_reagent("INGESTION: FED BY: [key_name(user)] (loc [user.loc] at [AREACOORD(UT)]) -> [key_name(M)] (loc [M.loc] at [AREACOORD(MT)]) - [reagents.log_list()]")
			else
				var/turf/T = get_turf(user)
				to_chat(user, "<span class='notice'>You swallow a gulp of [src].</span>")
				log_reagent("INGESTION: SELF: [key_name(user)] (loc [user.loc] at [AREACOORD(T)]) - [reagents.log_list()]")
			var/fraction = min(5/reagents.total_volume, 1)
			reagents.reaction(M, INGEST, fraction)
			addtimer(CALLBACK(reagents, /datum/reagents.proc/trans_to, M, 5, null, null, null, self_fed? "self swallowed" : "fed by [user]"), 5)
			playsound(M.loc,'sound/items/drink.ogg', rand(10,50), 1)

/obj/item/reagent_containers/glass/afterattack(obj/target, mob/user, proximity)
	. = ..()
	if((!proximity) || !check_allowed_items(target,target_self=1))
		return

	if(target.is_refillable()) //Something like a glass. Player probably wants to transfer TO it.
		if(!reagents.total_volume)
			to_chat(user, "<span class='warning'>[src] is empty!</span>")
			return

		if(target.reagents.holder_full())
			to_chat(user, "<span class='warning'>[target] is full.</span>")
			return

		var/trans = reagents.trans_to(target, amount_per_transfer_from_this, log = "reagentcontainer-glass afterattack transfer to")
		to_chat(user, "<span class='notice'>You transfer [trans] unit\s of the solution to [target].</span>")

	else if(target.is_drainable()) //A dispenser. Transfer FROM it TO us.
		if(!target.reagents.total_volume)
			to_chat(user, "<span class='warning'>[target] is empty and might not be refillabe.</span>")
			return

		if(reagents.holder_full())
			to_chat(user, "<span class='warning'>[src] is full.</span>")
			return

		var/trans = target.reagents.trans_to(src, amount_per_transfer_from_this, log = "reagentcontainer-glass afterattack fill from")
		to_chat(user, "<span class='notice'>You fill [src] with [trans] unit\s of the contents of [target].</span>")

	else if(reagents.total_volume)
		if(user.a_intent == INTENT_HARM)
			user.visible_message("<span class='danger'>[user] splashes the contents of [src] onto [target]!</span>", \
								"<span class='notice'>You splash the contents of [src] onto [target].</span>")
			reagents.reaction(target, TOUCH)
			reagents.clear_reagents()

/obj/item/reagent_containers/glass/attackby(obj/item/I, mob/user, params)
	var/hotness = I.get_temperature()
	if(hotness && reagents)
		reagents.expose_temperature(hotness)
		to_chat(user, "<span class='notice'>You heat [name] with [I]!</span>")

	if(istype(I, /obj/item/reagent_containers/food/snacks/egg)) //breaking eggs
		var/obj/item/reagent_containers/food/snacks/egg/E = I
		if(reagents)
			if(reagents.total_volume >= reagents.maximum_volume)
				to_chat(user, "<span class='notice'>[src] is full.</span>")
			else
				to_chat(user, "<span class='notice'>You break [E] in [src].</span>")
				E.reagents.trans_to(src, E.reagents.total_volume, log = "reagentcontainer-glass break egg in")
				qdel(E)
			return
	..()

/obj/item/reagent_containers/glass/beaker
	name = "beaker"
	desc = "A beaker. It can hold up to 60 units. Unable to withstand extreme pHes."
	icon = 'icons/obj/chemical.dmi'
	volume = 60
	icon_state = "beaker"
	item_state = "beaker"
	custom_materials = list(/datum/material/glass=500)
	possible_transfer_amounts = list(5,10,15,20,25,30,50,60)
	container_flags = PH_WEAK|APTFT_ALTCLICK|APTFT_VERB

/obj/item/reagent_containers/glass/beaker/Initialize()
	. = ..()
	update_icon()

/obj/item/reagent_containers/glass/beaker/get_part_rating()
	return reagents.maximum_volume

/obj/item/reagent_containers/glass/beaker/on_reagent_change(changetype)
	update_icon()

/obj/item/reagent_containers/glass/beaker/update_overlays()
	. = ..()
	if(!cached_icon)
		cached_icon = icon_state

	if(reagents.total_volume)
		var/mutable_appearance/filling = mutable_appearance('icons/obj/reagentfillings.dmi', "[cached_icon]10", color = mix_color_from_reagents(reagents.reagent_list))

		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if(0 to 9)
				filling.icon_state = "[cached_icon]-10"
			if(10 to 24)
				filling.icon_state = "[cached_icon]10"
			if(25 to 49)
				filling.icon_state = "[cached_icon]25"
			if(50 to 74)
				filling.icon_state = "[cached_icon]50"
			if(75 to 79)
				filling.icon_state = "[cached_icon]75"
			if(80 to 90)
				filling.icon_state = "[cached_icon]80"
			if(91 to INFINITY)
				filling.icon_state = "[cached_icon]100"
		. += filling

/obj/item/reagent_containers/glass/beaker/jar
	name = "honey jar"
	desc = "A jar for honey. It can hold up to 60 units of sweet delight. Unable to withstand reagents of an extreme pH."
	icon_state = "honey"

/obj/item/reagent_containers/glass/beaker/glass_dish
	name = "glass dish"
	desc = "A tiny glass dish. It can hold up to 3 units. Unable to withstand reagents of an extreme pH."
	custom_materials = list(/datum/material/glass = 500)
	icon_state = "glass_disk"
	possible_transfer_amounts = list(0.1,0.5,0.75,1,2,3)
	volume = 3

/obj/item/reagent_containers/glass/beaker/flask/large
	name = "large flask"
	desc = "A large flask. It can hold up to 80 units. Unable to withstand reagents of an extreme pH."
	custom_materials = list(/datum/material/glass = 2500)
	icon_state = "flasklarge"
	volume = 80

/obj/item/reagent_containers/glass/beaker/flask
	name = "small flask"
	desc = "A small flask. It can hold up to 40 units. Unable to withstand reagents of an extreme pH."
	custom_materials = list(/datum/material/glass = 1000)
	icon_state = "flasksmall"
	volume = 40

/obj/item/reagent_containers/glass/beaker/flask/spouty
	name = "flask with spout"
	desc = "A flask with a spout! It can hold up to 120 units. Unable to withstand reagents of an extreme pH."
	custom_materials = list(/datum/material/glass = 2500)
	icon_state = "flaskspouty"
	possible_transfer_amounts = list(1,2,3,4,5,10,15,20,25,30,50,100,120)
	volume = 120

/obj/item/reagent_containers/glass/beaker/large
	name = "large beaker"
	desc = "A large beaker. Can hold up to 120 units. Unable to withstand reagents of an extreme pH."
	icon_state = "beakerlarge"
	custom_materials = list(/datum/material/glass=2500)
	volume = 120
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,20,25,30,40,50,60,120)
	container_HP = 3

/obj/item/reagent_containers/glass/beaker/plastic
	name = "x-large beaker"
	desc = "An extra-large beaker. Can hold up to 180 units. Is able to resist acid and alkaline solutions, but melts at 444 K."
	icon_state = "beakerwhite"
	custom_materials = list(/datum/material/glass=2500, /datum/material/plastic=3000)
	volume = 180
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,20,25,30,40,50,60,120,180)
	container_flags = TEMP_WEAK|APTFT_ALTCLICK|APTFT_VERB
	cached_icon = "beakerlarge"

/obj/item/reagent_containers/glass/beaker/meta
	name = "metamaterial beaker"
	desc = "A large beaker. Can hold up to 240 units, and is able to withstand all chemical situations."
	icon_state = "beakergold"
	custom_materials = list(/datum/material/glass=2500, /datum/material/plastic=3000, /datum/material/gold=1000, /datum/material/titanium=1000)
	volume = 240
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,20,25,30,40,50,60,120,200,240)
	container_flags = APTFT_ALTCLICK|APTFT_VERB

/obj/item/reagent_containers/glass/beaker/noreact
	name = "cryostasis beaker"
	desc = "A cryostasis beaker that allows for chemical storage without \
		reactions. Can hold up to 50 units."
	icon_state = "beakernoreact"
	custom_materials = list(/datum/material/iron=3000)
	reagent_flags = OPENCONTAINER | NO_REACT
	volume = 50
	amount_per_transfer_from_this = 10
	container_flags = APTFT_ALTCLICK|APTFT_VERB
	container_HP = 10//shouldn't be needed

/obj/item/reagent_containers/glass/beaker/bluespace
	name = "bluespace beaker"
	desc = "A bluespace beaker, powered by experimental bluespace technology \
		and Element Cuban combined with the Compound Pete. Can hold up to \
		300 units. Unable to withstand reagents of an extreme pH."
	icon_state = "beakerbluespace"
	custom_materials = list(/datum/material/glass = 5000, /datum/material/plasma = 3000, /datum/material/diamond = 1000, /datum/material/bluespace = 1000)
	volume = 300
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,20,25,30,50,100,300)
	container_HP = 5

/obj/item/reagent_containers/glass/beaker/cryoxadone
	list_reagents = list(/datum/reagent/medicine/cryoxadone = 30)

/obj/item/reagent_containers/glass/beaker/sulphuric
	list_reagents = list(/datum/reagent/toxin/acid = 50)

/obj/item/reagent_containers/glass/beaker/large/styptic
	name = "styptic reserve tank"
	list_reagents = list(/datum/reagent/medicine/styptic_powder = 50)

/obj/item/reagent_containers/glass/beaker/large/silver_sulfadiazine
	name = "silver sulfadiazine reserve tank"
	list_reagents = list(/datum/reagent/medicine/silver_sulfadiazine = 50)

/obj/item/reagent_containers/glass/beaker/large/charcoal
	name = "charcoal reserve tank"
	list_reagents = list(/datum/reagent/medicine/charcoal = 50)

/obj/item/reagent_containers/glass/beaker/large/epinephrine
	name = "epinephrine reserve tank"
	list_reagents = list(/datum/reagent/medicine/epinephrine = 50)

/obj/item/reagent_containers/glass/beaker/synthflesh
	list_reagents = list(/datum/reagent/medicine/synthflesh = 50)

/obj/item/reagent_containers/glass/beaker/waterbottle
	name = "bottle of water"
	desc = "A bottle of water filled at an old Earth bottling facility."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "smallbottle"
	item_state = "bottle"
	custom_price = PRICE_CHEAP_AS_FREE
	list_reagents = list(/datum/reagent/water = 49.5, /datum/reagent/fluorine = 0.5)//see desc, don't think about it too hard
	custom_materials = list(/datum/material/glass=0)
	volume = 50
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,20,25,30,50)
	container_flags = TEMP_WEAK|APTFT_ALTCLICK|APTFT_VERB
	container_HP = 1

/obj/item/reagent_containers/glass/beaker/waterbottle/empty
	list_reagents = list()

/obj/item/reagent_containers/glass/beaker/waterbottle/large
	desc = "A fresh commercial-sized bottle of water."
	icon_state = "largebottle"
	custom_materials = list(/datum/material/glass=0)
	list_reagents = list(/datum/reagent/water = 100)
	volume = 100
	amount_per_transfer_from_this = 20
	possible_transfer_amounts = list(5,10,15,20,25,30,50,100)
	container_HP = 1

/obj/item/reagent_containers/glass/beaker/waterbottle/large/empty
	list_reagents = list()

/obj/item/reagent_containers/glass/beaker/waterbottle/wataur
	name = "Bottled Wataur"
	desc = "Finally, a bottle as proportionate as you."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "wataur"
	custom_materials = list(/datum/material/plastic=0)
	list_reagents = list(/datum/reagent/water = 100)
	volume = 100
	amount_per_transfer_from_this = 20
	possible_transfer_amounts = list(5,10,15,20,25,30,50, 100)
	container_flags = TEMP_WEAK|APTFT_ALTCLICK|APTFT_VERB
	container_HP = 1
	cached_icon = "wataur"

/obj/item/reagent_containers/glass/get_belt_overlay()
	return mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "bottle")

//Mortar & Pestle

/obj/item/pestle
	name = "bone pestle"
	desc = "An ancient, simple tool used in conjunction with a mortar to grind or juice items."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bone_pestle"
	w_class = WEIGHT_CLASS_SMALL
	force = 6

/obj/item/reagent_containers/glass/mortar
	name = "bone mortar"
	desc = "A specially formed bowl of ancient design. It is possible to crush or juice items placed in it using a pestle; however the process, unlike modern methods, is slow and physically exhausting."
	icon_state = "bone_mortar"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5, 10, 15, 20, 25, 30, 50, 60, 120)
	volume = 120
	item_flags = NO_MAT_REDEMPTION
	reagent_flags = OPENCONTAINER
	spillable = TRUE
	var/list/holdingitems
	var/mortar_mode = MORTAR_JUICE
	var/blacklistchems = list(
		/obj/item/reagent_containers/pill/patch/turbo,
		/obj/item/reagent_containers/pill/buffout,
		/obj/item/reagent_containers/pill/patch/jet,
	)
/obj/item/reagent_containers/glass/mortar/Initialize()
	. = ..()
	holdingitems = list()
/obj/item/reagent_containers/glass/mortar/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Alt-click to eject any item put inside.</span>"
	. += "<span class='notice'>Alt-click while the mortar is empty to change between grind/juice mode.</span>"

/obj/item/reagent_containers/glass/mortar/AltClick(mob/user)
	if(LAZYLEN(holdingitems))
		eject()
	else
		mortar_mode = !mortar_mode
		to_chat(user, "<span class='notice'>You decide to [mortar_mode == MORTAR_JUICE ? "juice the harvest" : "grind the harvest"].</span>")

/obj/item/reagent_containers/glass/mortar/attackby(obj/item/I, mob/living/carbon/human/user)
	if(is_type_in_list(I, blacklistchems))
		return
	if(istype(I,/obj/item/pestle))
		if(LAZYLEN(holdingitems))
			if(IS_STAMCRIT(user))
				to_chat(user, "<span class='warning'>You are too tired to work!</span>")
				return
			user.adjustStaminaLoss(2 * holdingitems.len) //max 40
			if(mortar_mode== MORTAR_JUICE)
				juice()
				return
			else
				grind()
				return
		else
			to_chat(user, "<span class='warning'>There is nothing to grind!</span>")
			return
	if(holdingitems.len >= 10)
		to_chat(user, "<span class='warning'>The [src] is full!</span>")
		return
	if(istype(I, /obj/item/storage/bag))
		var/list/inserted = list()
		if(SEND_SIGNAL(I, COMSIG_TRY_STORAGE_TAKE_TYPE, /obj/item/reagent_containers/food/snacks/grown, src, 10 - length(holdingitems), null, null, user, inserted))
			for(var/i in inserted)
				holdingitems[i] = TRUE
			if(!I.contents.len)
				to_chat(user, "<span class='notice'>You empty [I] into [src].</span>")
			else
				to_chat(user, "<span class='notice'>You fill [src] to the brim.</span>")
		return TRUE
	if(!I.grind_requirements(src)) //Error messages should be in the objects' definitions
		return
	if(I.juice_results || I.grind_results)
		if(user.transferItemToLoc(I, src))
			to_chat(user, "<span class='notice'>You add [I] to [src].</span>")
			holdingitems[I] = TRUE
			return FALSE
	to_chat(user, "<span class='warning'>You can't put this in the mortar!</span>")
	..()

/obj/item/reagent_containers/glass/mortar/proc/eject(mob/user)
	for(var/i in holdingitems)
		var/obj/item/O = i
		O.forceMove(drop_location())
		holdingitems -= O

/obj/item/reagent_containers/glass/mortar/proc/remove_object(obj/item/O)
	holdingitems -= O
	qdel(O)

/obj/item/reagent_containers/glass/mortar/proc/juice()
	for(var/obj/item/i in holdingitems)
		if(reagents.total_volume >= reagents.maximum_volume)
			break
		var/obj/item/I = i
		if(I.juice_results)
			juice_item(I)

/obj/item/reagent_containers/glass/mortar/proc/juice_item(obj/item/I) //Juicing results can be found in respective object definitions
	if(I.on_juice(src) == -1)
		to_chat(usr, "<span class='danger'>[src] cannot juice [I].</span>")
		return
	reagents.add_reagent_list(I.juice_results)
	remove_object(I)

/obj/item/reagent_containers/glass/mortar/proc/grind()
	for(var/i in holdingitems)
		if(reagents.total_volume >= reagents.maximum_volume)
			break
		var/obj/item/I = i
		if(I.grind_results)
			grind_item(i)

/obj/item/reagent_containers/glass/mortar/proc/grind_item(obj/item/I) //Grind results can be found in respective object definitions
	if(I.on_grind(src) == -1) //Call on_grind() to change amount as needed, and stop grinding the item if it returns -1
		to_chat(usr, "<span class='danger'>[src] cannot grind [I].</span>")
		return
	reagents.add_reagent_list(I.grind_results)
	if(I.reagents)
		I.reagents.trans_to(reagents, I.reagents.total_volume)
	remove_object(I)
