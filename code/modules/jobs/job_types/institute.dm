/datum/job/institute //do NOT use this for anything, it's just to store faction datums.
	department_flag = INSTITUTE
	selection_color = "#1f7aa5"
	faction = FACTION_INSTITUTE

	access = list(ACCESS_ROBOTICS, ACCESS_INSTITUTE, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_INSTITUTE, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	exp_type = EXP_TYPE_FALLOUT
	forbids = "Institute taboos: Needlessly destroying life, revealing any information about the organization, talking to outsiders AT ALL"
	enforces = "Institute rules: Stay in uniform. Act mature and insightful. Obey directives given to you at all costs and help restore humanity through any means necessary."


/datum/outfit/job/institute
	id = null
	backpack = /obj/item/storage/backpack/duffelbag/durathread
	satchel = /obj/item/storage/backpack/duffelbag/durathread
	ears = /obj/item/radio/headset/headset_institute
	glasses = /obj/item/clothing/glasses/night/f13/enclave
	belt = /obj/item/storage/belt/military/assault/enclave
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/f13/enclave/serviceboots
	box = /obj/item/storage/survivalkit_adv

/datum/outfit/job/institute/noncombat
	id = /obj/item/card/id/dogtag/enclave/noncombatant
	uniform = /obj/item/clothing/under/f13/enclave/science


//Institute Courser

/datum/outfit/job/institute/courser
	title = "Institute Courser"
	flag = F13INSTITUTECOURSER
	access = list(ACCESS_ROBOTICS, ACCESS_INSTITUTE, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_INSTITUTE, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	total_positions = 2
	spawn_positions = 2
	description = "Elite of the elite, you have been sent in for an operation, whatever it might be. Good luck."
	supervisors = "Institute Scientists and the Synth Retention Bureau."
	outfit = /datum/outfit/job/institute/courser
	exp_requirements = 5500

/datum/outfit/job/institute/courser
	name = "Institute Courser"
	jobtype = /datum/outfit/job/institute/courser
	suit = /obj/item/clothing/suit/armored/light/duster/Courserduster

backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 10,
		/obj/item/reagent_containers/hypospray/medipen/superstimpak = 4,
		/obj/item/grenade/frag = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		)


//institute Scientist

/datum/outfit/job/institute/noncombat/sci
	title = "Institute Researcher"
	flag = F13INSTITUTESCIENTIST
	access = list(ACCESS_ROBOTICS, ACCESS_INSTITUTE, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_INSTITUTE, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	total_positions = 2
	spawn_positions = 2
	description = "One synthetic has escaped the Institute and you must aid a courser in it's retrival."
	supervisors = "Synth Retention Bureau."
	exp_requirements = 5500

/datum/outfit/job/institute/noncombat/sci(mob/living/carbon/human/H, visualsOnly = FALSE)
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
