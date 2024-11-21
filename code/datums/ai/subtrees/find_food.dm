/// similar to finding a target but looks for food types in the // the what?
/datum/ai_planning_subtree/find_food
	var/vision_range = 9

/datum/ai_planning_subtree/find_food/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	. = ..()
	var/atom/target = controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	if(!QDELETED(target))
		// Busy with something
		return

	controller.queue_behavior(/datum/ai_behavior/find_and_set/in_list, BB_BASIC_MOB_CURRENT_TARGET, controller.blackboard[BB_BASIC_FOODS], vision_range)


/datum/ai_planning_subtree/find_dead_bodies

/datum/ai_planning_subtree/find_dead_bodies/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	. = ..()
	if(istype(controller.pawn, /mob/living/simple_animal))
		var/mob/living/simple_animal/hostile/retaliate/rogue/mob = controller.pawn
		if(mob.food == mob.food_max && !mob.eat_forever)
			return // not hungry

	var/atom/target = controller.blackboard[BB_BASIC_MOB_FOOD_TARGET]
	if(!QDELETED(target))
		// Busy with something
		return

	controller.queue_behavior(/datum/ai_behavior/find_and_set/dead_bodies, BB_BASIC_MOB_FOOD_TARGET, controller.blackboard[BB_BASIC_FOODS])


/datum/ai_planning_subtree/find_food/rat
	vision_range = 2


/datum/ai_planning_subtree/find_food/spider
	vision_range = 5