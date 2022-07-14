//This is the file that handles donator loadout items.

/datum/gear/donator
	name = "IF YOU SEE THIS, PING A CODER RIGHT NOW!"
	slot = SLOT_IN_BACKPACK
	path = /obj/item/storage/belt/holster/ranger45
	category = LOADOUT_CATEGORY_DONATOR
	ckeywhitelist = list("This entry should never appear with this variable set.") //If it does, then that means somebody fucked up the whitelist system pretty hard
	cost = 0

/datum/gear/donator/donortestingbikehorn
	name = "Donor item testing"
	slot = SLOT_IN_BACKPACK
	path = /obj/item/storage/belt/holster/ranger45
	geargroupID = list("DONORTEST") //This is a list mainly for the sake of testing, but geargroupID works just fine with ordinary strings

/datum/gear/donator/monke1818
	name = "CIA Badge"
	slot = SLOT_IN_BACKPACK
	path = /obj/item/clothing/accessory/cia_badge
	ckeywhitelist = list("monke1818")

/////////////////////
///Loadout Boxes///// See kits.dm, use this model for loadouts that have more than one item per character.
/////////////////////
/datum/gear/donator/kits
	slot = SLOT_IN_BACKPACK

/*example
/datum/gear/donator/kits/averyamadeus
	name = "Avery Amadeus' belongings"
	path = /obj/item/storage/box/large/custom_kit/averyamadeus
	ckeywhitelist = list("topbirb")
*/

/obj/item/storage/box/large/custom_kit/burnings/PopulateContents()
    new /obj/item/warpaint_bowl(src)
    new /obj/item/clothing/suit/armor/f13/punk(src)
    new /obj/item/clothing/mask/bandana/blue(src)

/datum/gear/donator/kits/burnings
    name = "Burnings stuff"
    path = /obj/item/storage/box/large/custom_kit/burnings
    ckeywhitelist = list("myguy49")

/obj/item/storage/box/large/custom_kit/starscream/PopulateContents()
    new /obj/item/clothing/suit/armor/f13/enclavetrenchcoat(src)
    new /obj/item/clothing/head/beret/enclave/intel(src)

/datum/gear/donator/kits/starscream
    name = "Star stuff"
    path = /obj/item/storage/box/large/custom_kit/starscream
    ckeywhitelist = list("starscream1234")

/obj/item/storage/box/large/custom_kit/cayce/PopulateContents()
    new /obj/item/storage/backpack/security(src)
    new /obj/item/stack/f13Cash/caps/threefivezero(src)
    new /obj/item/storage/belt/military(src)
    new /obj/item/pda(src)

/datum/gear/donator/kits/cayce
    name = "Nearly Feral Fred's Junk"
    path = /obj/item/storage/box/large/custom_kit/cayce
    ckeywhitelist = list("cayce")

/obj/item/storage/box/large/custom_kit/sugga/PopulateContents()
	new /obj/item/clothing/suit/armor/f13/combat(src)
	new /obj/item/clothing/head/helmet/f13/combat(src)

/datum/gear/donator/kits/sugga
	name = "Suggas box"
	path = /obj/item/storage/box/large/custom_kit/sugga
	ckeywhitelist = list("sugga")

/obj/item/storage/box/large/custom_kit/klatue/PopulateContents()
	new /obj/item/storage/belt/holster(src)
	new /obj/item/clothing/suit/armor/hos/trenchcoat(src)
	new /obj/item/clothing/head/helmet/riot(src)

/datum/gear/donator/kits/klatue
	name = "Klatue box"
	path = /obj/item/storage/box/large/custom_kit/klatue
	ckeywhitelist = list("klatue9")

/obj/item/storage/box/large/custom_kit/canadian/PopulateContents()
	new /obj/item/clothing/suit/armor/f13/legion/vet/explorercanada(src)
	new /obj/item/clothing/neck/mantle/umbo(src)
	new /obj/item/toy/figure/dsquad(src)

/datum/gear/donator/kits/canadian
	name = "Canadian"
	path = /obj/item/storage/box/large/custom_kit/canadian
	ckeywhitelist = list("comradesocks")

/obj/item/storage/box/large/custom_kit/pineapple/PopulateContents()
	new /obj/item/modkit/environmentalarmor(src)
	new /obj/item/modkit/environmentalhelm(src)

/datum/gear/donator/kits/pineapple
	name = "Silvers goods"
	path = /obj/item/storage/box/large/custom_kit/pineapple
	ckeywhitelist = list("silveredsoul")

/obj/item/storage/box/large/custom_kit/evosolus/PopulateContents()
	new /obj/item/clothing/suit/armor/f13/harbingermantle(src)
	new /obj/item/clothing/head/beret/ncr/ncr_recon(src)
	new /obj/item/clothing/mask/gas/sechailer(src)

/datum/gear/donator/kits/evosolus
	name = "Evos goods"
	path = /obj/item/storage/box/large/custom_kit/evosolus
	ckeywhitelist = list("evosolus")

/obj/item/storage/box/large/custom_kit/evosolus2/PopulateContents()
	new /obj/item/storage/backpack/backsheath(src)
	new /obj/item/clothing/head/beret/ncr/ncr_recon(src)
	new /obj/item/clothing/mask/gas/explorer(src)
	new /obj/item/clothing/shoes/roman(src)
	new /obj/item/clothing/suit/hooded/cloak/goliath/tatteredred(src)
	new /obj/item/storage/belt/sabre/heavy(src)
	new /obj/item/clothing/under/dress/wedding(src)

