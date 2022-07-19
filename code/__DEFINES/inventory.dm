/*ALL DEFINES RELATED TO INVENTORY OBJECTS, MANAGEMENT, ETC, GO HERE*/

//Inventory depth: limits how many nested storage items you can access directly.
//1: stuff in mob, 2: stuff in backpack, 3: stuff in box in backpack, etc
#define STORAGE_VIEW_DEPTH 2
#define INVENTORY_DEPTH 3
#define FAR_DEPTH 6

//ITEM INVENTORY SLOT BITMASKS
#define ITEM_SLOT_OCLOTHING		(1<<0)
#define ITEM_SLOT_ICLOTHING		(1<<1)
#define ITEM_SLOT_GLOVES		(1<<2)
#define ITEM_SLOT_EYES			(1<<3)
#define ITEM_SLOT_EARS			(1<<4)
#define ITEM_SLOT_MASK			(1<<5)
#define ITEM_SLOT_HEAD			(1<<6)
#define ITEM_SLOT_FEET			(1<<7)
#define ITEM_SLOT_ID			(1<<8)
#define ITEM_SLOT_BELT			(1<<9)
#define ITEM_SLOT_BACK			(1<<10)
#define ITEM_SLOT_POCKET		(1<<11) // this is to allow items with a w_class of WEIGHT_CLASS_NORMAL or WEIGHT_CLASS_BULKY to fit in pockets.
#define ITEM_SLOT_DENYPOCKET	(1<<12) // this is to deny items with a w_class of WEIGHT_CLASS_SMALL or WEIGHT_CLASS_TINY to fit in pockets.
#define ITEM_SLOT_NECK			(1<<13)
#define ITEM_SLOT_HANDS			(1<<14)
#define ITEM_SLOT_BACKPACK		(1<<15)
#define ITEM_SLOT_SUITSTORE		(1<<16)

//A list of the variable names of all slots people can equip things in. This is used to massively reduce code complexity when checking all slots
#define ALL_EQUIP_SLOTS list("w_uniform", "wear_suit", "back", "belt", "gloves", "shoes", "head", "wear_mask", "wear_neck", "ears", \
"glasses", "wear_id", "l_store", "r_store", "s_store")
#define ALL_OUTFIT_SLOTS list("uniform", "suit", "back", "belt", "gloves", "shoes", "head", "mask", "neck", "ears", \
"glasses", "id", "l_pocket", "r_pocket", "suit_store", "r_hand", "l_hand", "internals_slot")

//SLOTS
#define SLOT_BACK			1
#define SLOT_WEAR_MASK		2
#define SLOT_HANDCUFFED		3
#define SLOT_HANDS			4 //wherever you provide a slot for hands you provide SLOT_HANDS
								//SLOT_HANDS as a slot will pick ANY available hand
#define SLOT_BELT			5
#define SLOT_WEAR_ID		6
#define SLOT_EARS			7
#define SLOT_GLASSES		8
#define SLOT_GLOVES			9
#define SLOT_NECK			10
#define SLOT_HEAD			11
#define SLOT_SHOES			12
#define SLOT_WEAR_SUIT		13
#define SLOT_W_UNIFORM		14
#define SLOT_L_STORE		15
#define SLOT_R_STORE		16
#define SLOT_S_STORE		17
#define SLOT_IN_BACKPACK	18
#define SLOT_LEGCUFFED		19
#define SLOT_GENERC_DEXTROUS_STORAGE	20


#define SLOTS_AMT			20 // Keep this up to date!

