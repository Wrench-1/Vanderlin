/datum/job/courtagent
	title = JOB_COURT_AGENT
	tutorial = "Whether acquired by merit, shrewd negotiation or fulfilled bounties, \
	you have found yourself under the underhanded employ of the Hand. \
	Fulfill desires and whims of the court that they would rather not be publicly known. \
	Your position is anything but secure, and any mistake can leave you disowned and charged like the petty criminal you are. \
	Garrison and Court members know who you are."
	department_flag = NOBLEMEN
	job_flags = (JOB_EQUIP_RANK | JOB_SHOW_IN_CREDITS | JOB_NEW_PLAYER_JOINABLE)
	faction = FACTION_TOWN
	total_positions = 3
	spawn_positions = 3
	bypass_lastclass = TRUE

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_IMMORTAL)
	allowed_races = RACES_PLAYER_ALL

	outfit = /datum/outfit/courtagent
	//advclass_cat_rolls = list(CTAG_COURTAGENT = 20)
	give_bank_account = 30
	cmode_music = 'sound/music/cmode/nobility/CombatSpymaster.ogg'
	job_bitflag = BITFLAG_GARRISON // counts for antag shit

	exp_type = list(EXP_TYPE_LIVING)
	exp_types_granted = list(EXP_TYPE_NOBLE, EXP_TYPE_COMBAT) //noble EXP as new Court Agents may want to transition to playing Hand with enough hours played
	exp_requirements = list(
		EXP_TYPE_LIVING = 300,
	)

	traits = list(
		TRAIT_DODGEEXPERT,
		TRAIT_STEELHEARTED,
		TRAIT_FOREIGNER
	)
	verbs = list(
		/mob/living/carbon/human/proc/torture_victim
	)

/datum/job/courtagent/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	if(ishuman(spawned))
		GLOB.roundstart_court_agents += spawned.real_name
	. = ..()

/datum/outfit/courtagent
	name = "Court Agent Base"
	cloak = /obj/item/clothing/cloak/raincloak
	armor = /obj/item/clothing/armor/leather/splint
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	belt = /obj/item/storage/belt/leather/black
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots
	backr = /obj/item/storage/backpack/satchel/black
