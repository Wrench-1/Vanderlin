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
	advclass_cat_rolls = list(CTAG_COURTAGENT = 20)
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
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	belt = /obj/item/storage/belt/leather/black
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots

/datum/job/advclass/courtagent
	exp_types_granted = list(EXP_TYPE_NOBLE, EXP_TYPE_COMBAT)

/datum/attribute_holder/sheet/job/courtagent/bruiser
	raw_attribute_list = list(
		STAT_STRENGTH = 2,
		STAT_ENDURANCE = 1,
		STAT_SPEED = 3,
		/datum/attribute/skill/combat/unarmed = 30,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/knives = 20,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/sneaking = 40,
		/datum/attribute/skill/misc/climbing = 50,
		/datum/attribute/skill/misc/lockpicking = 50,
		/datum/attribute/skill/craft/crafting = 10,
		/datum/attribute/skill/misc/reading = 10
	)

/datum/job/advclass/courtagent/bruiser
	title = "Bruiser"
	tutorial = "You are one of the Hand's loyal Agents. \
	From a very early age growing up on the streets, you learned the best ways to cause harm to people using nothing but your fists and your wits. \
	Eventually, you became employed by the Hand as personal muscle. When the Hand gives the order, you go and break some legs."
	outfit = /datum/outfit/courtagent/bruiser
	category_tags = list(CTAG_COURTAGENT)

	attribute_sheet = /datum/attribute_holder/sheet/job/courtagent/bruiser

/datum/outfit/courtagent/bruiser
	name = "Bruiser"
	cloak = /obj/item/clothing/cloak/raincloak
	armor = /obj/item/clothing/armor/leather/splint
	gloves = /obj/item/clothing/gloves/bandages/pugilist
	beltl = /obj/item/weapon/knuckles
	backr = /obj/item/storage/backpack/satchel/black
	backpack_contents = list(
		/obj/item/key/manor = 1,
		/obj/item/weapon/knife/dagger/steel = 1,
		/obj/item/lockpickring/mundane = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1
	)

/datum/attribute_holder/sheet/job/courtagent/hitman
	raw_attribute_list = list(
		STAT_STRENGTH = -1,
		STAT_ENDURANCE = 1,
		STAT_PERCEPTION = 2,
		STAT_SPEED = 3,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/wrestling = 30,
		/datum/attribute/skill/combat/knives = 30,
		/datum/attribute/skill/combat/bows = 30,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/sneaking = 50,
		/datum/attribute/skill/misc/climbing = 50,
		/datum/attribute/skill/misc/lockpicking = 50,
		/datum/attribute/skill/craft/crafting = 10,
		/datum/attribute/skill/misc/reading = 10
	)

/datum/job/advclass/courtagent/hitman
	title = "Hitman"
	tutorial = "You are one of the Hand's loyal Agents. \
	Before finding yourself employed at the Court, you were an Assassin for hire. You took gold and killed without question. \
	Now for steady pay, you aid the Hand and the Court in matters that the public had best not know about. \
	Your targets are picked out, and you execute without question, as you always have done."
	outfit = /datum/outfit/courtagent/hitman
	category_tags = list(CTAG_COURTAGENT)

	attribute_sheet = /datum/attribute_holder/sheet/job/courtagent/hitman

/datum/outfit/courtagent/hitman
	name = "Hitman"
	cloak = /obj/item/clothing/cloak/raincloak
	armor = /obj/item/clothing/armor/leather/splint
	gloves = /obj/item/clothing/gloves/fingerless
	wrists = /obj/item/clothing/wrists/bracers/leather
	beltl = /obj/item/ammo_holder/quiver/arrows
	backl = /obj/item/gun/ballistic/bow
	backr = /obj/item/storage/backpack/satchel/black
	backpack_contents = list(
		/obj/item/key/manor = 1,
		/obj/item/weapon/knife/dagger/steel = 1,
		/obj/item/lockpickring/mundane = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1
	)

/datum/attribute_holder/sheet/job/courtagent/investigator
	raw_attribute_list = list(
		STAT_PERCEPTION = 4,
		STAT_INTELLIGENCE = 2,
		STAT_SPEED = 3,
		/datum/attribute/skill/combat/unarmed = 20,
		/datum/attribute/skill/combat/wrestling = 20,
		/datum/attribute/skill/combat/knives = 30,
		/datum/attribute/skill/combat/swords = 30,
		/datum/attribute/skill/misc/athletics = 30,
		/datum/attribute/skill/misc/swimming = 20,
		/datum/attribute/skill/misc/sneaking = 40,
		/datum/attribute/skill/misc/climbing = 50,
		/datum/attribute/skill/misc/lockpicking = 50,
		/datum/attribute/skill/craft/crafting = 20,
		/datum/attribute/skill/misc/reading = 30
	)

/datum/job/advclass/courtagent/investigator
	title = "Investigator"
	tutorial = "You are one of the Hand's loyal Agents. \
	You always were able to pick out little details in the environment and in people that others tended to miss out on. \
	You heard conversations you shouldn’t have, and even managed to track down missing people by piecing together clues. \
	Now you work for the Hand and the Court, and as luck would have it the Mages Guild has supplied you with gadgets to help in your investigations."
	outfit = /datum/outfit/courtagent/investigator
	category_tags = list(CTAG_COURTAGENT)

	attribute_sheet = /datum/attribute_holder/sheet/job/courtagent/investigator

/datum/outfit/courtagent/investigator
	name = "Investigator"
	head = /obj/item/clothing/head/helmet/leather/tricorn
	gloves = /obj/item/clothing/gloves/fingerless
	armor = /obj/item/clothing/armor/leather/jacket/leathercoat/black
	wrists = /obj/item/clothing/wrists/bracers/leather
	beltl = /obj/item/weapon/sword/sabre
	backr = /obj/item/storage/backpack/satchel/black
	backpack_contents = list(
		/obj/item/key/manor = 1,
		/obj/item/weapon/knife/dagger/steel = 1,
		/obj/item/lockpickring/mundane = 1,
		/obj/item/storage/belt/pouch/coins/poor = 1
	)