//I hate that this has to exist
/proc/slotdefine2slotbit(slotdefine) //Keep this up to date with the value of SLOT BITMASKS and SLOTS (the two define sections above)
	. = 0
	switch(slotdefine)
		if(SLOT_BACK)
			. = ITEM_SLOT_BACK
		if(SLOT_WEAR_MASK)
			. = ITEM_SLOT_MASK
		if(SLOT_NECK)
			. = ITEM_SLOT_NECK
		if(SLOT_BELT)
			. = ITEM_SLOT_BELT
		if(SLOT_WEAR_ID)
			. = ITEM_SLOT_ID
		if(SLOT_EARS)
			. = ITEM_SLOT_EARS
		if(SLOT_GLASSES)
			. = ITEM_SLOT_EYES
		if(SLOT_GLOVES)
			. = ITEM_SLOT_GLOVES
		if(SLOT_HEAD)
			. = ITEM_SLOT_HEAD
		if(SLOT_SHOES)
			. = ITEM_SLOT_FEET
		if(SLOT_WEAR_SUIT)
			. = ITEM_SLOT_OCLOTHING
		if(SLOT_W_UNIFORM)
			. = ITEM_SLOT_ICLOTHING
		if(SLOT_L_STORE, SLOT_R_STORE)
			. = ITEM_SLOT_POCKET
		if(SLOT_HANDS)
			. = ITEM_SLOT_HANDS
		if(SLOT_IN_BACKPACK)
			. = ITEM_SLOT_BACKPACK
		if(SLOT_S_STORE)
			. = ITEM_SLOT_SUITSTORE


//Bit flags for the flags_inv variable, which determine when a piece of clothing hides another. IE a helmet hiding glasses.
#define HIDEGLOVES		(1<<0)
#define HIDESUITSTORAGE	(1<<1)
#define HIDEJUMPSUIT	(1<<2)	//these first four are only used in exterior suits
#define HIDESHOES		(1<<3)
#define HIDEMASK		(1<<4)	//these last six are only used in masks and headgear.
#define HIDEEARS		(1<<5)	// (ears means headsets and such)
#define HIDEEYES		(1<<6)	// Whether eyes and glasses are hidden
#define HIDEFACE		(1<<7)	// Whether we appear as unknown.
#define HIDEHAIR		(1<<8)
#define HIDEFACIALHAIR	(1<<9)
#define HIDENECK		(1<<10)
#define HIDETAUR		(1<<11) //gotta hide that snowflake
#define HIDESNOUT		(1<<12) //or do we actually hide our snoots
#define HIDEACCESSORY	(1<<13) //hides the jumpsuit accessory.

//bitflags for clothing coverage - also used for limbs
#define HEAD		(1<<0)
#define CHEST		(1<<1)
#define GROIN		(1<<2)
#define LEG_LEFT	(1<<3)
#define LEG_RIGHT	(1<<4)
#define LEGS		(LEG_LEFT | LEG_RIGHT)
#define FOOT_LEFT	(1<<5)
#define FOOT_RIGHT	(1<<6)
#define FEET		(FOOT_LEFT | FOOT_RIGHT)
#define ARM_LEFT	(1<<7)
#define ARM_RIGHT	(1<<8)
#define ARMS		(ARM_LEFT | ARM_RIGHT)
#define HAND_LEFT	(1<<9)
#define HAND_RIGHT	(1<<10)
#define HANDS		(HAND_LEFT | HAND_RIGHT)
#define NECK		(1<<11)
#define FULL_BODY	(~0)

//flags for alternate styles: These are hard sprited so don't set this if you didn't put the effort in
#define NORMAL_STYLE		0
#define ALT_STYLE			1

//flags for female outfits: How much the game can safely "take off" the uniform without it looking weird
#define NO_FEMALE_UNIFORM			0
#define FEMALE_UNIFORM_FULL			1
#define FEMALE_UNIFORM_TOP			2

