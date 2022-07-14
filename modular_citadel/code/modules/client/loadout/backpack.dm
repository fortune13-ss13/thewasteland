/datum/gear/backpack
	category = LOADOUT_CATEGORY_BACKPACK
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_GENERAL
	slot = SLOT_IN_BACKPACK

/datum/gear/backpack/crayons
	name = "Box of Crayons"
	path = /obj/item/storage/crayons
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_TOYS
	cost = 2

/datum/gear/backpack/toykatana
	name = "Toy Katana"
	path = /obj/item/toy/katana
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_TOYS
	cost = 3

/datum/gear/backpack/fountainpen
	name = "Fountain Pen"
	path = /obj/item/pen/fountain
	cost = 3

/datum/gear/backpack/multipen
	name = "Multicolored Pen"
	path = /obj/item/pen/fourcolor

/datum/gear/backpack/necklace//this is here because loadout doesn't support proper accessories
	name = "Renameable Necklace"
	path = /obj/item/clothing/accessory/necklace

/datum/gear/backpack/fannypack
	name = "fannypack"
	path = /obj/item/storage/belt/fannypack
	cost = 3

/datum/gear/backpack/tape
	name = "Spare Cassette Tape"
	path = /obj/item/tape/random

/datum/gear/backpack/tapeplayer
	name = "Taperecorder"
	path = /obj/item/taperecorder
	cost = 2

/datum/gear/backpack/razor
	name = "electric razor"
	path = /obj/item/razor
	cost = 2

/datum/gear/backpack/donuts
	name = "donut box"
	path = /obj/item/storage/fancy/donut_box
	cost = 2

/// Belts

/datum/gear/backpack/redbelt
	name = "primitive belt"
	path = /obj/item/storage/belt/mining/primitive
	cost = 4

/// Cigarettes here, they dont need a special catagory.

/datum/gear/backpack/cigarettes/cigpack_improper
	name = "cigarette pack"
	path = /obj/item/storage/fancy/cigarettes

/datum/gear/backpack/cigarettes/cigpack_bigboss
	name = "Big Boss Smokes"
	path = /obj/item/storage/fancy/cigarettes/cigpack_bigboss

/datum/gear/backpack/cigarettes/cigpack_pyramid
	name = "Pyramid Smokes"
	path = /obj/item/storage/fancy/cigarettes/cigpack_pyramid

/datum/gear/backpack/cigarettes/cigpack_greytort
	name = "Grey Tortoise Smokes"
	path = /obj/item/storage/fancy/cigarettes/cigpack_greytort

/datum/gear/backpack/cigarettes/cigars
	name = "Premium cigar case"
	path = /obj/item/storage/fancy/cigarettes/cigars
	cost = 2

/datum/gear/backpack/cigarettes/cigars/cohiba
	name = "Cohiba Robusto cigar case"
	path = /obj/item/storage/fancy/cigarettes/cigars/cohiba
	cost = 2

/datum/gear/backpack/cigarettes/cigars/havana
	name = "Havanian cigar case"
	path = /obj/item/storage/fancy/cigarettes/cigars/havana
	cost = 2

/// Modkits 

/datum/gear/backpack/weatheredrangerhelm
	name = "weathered ranger helmet modkit"
	path = /obj/item/modkit/digger_helm
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS

/datum/gear/backpack/weatheredrangerarmor
	name = "weathered ranger armor modkit"
	path = /obj/item/modkit/digger_vest
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS

/datum/gear/backpack/marlowsuit_ike
	name = "Gunfighters Overcoat modkit"
	path = /obj/item/modkit/marlowsuit_ike
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS

/datum/gear/backpack/marlowsuit_mason
	name = "Vagabond Vest modkit"
	path = /obj/item/modkit/marlowsuit_mason
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS

/datum/gear/backpack/marlowsuit
	name = "Marlow Overcoat modkit"
	path = /obj/item/modkit/marlowsuit
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS

/datum/gear/backpack/marlowhat
	name = "Marlow Hat modkit"
	path = /obj/item/modkit/marlowhat
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS

/datum/gear/backpack/schlimmhat
	name = "Foreign Florentine Hat modkit"
	path = /obj/item/modkit/schlimmhat
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS

/datum/gear/backpack/schlimmcoat
	name = "Foreign Frock Coat modkit"
	path = /obj/item/modkit/schlimmcoat
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS

/datum/gear/backpack/ahp_suit
	name = "Highway Patrol Jacket modkit"
	path = /obj/item/modkit/ahp_suit
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS

/datum/gear/backpack/ahp_helmet
	name = "Highway Patrol Helmet modkit"
	path = /obj/item/modkit/ahp_helmet
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS

/datum/gear/backpack/westernwayfarerlight
	name = "Western wayfarer light modkit"
	path = /obj/item/modkit/westernwayfarerlight
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS
	restricted_desc = "Tribal"
	restricted_roles = list("Tribal")

/datum/gear/backpack/westernwayfarerheavy
	name = "Western wayfarer heavy modkit"
	path = /obj/item/modkit/westernwayfarerheavy
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS
	restricted_desc = "Tribal"
	restricted_roles = list("Tribal")

/datum/gear/backpack/khanbatkit
	name = "khanbat armor modkit"
	path = /obj/item/modkit/khanbat
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS
	restricted_desc = "KHAN"
	restricted_roles = list("Great Khan")

/datum/gear/backpack/khanbatreinforcedkit
	name = "khanbat reinforced armor modkit"
	path = /obj/item/modkit/khanbatreinforced
	cost = 2
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_MODKITS
	restricted_desc = "KHAN"
	restricted_roles = list("Great Khan")


/// Backpacks

/datum/gear/backpack/bbackpack
	name = "hiking backpack"
	path = /obj/item/storage/backpack/old
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_BACKPACKS
	cost = 3

/datum/gear/backpack/bbackpack/duffel
	name = "duffelbag"
	path = /obj/item/storage/backpack/duffelbag

/datum/gear/backpack/bbackpack/explorer
	name = "explorer backpack"
	path = /obj/item/storage/backpack/explorer

/datum/gear/backpack/bbackpack/explorer/satchel
	name = "explorer satchel"
	path = /obj/item/storage/backpack/satchel/explorer

/datum/gear/backpack/bbackpack/trekker
	name = "trekker backpack"
	path = /obj/item/storage/backpack/trekker

/datum/gear/backpack/bbackpack/trekker/satchel
	name = "trekker satchel"
	path = /obj/item/storage/backpack/satchel/trekker

/datum/gear/backpack/bbackpack/sec
	name = "security backpack"
	path = /obj/item/storage/backpack/security
	cost = 4

/datum/gear/backpack/bbackpack/sec/satchel
	name = "security satchel"
	path = /obj/item/storage/backpack/satchel/sec

/datum/gear/backpack/bbackpack/trophy
	name = "trophy rack"
	path = /obj/item/storage/backpack/cultpack
	cost = 3


/datum/gear/backpack/bbackpack/legionr
	name = "legion red cape backpack"
	path = /obj/item/storage/backpack/legionr
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_BACKPACKS
	cost = 2
	restricted_desc = "Legion Veteran+"
	restricted_roles = list("Legion Orator",
							"Legion Centurion",
							"Legion Veteran Decanus",
							"Legion Prime Decanus",
							"Legion Recruit Decanus",
							"Legion Vexillarius",
							"Veteran Legionnaire"
						)

/datum/gear/backpack/bbackpack/legionb
	name = "legion black cape backpack"
	path = /obj/item/storage/backpack/legionb
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_BACKPACKS
	cost = 2
	restricted_desc = "Legion Veteran+"
	restricted_roles = list("Legion Orator",
							"Legion Centurion",
							"Legion Veteran Decanus",
							"Legion Prime Decanus",
							"Legion Recruit Decanus",
							"Legion Vexillarius",
							"Veteran Legionnaire"
						)
