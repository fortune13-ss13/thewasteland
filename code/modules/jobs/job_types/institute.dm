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

/datum/outfit/job/institute/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)

///////////////////////
/// Courser Leader - Admin ///
///////////////////////

//Courser - SPAWN THIS FOR EVENT STUFF ONLY!!!
/datum/job/institute/courserleader
	title = "Courser Leader"
	flag = F13COURSERLEADER
	total_positions = 0
	spawn_positions = 0
	req_admin_notify = 1
	access = list(ACCESS_ROBOTICS, ACCESS_INSTITUTE, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	description = "You are probably the last operating cell of the Enclave in the US, as far as you know. Now that the lore is out of the way, just make the round fun. You set the policies and the attitude of the Enclave this week."
	supervisors = "Enclave Department of the Army."
	outfit = /datum/outfit/job/institute/courser/courserleader
	exp_type = EXP_TYPE_INSTITUTE
	exp_requirements = 3000

/datum/outfit/job/institute/courser/courserleader
	name = "Institute Courser"
	jobtype = /datum/outfit/job/institute/courser/courserleader
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

/datum/outfit/job/institute/courser/fieldcourser/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

//Courser - SPAWN THIS FOR EVENT STUFF ONLY!!!
/datum/job/institute/courser/fieldcourser
	title = "Institute Courser"
	flag = F13COURSER
	total_positions = 0
	spawn_positions = 0
	req_admin_notify = 1
	access = list(ACCESS_ROBOTICS, ACCESS_INSTITUTE, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	description = "You are probably the last operating cell of the Enclave in the US, as far as you know. Now that the lore is out of the way, just make the round fun. You set the policies and the attitude of the Enclave this week."
	supervisors = "Enclave Department of the Army."
	outfit = /datum/outfit/job/institute/courser/fieldcourser
	exp_type = EXP_TYPE_INSTITUTE
	exp_requirements = 3000

/datum/outfit/job/institute/courser/fieldcourser
	name = "Institute Courser"
	jobtype = /datum/outfit/job/institute/courser/fieldcourser
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

/datum/outfit/job/institute/courser/fieldcourser/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

//Institute Soldier Synth - SPAWN THIS FOR EVENT STUFF ONLY!!!
/datum/job/institute/mkllsoldier
	title = "Institute Synth Soldier"
	flag = F13INSTITUTESYNTH
	total_positions = 0
	spawn_positions = 0
	req_admin_notify = 1
	access = list(ACCESS_ROBOTICS, ACCESS_INSTITUTE, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	description = "You are probably the last operating cell of the Enclave in the US, as far as you know. Now that the lore is out of the way, just make the round fun. You set the policies and the attitude of the Enclave this week."
	supervisors = "Enclave Department of the Army."
	outfit = /datum/outfit/job/institute/courser/mkllsoldier
	exp_type = EXP_TYPE_INSTITUTE
	exp_requirements = 3000

/datum/outfit/job/institute/courser/mkllsoldier
	name = "Institute Synth Soldier"
	jobtype = /datum/outfit/job/institute/courser/mkllsoldier
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

/datum/outfit/job/institute/courser/mkllsoldier/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

//institute Scientist
//Courser - SPAWN THIS FOR EVENT STUFF ONLY!!!
/datum/job/institute/institutesci
	title = "Institute Scientist"
	flag = F13INSTITUTESCI
	total_positions = 0
	spawn_positions = 0
	req_admin_notify = 1
	access = list(ACCESS_ENCLAVE, ACCESS_CHANGE_IDS, ACCESS_ENCLAVE_COMMAND)
	description = "You are probably the last operating cell of the Enclave in the US, as far as you know. Now that the lore is out of the way, just make the round fun. You set the policies and the attitude of the Enclave this week."
	supervisors = "Enclave Department of the Army."
	outfit = /datum/outfit/job/institute/noncombat/institutesci
	exp_type = EXP_TYPE_INSTITUTE
	exp_requirements = 3000

/datum/outfit/job/institute/noncombat/institutesci
	name = "Institute Scientist"
	jobtype = /datum/outfit/job/institute/noncombat/institutesci
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

/datum/outfit/job/institute/noncombat/institutesci/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/institute/noncombat/institutesci/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_UNETHICAL_PRACTITIONER, src) // Brainwashing
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/USAeyebot,)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/jet,)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/turbo,)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/psycho,)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx,)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/buffout)

//Escaped Synth - SPAWN THIS FOR EVENT STUFF ONLY!!!
/datum/job/institute/escapedsynth
	title = "Escaped Synth"
	flag = F13ESCAPEDSYNTH
	total_positions = 0
	spawn_positions = 0
	req_admin_notify = 1
	description = "You are probably the last operating cell of the Enclave in the US, as far as you know. Now that the lore is out of the way, just make the round fun. You set the policies and the attitude of the Enclave this week."
	supervisors = "Enclave Department of the Army."
	outfit = /datum/outfit/job/institute/noncombat/escapedsynth
	exp_type = EXP_TYPE_ENCLAVE
	exp_requirements = 3000

/datum/outfit/job/institute/noncombat/escapedsynth
	name = "Escaped Synth"
	jobtype = /datum/outfit/job/institute/noncombat/escapedsynth
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

/datum/outfit/job/institute/noncombat/escapedsynth/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)