/datum/gear/donator/kits/evosolus2
	name = "Evos goods2"
	path = /obj/item/storage/box/large/custom_kit/evosolus2
	ckeywhitelist = list("evosolus")

/obj/item/storage/box/large/custom_kit/snugglytrap/PopulateContents()
	new /obj/item/clothing/neck/mantle/snugglycape(src)
	new /obj/item/mmi/posibrain(src)

/datum/gear/donator/kits/snugglytrap
	name = "Good boy kit"
	path = /obj/item/storage/box/large/custom_kit/snugglytrap
	ckeywhitelist = list("snugglytrap")

/obj/item/storage/box/large/custom_kit/erabite/PopulateContents()
	new /obj/item/modkit/rangerpatrolhat(src)
	new /obj/item/modkit/degancustomarmor(src)
	new /obj/item/storage/belt/holster(src)

/datum/gear/donator/kits/erabite
	name = "Era stuff"
	path = /obj/item/storage/box/large/custom_kit/erabite
	ckeywhitelist = list("erabite")

/obj/item/storage/box/large/custom_kit/sunny/PopulateContents()
	new /obj/item/clothing/mask/gas/sechailer(src)
	new /obj/item/clothing/shoes/kindleKicks(src)
	new /obj/item/storage/belt/military/assault(src)
	new /obj/item/modkit/khanbat(src)
	new /obj/item/bong/coconut(src)
	new /obj/item/clothing/under/f13/chinasuitcosmetic(src)

/datum/gear/donator/kits/sunny
	name = "Sunnys stuff"
	path = /obj/item/storage/box/large/custom_kit/sunny
	ckeywhitelist = list("nirzak")

/obj/item/storage/box/large/custom_kit/flaka/PopulateContents()
	new /obj/item/clothing/head/f13/enclave/hood(src)
	new /obj/item/modkit/enclavencotrenchcoat(src)

/datum/gear/donator/kits/flaka
	name = "Flaka stuff Enclave"
	path = /obj/item/storage/box/large/custom_kit/flaka
	ckeywhitelist = list("flaka")

/obj/item/storage/box/large/custom_kit/flaka2/PopulateContents()
	new /obj/item/modkit/flakabomber(src)
	new /obj/item/clothing/head/helmet/f13/combat/ncr_patrol/rangertrauma(src)

/datum/gear/donator/kits/flaka2
	name = "Flaka stuff NCR"
	path = /obj/item/storage/box/large/custom_kit/flaka2
	ckeywhitelist = list("flaka")

/obj/item/storage/box/large/custom_kit/darkrixd/PopulateContents()
	new /obj/item/modkit/khanbatreinforced(src)

/datum/gear/donator/kits/darkrixd
	name = "Darkrixd's stuff"
	path = /obj/item/storage/box/large/custom_kit/darkrixd
	ckeywhitelist = list("darkrixd")

/obj/item/storage/box/large/custom_kit/malinois/PopulateContents()
	new /obj/item/clothing/mask/gas/sechailer/swat(src)
	new /obj/item/storage/belt/military(src)
	new /obj/item/storage/belt/holster(src)
	new /obj/item/clothing/shoes/workboots/mining(src)
	new /obj/item/clothing/under/pants/jeanripped(src)
	new /obj/item/clothing/gloves/fingerless(src)
	new /obj/item/clothing/head/helmet/f13/ncr/rangercombat/desert/whiskey(src)
	new /obj/item/clothing/suit/armor/f13/rangercombat/desert/whiskey(src)

/datum/gear/donator/kits/malinois
	name = "malinois's stuff"
	path = /obj/item/storage/box/large/custom_kit/malinois
	ckeywhitelist = list("malinois.rage")

/// Pug stuff below

/obj/item/storage/box/large/custom_kit/pug/PopulateContents()
	new /obj/item/melee/transforming/cleaving_saw/old_rusty(src)

/obj/item/storage/box/large/custom_kit/pug2/PopulateContents()
	new /obj/item/melee/onehanded/dragonfire(src)

/obj/item/storage/box/large/custom_kit/mutie/PopulateContents()
	new /obj/item/clothing/shoes/f13/mutie/boots(src)
	new /obj/item/clothing/gloves/f13/mutant/mk2(src)
	new /obj/item/clothing/under/f13/vaultmutie(src)
	new /obj/item/clothing/suit/armor/f13/mutant/poncho(src)

/datum/gear/donator/kits/pug
	name = "I die to mobs"
	path = /obj/item/storage/box/large/custom_kit/pug
	ckeywhitelist = list("puglord777")

/datum/gear/donator/kits/pug2
	name = "I die to mobsx2"
	path = /obj/item/storage/box/large/custom_kit/pug2
	ckeywhitelist = list("puglord777")

/datum/gear/donator/kits/mutie
	name = "Muties"
	path = /obj/item/storage/box/large/custom_kit/mutie
	ckeywhitelist = list("puglord777")

/obj/item/storage/box/large/custom_kit/octus/PopulateContents()
	new /obj/item/clothing/neck/mantle/chieftess

/datum/gear/donator/kits/octus
	name = "Tribal stuff"
	path = /obj/item/storage/box/large/custom_kit/octus
	ckeywhitelist = list("octus")
