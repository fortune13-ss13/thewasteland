//Reagents produced by metabolising/reacting fermichems inoptimally, i.e. inverse_chems or impure_chems
//Inverse = Splitting
//Invert = Whole conversion

/datum/reagent/impure
	chemical_flags = REAGENT_INVISIBLE | REAGENT_SNEAKYNAME //by default, it will stay hidden on splitting, but take the name of the source on inverting
	ghoulfriendly = TRUE


/datum/reagent/impure/fermiTox
	name = "Chemical Isomers"
	description = "Toxic chemical isomers made from impure reactions. At low volumes will cause light toxin damage, but as the volume increases, it deals larger amounts, damages the liver, then eventually the heart. This is default impure chem for all chems, and changes only if stated."
	data = "merge"
	color = "FFFFFF"
	can_synth = FALSE
	var/potency = 1 //potency multiplies the volume when added.


//I'm concerned this is too weak, but I also don't want deathmixes.
//TODO: liver damage, 100+ heart
/datum/reagent/impure/fermiTox/on_mob_life(mob/living/carbon/C, method)
	C.adjustToxLoss(2)
	..()

/datum/reagent/impure/impurestimpak
	name = "Impure Stimpak Fluid"
	description = "Stimpak production is a hard process, and improperly prepared stimpak fluid is toxic."
	can_synth = FALSE
	color = "FFFFFF"

/datum/reagent/impure/impurestimpak/on_mob_life(mob/living/carbon/C)
	C.adjustToxLoss(2)
	..()

/datum/reagent/impure/failedstimpak
	name = "something that's probably not stimpak fluid"
	description = "How? How did you do this?"
	can_synth = FALSE
	color = "#302000"
	taste_description = "horrible, horrible burning"
	taste_mult = 52
	metabolization_rate = 0.6

/datum/reagent/impure/failedstimpak/on_mob_life(mob/living/carbon/C)
	C.blood_volume -= 10
	C.adjustCloneLoss(2, 0)
	..()