//flags for outfits that have mutant race variants: Most of these require additional sprites to work.
#define STYLE_DIGITIGRADE		(1<<0) //jumpsuits, suits and shoes
#define STYLE_MUZZLE			(1<<1) //hats or masks
#define STYLE_SNEK_TAURIC		(1<<2) //taur-friendly suits
#define STYLE_PAW_TAURIC		(1<<3)
#define STYLE_HOOF_TAURIC		(1<<4)
#define STYLE_ALL_TAURIC		(STYLE_SNEK_TAURIC|STYLE_PAW_TAURIC|STYLE_HOOF_TAURIC)
#define STYLE_NO_ANTHRO_ICON	(1<<5) //When digis fit the default sprite fine and need no copypasted states. This is the case of skirts and winter coats, for example.
#define USE_SNEK_CLIP_MASK		(1<<6)
#define USE_QUADRUPED_CLIP_MASK	(1<<7)
#define USE_TAUR_CLIP_MASK		(USE_SNEK_CLIP_MASK|USE_QUADRUPED_CLIP_MASK)

//digitigrade legs settings.
#define NOT_DIGITIGRADE				0
#define FULL_DIGITIGRADE			1
#define SQUISHED_DIGITIGRADE		2

//flags for covering body parts
#define GLASSESCOVERSEYES	(1<<0)
#define MASKCOVERSEYES		(1<<1)		// get rid of some of the other stupidity in these flags
#define HEADCOVERSEYES		(1<<2)		// feel free to realloc these numbers for other purposes
#define MASKCOVERSMOUTH		(1<<3)		// on other items, these are just for mask/head
#define HEADCOVERSMOUTH		(1<<4)

#define TINT_DARKENED 2			//Threshold of tint level to apply weld mask overlay
#define TINT_BLIND 3			//Threshold of tint level to obscure vision fully

// defines for AFK theft
/// How many messages you can remember while logged out before you stop remembering new ones
#define AFK_THEFT_MAX_MESSAGES 10
/// If someone logs back in and there are entries older than this, just tell them they can't remember who it was or when
#define AFK_THEFT_FORGET_DETAILS_TIME 5 MINUTES
/// The index of the entry in 'afk_thefts' with the person's visible name at the time
#define AFK_THEFT_NAME 1
/// The index of the entry in 'afk_thefts' with the text
#define AFK_THEFT_MESSAGE 2
/// The index of the entry in 'afk_thefts' with the time it happened
#define AFK_THEFT_TIME 3

//Allowed equipment lists for security vests and hardsuits.

GLOBAL_LIST_INIT(advanced_hardsuit_allowed, typecacheof(list(
	/obj/item/ammo_box,
	/obj/item/ammo_casing,
	/obj/item/flashlight,
	/obj/item/gun,
	/obj/item/melee/baton,
	/obj/item/reagent_containers/spray/pepper,
	/obj/item/restraints/handcuffs,
	/obj/item/tank/internals)))

GLOBAL_LIST_INIT(security_hardsuit_allowed, typecacheof(list(
	/obj/item/ammo_box,
	/obj/item/ammo_casing,
	/obj/item/flashlight,
	/obj/item/gun/ballistic,
	/obj/item/gun/energy,
	/obj/item/melee/baton,
	/obj/item/reagent_containers/spray/pepper,
	/obj/item/restraints/handcuffs,
	/obj/item/tank/internals)))

GLOBAL_LIST_INIT(f13_coat_allowed, typecacheof(list(
	/obj/item/gun,
	/obj/item/kitchen,
	/obj/item/twohanded,
	/obj/item/twohanded/spear,
	/obj/item/reagent_containers/food/drinks/flask,
	/obj/item/melee,
	/obj/item/flashlight,
	/obj/item/tank/internals,
	/obj/item/storage/fancy/cigarettes,
	/obj/item/throwing_star/spear,
	/obj/item/restraints/legcuffs/bola)))

GLOBAL_LIST_INIT(detective_vest_allowed, typecacheof(list(
	/obj/item/ammo_box,
	/obj/item/ammo_casing,
	/obj/item/detective_scanner,
	/obj/item/flashlight,
	/obj/item/taperecorder,
	/obj/item/gun/ballistic,
	/obj/item/gun/energy,
	/obj/item/lighter,
	/obj/item/melee/baton,
	/obj/item/melee/classic_baton,
	/obj/item/reagent_containers/spray/pepper,
	/obj/item/restraints/handcuffs,
	/obj/item/storage/fancy/cigarettes,
	/obj/item/tank/internals/emergency_oxygen,
	/obj/item/tank/internals/plasmaman)))

