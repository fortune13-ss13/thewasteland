/datum/surgery/advanced/bioware
	name = "enhancement surgery"
	var/bioware_target = BIOWARE_GENERIC
	requires_trait = "ABDUCTOR"

/datum/surgery/advanced/bioware/can_start(mob/user, mob/living/carbon/human/target, obj/item/tool)
	if(!..())
		return FALSE
	if(!istype(target))
		return FALSE
	for(var/X in target.bioware)
		var/datum/bioware/B = X
		if(B.mod_type == bioware_target)
			return FALSE
	return TRUE
