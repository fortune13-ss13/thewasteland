//It looks like var/faction controls what becomes visible on setup. Should likely be fixed or something, but I'm not doing it.
/datum/job/institute
	department_flag = INSTITUTE
	selection_color = "#ccceecad"
	faction = FACTION_INSTITUTE
	exp_type = EXP_TYPE_FALLOUT

	access = list(ACCESS_ROBOTICS, ACCESS_INSTITUTE, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_INSTITUTE, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	forbids = "Institute taboos: Aiding the Brotherhood, Unity, and Enclave."
	enforces = "Institute rules: Stay in uniform. Act mature and insightful. Obey orders and always remember you are fighting for the only attempt at restoring humanity."
	objectivesList = list("Synth Retention Bureau advisory: Collect resources and produce more synths.")

/datum/outfit/job/institute
	id = null
	backpack = /obj/item/storage/backpack/enclave
	satchel = /obj/item/storage/backpack/satchel/enclave
	ears = /obj/item/radio/headset/headset_enclave
	glasses = /obj/item/clothing/glasses/night/f13/enclave
	belt = /obj/item/storage/belt/military/assault/enclave
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/f13/enclave/serviceboots
	box = /obj/item/storage/survivalkit_adv

/datum/outfit/job/institute/courser
	id = /obj/item/card/id/dogtag/enclave/trooper
	mask = /obj/item/clothing/mask/gas/enclave
	neck = /obj/item/storage/belt/holster/legholster
	uniform = /obj/item/clothing/under/f13/enclave/peacekeeper
	gloves = /obj/item/clothing/gloves/f13/military

/datum/outfit/job/institute/noncombat
	id = /obj/item/card/id/dogtag/enclave/noncombatant
	uniform = /obj/item/clothing/under/f13/enclave/science

/datum/outfit/job/enclave/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)

///////////////////////
/// Courser Leader - Admin ///
///////////////////////

/datum/outfit/job/institute/courser/courserleader
	title = "Courser Leader"
	flag = F13COURSERLEADER
	total_positions = 0
	spawn_positions = 0
	head_announce = list("Security")
	req_admin_notify = 1
	access = list(ACCESS_ROBOTICS, ACCESS_INSTITUTE, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	supervisors = "Synth Retention Bureau"
	outfit = /datum/outfit/job/institute/courser/courserleader

/datum/outfit/job/institute/courser/courserleader	// Hellfire Power Armor, Glock 86a === This is filler to get the roles to work, I'll sort out the rest later - Tzula
	name = "Courser Leader"
	jobtype = /datum/outfit/job/institute/courser/courserleader
	head = /obj/item/clothing/head/helmet/f13/power_armor/advanced/hellfire
	uniform = /obj/item/clothing/under/f13/enclave/officer
	suit = /obj/item/clothing/suit/armor/f13/power_armor/advanced/hellfire
	suit_store = /obj/item/gun/energy/laser/plasma/glock/extended
	accessory = /obj/item/clothing/accessory/ncr/CPT
	id = /obj/item/card/id/dogtag/enclave/officer
	ears = /obj/item/radio/headset/headset_enclave/command

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 3,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/megaphone = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/classic_baton/telescopic = 1
			)

/datum/outfit/job/institute/courser/courserleader/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)


//Courser - SPAWN THIS FOR EVENT STUFF ONLY!!!
/datum/outfit/job/institute/courser
	title = "Institute Courser"
	flag = F13USLT
	total_positions = 0
	spawn_positions = 0
	req_admin_notify = 1
	access = list(ACCESS_ENCLAVE, ACCESS_CHANGE_IDS, ACCESS_ENCLAVE_COMMAND)
	description = "You are probably the last operating cell of the Enclave in the US, as far as you know. Now that the lore is out of the way, just make the round fun. You set the policies and the attitude of the Enclave this week."
	supervisors = "Enclave Department of the Army."
	outfit = /datum/outfit/job/institute/courser
	exp_type = EXP_TYPE_ENCLAVE
	exp_requirements = 3000

/datum/outfit/job/institute/courser
	name = "Institute Courser"
	jobtype = /datum/outfit/job/institute/courser
	head = /obj/item/clothing/head/helmet/f13/enclave/officer
	uniform = /obj/item/clothing/under/f13/enclave/officer
	suit = /obj/item/clothing/suit/armor/f13/enclavetrenchcoat
	accessory = /obj/item/clothing/accessory/ncr/LT1
	id = /obj/item/card/id/dogtag/enclave/officer
	ears = /obj/item/radio/headset/headset_enclave/command

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 3,
		/obj/item/grenade/flashbang = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		)

/datum/outfit/job/enclave/peacekeeper/enclavelt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