GLOBAL_LIST_INIT(security_vest_allowed, typecacheof(list(
	/obj/item/ammo_box,
	/obj/item/ammo_casing,
	/obj/item/flashlight,
	/obj/item/gun/ballistic,
	/obj/item/gun/energy,
	/obj/item/melee/onehanded/knife/hunting,
	/obj/item/melee/baton,
	/obj/item/melee/classic_baton/telescopic,
	/obj/item/reagent_containers/spray/pepper,
	/obj/item/restraints/handcuffs,
	/obj/item/tank/internals/emergency_oxygen,
	/obj/item/tank/internals/plasmaman)))

GLOBAL_LIST_INIT(security_wintercoat_allowed, typecacheof(list(
	/obj/item/ammo_box,
	/obj/item/ammo_casing,
	/obj/item/flashlight,
	/obj/item/storage/fancy/cigarettes,
	/obj/item/gun/ballistic,
	/obj/item/gun/energy,
	/obj/item/lighter,
	/obj/item/melee/baton,
	/obj/item/melee/classic_baton/telescopic,
	/obj/item/reagent_containers/spray/pepper,
	/obj/item/restraints/handcuffs,
	/obj/item/tank/internals/emergency_oxygen,
	/obj/item/tank/internals/plasmaman,
	/obj/item/toy)))

///things every armor can hold in their slot
GLOBAL_LIST_INIT(default_all_armor_slot_allowed, typecacheof(list(
	/obj/item/ammo_box,
	/obj/item/ammo_casing,
	/obj/item/storage/bag,
	/obj/item/storage/box,
	/obj/item/storage/survivalkit_triple_empty,
	/obj/item/storage/belt,
	/obj/item/storage/fancy/cigarettes,
	/obj/item/flashlight,
	/obj/item/gun,
	/obj/item/melee,
	/obj/item/twohanded,
	/obj/item/throwing_star,
	/obj/item/reagent_containers/spray/pepper,
	/obj/item/restraints/handcuffs,
	/obj/item/tank/internals,
	/obj/item/restraints/legcuffs/bola,
	/obj/item/kitchen,
	/obj/item/toy)))

///extra things light armor can hold in their slot by default
GLOBAL_LIST_INIT(light_armor_allowed, typecacheof(list(
	/obj/item/storage/box,
	/obj/item/storage/wallet,
	/obj/item/melee/smith)))

///things light armor can *not* hold in their slot by default
GLOBAL_LIST_INIT(light_armor_disallowed, typecacheof(list(
	/obj/item/gun/ballistic/revolver/grenadelauncher,
	/obj/item/gun/ballistic/rifle/mag,
	/obj/item/melee/smith/twohand)))

///extra things tribal armor can hold in their slot by default
GLOBAL_LIST_INIT(tribal_armor_allowed, typecacheof(list(
	/obj/item/gun/ballistic/bow,
	/obj/item/storage/backpack/spearquiver,
	/obj/item/storage/belt/tribe_quiver,
	/obj/item/melee)))

///extra things raider armor can hold in their slot by default
GLOBAL_LIST_INIT(raider_armor_allowed, typecacheof(list(
	/obj/item/gun/ballistic,
	/obj/item/melee)))

///extra things smith aprons can hold in their slot by default
GLOBAL_LIST_INIT(smith_apron_allowed, typecacheof(list(
	/obj/item/storage/belt/utility,
	/obj/item/crowbar,
	/obj/item/screwdriver,
	/obj/item/weldingtool,
	/obj/item/wirecutters,
	/obj/item/wrench,
	/obj/item/multitool,
	/obj/item/flashlight,
	/obj/item/stack/cable_coil,
	/obj/item/t_scanner,
	/obj/item/analyzer,
	/obj/item/geiger_counter,
	/obj/item/extinguisher/mini,
	/obj/item/radio,
	/obj/item/clothing/gloves,
	/obj/item/holosign_creator,
	/obj/item/assembly/signaler)))

///extra things sexy maid aprons can hold in their slot by default
GLOBAL_LIST_INIT(sexymaid_apron_allowed, typecacheof(list(
	/obj/item/grenade/chem_grenade,
	/obj/item/lightreplacer,
	/obj/item/flashlight,
	/obj/item/reagent_containers/glass/beaker,
	/obj/item/reagent_containers/glass/bottle,
	/obj/item/reagent_containers/spray,
	/obj/item/soap,
	/obj/item/holosign_creator,
	/obj/item/forcefield_projector,
	/obj/item/key/janitor,
	/obj/item/clothing/gloves,
	/obj/item/melee/flyswatter,
	/obj/item/broom,
	/obj/item/paint/paint_remover,
	/obj/item/assembly/mousetrap,
	/obj/item/screwdriver,
	/obj/item/stack/cable_coil,
	/obj/item/storage/belt/janitor)))

///extra things farmer aprons can hold in their slot by default
GLOBAL_LIST_INIT(farmer_apron_allowed, typecacheof(list(
	/obj/item/hatchet, 
	/obj/item/scythe, 
	/obj/item/cultivator, 
	/obj/item/shovel)))

///just a list that allows guns and melee in an armor slot
GLOBAL_LIST_INIT(armor_allow_guns_and_melee, typecacheof(list(
	/obj/item/melee,
	/obj/item/gun)))

///extra things medium armor can hold in their slot by default
///Basically most items, plus a box/belt
GLOBAL_LIST_INIT(medium_armor_allowed, typecacheof(list(
	/obj/item/storage/wallet,
	/obj/item/melee,
	/obj/item/gun,
	/obj/item/kitchen,
	/obj/item/twohanded,
	/obj/item/twohanded/spear,
	/obj/item/reagent_containers/food,
	/obj/item/melee,
	/obj/item/flashlight,
	/obj/item/tank/internals,
	/obj/item/storage/fancy/cigarettes,
	/obj/item/throwing_star/spear,
	/obj/item/restraints/legcuffs/bola)))

/// Things allowed in a toolbelt
GLOBAL_LIST_INIT(toolbelt_allowed, typecacheof(list(
	/obj/item/crowbar,
	/obj/item/screwdriver,
	/obj/item/weldingtool,
	/obj/item/wirecutters,
	/obj/item/wrench,
	/obj/item/multitool,
	/obj/item/inducer,
	/obj/item/flashlight,
	/obj/item/stack/cable_coil,
	/obj/item/stack/sheet,
	/obj/item/stock_parts,
	/obj/item/twohanded/chainsaw,
	/obj/item/melee/smith/hammer,
	/obj/item/t_scanner,
	/obj/item/analyzer,
	/obj/item/geiger_counter,
	/obj/item/extinguisher/mini,
	/obj/item/radio,
	/obj/item/lightreplacer,
	/obj/item/rcd_ammo,
	/obj/item/resonator,
	/obj/item/mining_scanner,
	/obj/item/pickaxe,
	/obj/item/lighter,
	/obj/item/storage/fancy/cigarettes,
	/obj/item/reagent_containers/food/drinks/bottle,
	/obj/item/kitchen/knife,
	/obj/item/gps,
	/obj/item/storage/bag/ore,
	/obj/item/survivalcapsule,
	/obj/item/t_scanner/adv_mining_scanner,
	/obj/item/stack/ore,
	/obj/item/reagent_containers/food/drinks,
	/obj/item/organ/regenerative_core,
	/obj/item/wormhole_jaunter,
	/obj/item/stack/marker_beacon,
	/obj/item/reagent_containers/food/snacks/donut,
	/obj/item/flashlight/seclite,
	/obj/item/grenade/chem_grenade/metalfoam,
	/obj/item/grenade/chem_grenade/smart_metal_foam,
	/obj/item/construction,
	/obj/item/circuitboard,
	/obj/item/clothing/gloves,
	/obj/item/clothing/mask/gas/welding,
	/obj/item/clothing/glasses/welding,
	/obj/item/clothing/head/welding,
	/obj/item/clothing/head/helmet/f13/raider/arclight,
	/obj/item/holosign_creator,
	/obj/item/assembly/signaler)))

/// Things allowed in a jannibelt
GLOBAL_LIST_INIT(janibelt_allowed, typecacheof(list(
	/obj/item/grenade/chem_grenade,
	/obj/item/lightreplacer,
	/obj/item/flashlight,
	/obj/item/reagent_containers/glass/beaker,
	/obj/item/reagent_containers/glass/bottle,
	/obj/item/reagent_containers/spray,
	/obj/item/soap,
	/obj/item/holosign_creator,
	/obj/item/forcefield_projector,
	/obj/item/key/janitor,
	/obj/item/clothing/gloves,
	/obj/item/melee/flyswatter,
	/obj/item/broom,
	/obj/item/paint/paint_remover,
	/obj/item/assembly/mousetrap,
	/obj/item/screwdriver,
	/obj/item/stack/cable_coil
	)))

/// Things allowed in a botanybelt
GLOBAL_LIST_INIT(plantbelt_allowed, typecacheof(list(
	/obj/item/shovel/spade,
	/obj/item/cultivator,
	/obj/item/hatchet,
	/obj/item/reagent_containers/spray,
	/obj/item/book/manual/advice_farming,
	/obj/item/reagent_containers/glass/bottle,
	/obj/item/reagent_containers/glass/bucket,
	/obj/item/reagent_containers/glass/beaker,
	/obj/item/reagent_containers/food/drinks/flask,
	/obj/item/storage/bag/plants, // remove if it gets abused to breaking somehow
	/obj/item/plant_analyzer, // out of place but mechanically useful for the foreseeable future, so included for QoL
	)))

/// Things allowed in a medibelt
GLOBAL_LIST_INIT(medibelt_allowed, typecacheof(list(
	/obj/item/healthanalyzer,
	/obj/item/dnainjector,
	/obj/item/reagent_containers/dropper,
	/obj/item/reagent_containers/glass/beaker,
	/obj/item/reagent_containers/glass/bottle,
	/obj/item/reagent_containers/pill,
	/obj/item/reagent_containers/syringe,
	/obj/item/reagent_containers/medspray,
	/obj/item/reagent_containers/hypospray,
	/obj/item/reagent_containers/chem_pack,
	/obj/item/lighter,
	/obj/item/storage/fancy/cigarettes,
	/obj/item/storage/pill_bottle,
	/obj/item/stack/medical,
	/obj/item/flashlight/pen,
	/obj/item/extinguisher/mini,
	/obj/item/hypospray/mkii,
	/obj/item/sensor_device,
	/obj/item/radio,
	/obj/item/clothing/gloves,
	/obj/item/lazarus_injector,
	/obj/item/clothing/mask/surgical,
	/obj/item/clothing/mask/breath,
	/obj/item/surgical_drapes, //for true paramedics
	/obj/item/bedsheet, //for true hobos
	/obj/item/scalpel,
	/obj/item/circular_saw,
	/obj/item/bonesetter,
	/obj/item/surgicaldrill,
	/obj/item/retractor,
	/obj/item/cautery,
	/obj/item/hemostat,
	/obj/item/geiger_counter,
	/obj/item/clothing/neck/stethoscope,
	/obj/item/stamp,
	/obj/item/razor,
	/obj/item/clothing/glasses,
	/obj/item/wrench/medical,
	/obj/item/clothing/mask/muzzle,
	/obj/item/storage/bag/chemistry,
	/obj/item/storage/bag/bio,
	/obj/item/reagent_containers/blood,
	/obj/item/tank/internals/emergency_oxygen,
	/obj/item/implantcase,
	/obj/item/implant,
	/obj/item/implanter,
	/obj/item/pinpointer/crew,
	/obj/item/weldingtool,
	/obj/item/gun/ballistic/revolver/needler, // the healing is not as rewarding as the hurting
	/obj/item/ammo_box/needle,
	/obj/item/tele_iv,
	/obj/item/stack/sticky_tape, //surgical tape
	/obj/item/handsaw)))

/// Things allowed in a holster (more of a secbelt)
GLOBAL_LIST_INIT(gunbelt_allowed, typecacheof(list(
	/obj/item/storage/fancy/cigarettes,
	/obj/item/gun,
	/obj/item/ammo_box,
	/obj/item/ammo_casing,
	/obj/item/reagent_containers/spray/pepper,
	/obj/item/melee/onehanded/knife/hunting,
	/obj/item/melee/baton,
	/obj/item/melee/classic_baton/telescopic,
	/obj/item/restraints/handcuffs,
	/obj/item/tank/internals,
	/obj/item/restraints/legcuffs/bola,
	/obj/item/toy)))

/// Things allowed in a bandolier
GLOBAL_LIST_INIT(ammobelt_allowed, typecacheof(list(
	/obj/item/storage/fancy/cigarettes,
	/obj/item/ammo_box,
	/obj/item/ammo_casing,
	/obj/item/grenade,
	/obj/item/reagent_containers/spray/pepper,
	/obj/item/restraints/handcuffs,
	/obj/item/tank/internals,
	/obj/item/restraints/legcuffs/bola,
	/obj/item/toy)))

/// Things allowed in a scabbard
GLOBAL_LIST_INIT(knifebelt_allowed, typecacheof(list(
	/obj/item/storage/fancy/cigarettes,
	/obj/item/melee,
	/obj/item/reagent_containers/spray/pepper,
	/obj/item/restraints/handcuffs,
	/obj/item/tank/internals,
	/obj/item/restraints/legcuffs/bola,
	/obj/item/toy)))

/// How many items total fit in a holster
#define STORAGE_HOLSTER_MAX_ITEMS 7
/// How much volume fits in a holster
#define STORAGE_HOLSTER_MAX_VOLUME WEIGHT_CLASS_TINY * STORAGE_HOLSTER_MAX_ITEMS

/// How many items total fit in a belt
#define STORAGE_BELT_MAX_ITEMS 14
/// How much volume fits in a belt
#define STORAGE_BELT_MAX_VOLUME WEIGHT_CLASS_TINY * STORAGE_BELT_MAX_ITEMS

/// How many items total fit in a belt
#define STORAGE_FANNYPACK_MAX_ITEMS 7
/// How much volume fits in a belt
#define STORAGE_FANNYPACK_MAX_VOLUME WEIGHT_CLASS_TINY * STORAGE_FANNYPACK_MAX_ITEMS

/// How many items total fit in a large survival kit
#define STORAGE_TRIPLEKIT_MAX_ITEMS 21
/// How much volume fits in a belt
#define STORAGE_TRIPLEKIT_MAX_VOLUME WEIGHT_CLASS_TINY * STORAGE_FANNYPACK_MAX_ITEMS

//Internals checker
#define GET_INTERNAL_SLOTS(C) list(C.head, C.wear_mask)

//Slots that won't trigger humans' update_genitals() on equip().
GLOBAL_LIST_INIT(no_genitals_update_slots, list(SLOT_L_STORE, SLOT_R_STORE, SLOT_S_STORE, SLOT_IN_BACKPACK, SLOT_LEGCUFFED, SLOT_HANDCUFFED, SLOT_HANDS, SLOT_GENERC_DEXTROUS_STORAGE))
