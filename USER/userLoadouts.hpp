/*
*   Hier können eigene factions für grad-loadout eingetragen werden.
*   Anleitung im Wiki.
*/

#include "..\node_modules\grad-factions\medicloadoutBase.hpp"

#ifdef NIGHTVISION
  #define NVITEM ""
#else
  #define NVITEM ""
#endif

#ifdef LASERS
  #define LLITEM ""
#else
  #define LLITEM ""
#endif

#ifdef GUNLIGHTS
  #define LLITEM ""
#endif

#ifdef SUPPRESSORS
  #define SUPPRESSORITEM ""
#else
  #define SUPPRESSORITEM ""
#endif

class gm_volksarmee {
	class AllUnits {
		uniform = "rhsgref_uniform_olive";
		vest = "gm_dk_army_vest_54_rifleman";
		backpack = "";
		headgear[] = {"gm_gc_army_headgear_m56","gm_gc_army_headgear_m56_net"};
		primaryWeapon[] = {"rhs_weap_akms"};
        primaryWeaponMagazine = "rhs_30Rnd_762x39mm_bakelite_tracer";
		primaryWeaponOptics = "";
		primaryWeaponPointer = "rhs_acc_2dpZenit";
		primaryWeaponMuzzle = "rhs_acc_pbs1";
        primaryWeaponUnderbarrel = "";
		primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
		handgunWeapon = "";
        handgunWeaponMagazine = "";
		binoculars = "gm_df7x40_blk";
		map = "ItemMap";
		compass = "ItemCompass";
		watch = "";
		gps = "";
		radio = "";
		nvgoggles = NVITEM;
    };

    class Type {
        //Rifleman
        class Soldier_F {
            addItemsToUniform[] = {
                LIST_1("ACE_MapTools"),
                LIST_1("ACE_Flashlight_KSF1"),

                LIST_4("ACE_packingBandage"),
                LIST_4("ACE_elasticBandage"),
                LIST_4("ACE_quikclot"),
                LIST_4("ACE_tourniquet"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_epinephrine"),
                "ACE_entrenchingTool"
            };
            addItemsToVest[] = {
                LIST_2("gm_handgrenade_frag_rgd5"),
                LIST_2("rhs_mag_rdg2_white"),
                LIST_7("rhs_30Rnd_762x39mm_bakelite_tracer"),
                LIST_2("ACE_HandFlare_Green"),
                LIST_2("ACE_HandFlare_Red"),
                LIST_2("ACE_HandFlare_White")
            };
        };

        //Asst. Autorifleman
        class soldier_AAR_F: Soldier_F {
            backpack = "gm_gc_army_backpack_80_lmg_str";
            vest = "gm_gc_army_vest_80_lmg_str";
            addItemsToBackpack[] = {
                LIST_10("gm_75Rnd_762x39mm_B_57N231_ak47_blk")
            };
        };

        //Asst. Gunner (MMG) / Ammo Bearer
        /* class soldier_A_F: Soldier_F {
            backpack = "gm_gc_army_backpack_80_assaultpack_lmg_str";
            addItemsToBackpack[] = {
                LIST_6("gm_100Rnd_762x54mmR_B_T_7t2_pk_grn")
            };
        }; */

        //Asst. Gunner (HMG/GMG)
        /* class support_AMG_F: Soldier_F {
            backpack = "RHS_M2_MiniTripod_Bag";
        }; */

        //Asst. Missile Specialist (AA)
        /* class soldier_AAA_F: Soldier_F {
            backpack = "SMM_Carryall_BW_FT";
            addItemsToBackpack[] = {
                LIST_2("rhs_fim92_mag")
            };
        }; */

        //Asst. Missile Specialist (AT)
        /* class soldier_AAT_F: Soldier_F {
            backpack = "SMM_Carryall_BW_FT";
            addItemsToBackpack[] = {
                LIST_1("rhs_fgm148_magazine_AT")
            };
        }; */

        //Autorifleman
        class soldier_AR_F: Soldier_F {
            primaryWeapon = "gm_mpikm72_prp";
            primaryWeaponMagazine = "gm_75Rnd_762x39mm_B_57N231_ak47_blk";
            handgunWeapon = "";
            handgunWeaponMagazine = "";
            vest = "gm_dk_army_vest_54_machinegunner";
            addItemsToVest[] = {
                LIST_1("gm_handgrenade_frag_rgd5"),
                LIST_2("rhs_mag_rdg2_white"),
                LIST_7("gm_75Rnd_762x39mm_B_57N231_ak47_blk")
            };
        };

        //Combat Life Saver
        class medic_F: Soldier_F {
            addItemsToUniform[] = {
                "ACE_MapTools"
            };
            addItemsToVest[] = {
                LIST_2("rhs_mag_rdg2_white"),
                LIST_6("rhs_30Rnd_762x39mm_bakelite_tracer")
            };

            /*
            TO-DO FOR GRAD-FACTIONS:
            USE COMMON STANDARD FOR MEDIC ITEMS
            */
            class Rank {
                class PRIVATE {
                    vest = "gm_ge_army_vest_80_rifleman";
                    addItemsToUniform[] = {
                        "ACE_surgicalKit"
                    };
                    addItemsToVest[] =  {
                        LIST_10("ACE_elasticBandage"),
                        LIST_10("ACE_packingBandage"),
                        LIST_10("ACE_quikclot"),
                        LIST_8("ACE_tourniquet"),
                        LIST_8("ACE_morphine"),
                        LIST_8("ACE_epinephrine")
                    };
                };
                class CORPORAL {
                    vest = "gm_ge_army_vest_80_medic";
                    backpack = "gm_gc_army_backpack_80_assaultpack_str";
                    addItemsToUniform[] = {
                        "ACE_surgicalKit"
                    };
                    addItemsToBackpack[] = {
                        LIST_4("ACE_salineIV"),
                        LIST_8("ACE_salineIV_500"),
                        LIST_20("ACE_elasticBandage"),
                        LIST_20("ACE_packingBandage"),
                        LIST_20("ACE_quikclot"),
                        LIST_8("ACE_tourniquet"),
                        LIST_25("ACE_morphine"),
                        LIST_25("ACE_epinephrine")
                    };
                };
                class SERGEANT {
                    vest = "gm_ge_army_vest_80_medic";
                    backpack = "gm_gc_army_backpack_80_assaultpack_str";
                    addItemsToUniform[] = {
                        "ACE_surgicalKit",
                        "GRAD_ALK"
                    };
                    addItemsToBackpack[] = {
                        LIST_4("ACE_salineIV"),
                        LIST_8("ACE_salineIV_500"),
                        LIST_20("ACE_elasticBandage"),
                        LIST_20("ACE_packingBandage"),
                        LIST_20("ACE_quikclot"),
                        LIST_8("ACE_tourniquet"),
                        LIST_25("ACE_morphine"),
                        LIST_25("ACE_epinephrine")
                    };
                };
                class LIEUTENANT: SERGEANT {};
                class CAPTAIN: SERGEANT {};
                class MAJOR: SERGEANT {};
                class COLONEL: SERGEANT {};
            };
        };

        //Explosive Specialist
        class soldier_exp_F: Soldier_F {
            backpack = "gm_ge_backpack_satchel_80_blk";
            addItemsToBackpack[] = {
                LIST_4("rhs_ec400_mag")
            };
        };

        //Grenadier
        /* class Soldier_GL_F: Soldier_F {
            primaryWeapon = "rhs_weap_hk416d10_m320";
            addItemsToVest[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell"),
                LIST_2("rhsusf_mag_17Rnd_9x19_JHP"),
                LIST_7("rhs_mag_30Rnd_556x45_Mk318_Stanag"),
                LIST_6("1Rnd_HE_Grenade_shell"),
                LIST_2("1Rnd_SmokeRed_Grenade_shell")
            };
        }; */

        //Heavy Gunner (MMG)
        /* class HeavyGunner_F: Soldier_F {
            primaryWeapon = "gm_hmgpkm_prp";
            primaryWeaponMagazine = "hlc_50Rnd_762x51_T_MG3";
            primaryWeaponMuzzle = "";
            primaryWeaponPointer = "";
            handgunWeapon = "";
            handgunWeaponMagazine = "";
            backpack = "SMM_Kitbag_BW_FT";
            addItemsToBackpack[] = {
                LIST_2("hlc_100Rnd_762x51_B_MG3"),
                LIST_3("hlc_50Rnd_762x51_T_MG3")
            };
            addItemsToVest[] = {
                LIST_2("HandGrenade"),
                LIST_2("SmokeShell")
            };
        }; */

        //Gunner (HMG/GMG)
        /* class support_MG_F: Soldier_F {
            backpack = "RHS_M2_Gun_Bag";
        }; */

        //Marksman
        /* class soldier_M_F: Soldier_F {
            primaryWeapon = "rhs_weap_hk416d145";
            primaryWeaponMagazine = "rhs_mag_30Rnd_556x45_Mk262_Stanag";
            primaryWeaponOptics ="optic_DMS";
            primaryWeaponUnderbarrel ="bipod_01_F_blk";
            binoculars = "ACE_VectorDay";
            addItemsToVest[] = {
                LIST_2("SmokeShell"),
                LIST_2("rhsusf_mag_17Rnd_9x19_JHP"),
                LIST_8("rhs_mag_30Rnd_556x45_Mk262_Stanag"),
                LIST_4("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red")
            };
        }; */

        //Missile Specialist (AA)
        /* class soldier_AA_F: Soldier_F {
            secondaryWeapon = "rhs_weap_fim92";
            secondaryWeaponMagazine = "rhs_fim92_mag";
            backpack = "SMM_Carryall_BW_FT";
            addItemsToBackpack[] = {
                "rhs_fim92_mag"
            };
        }; */

        //Missile Specialist (AT)
        /* class soldier_AT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_fgm148";
            secondaryWeaponMagazine = "rhs_fgm148_magazine_AT";
            backpack = "SMM_Carryall_BW_FT";
            addItemsToBackpack[] = {
                "rhs_fgm148_magazine_AT"
            };
        }; */

        //Repair Specialist
        class soldier_repair_F: Soldier_F {
            backpack = "rhs_assault_umbts_engineer_empty";
            addItemsToBackpack[] = {
                "ToolKit",
                "ACE_wirecutter",
                "ACE_entrenchingTool"
            };
        };

        //Rifleman (AT)
        class soldier_LAT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_rpg26";
        };

        //Squad Leader
        class Soldier_SL_F: Soldier_F {
            primaryWeapon = "rhs_weap_akms_gp25";
            vest = "gm_gc_army_vest_80_leader_str";
            watch = "gm_watch_kosei_80";

            addItemsToVest[] = {
                LIST_2("gm_handgrenade_frag_rgd5"),
                LIST_4("rhs_mag_rdg2_white"),
                LIST_7("rhs_30Rnd_762x39mm_bakelite_tracer"),
                LIST_4("rhs_GRD40_Green"),
                LIST_4("rhs_GRD40_Red"),
                LIST_4("rhs_GRD40_White")
            };

            class Rank {
                // Funker
                class PRIVATE {
                    radio = "TFAR_fadak";
                };
            };
        };

        //Team Leader
        class Soldier_TL_F: Soldier_F {
            primaryWeapon="rhs_weap_akms_gp25";
            addItemsToVest[] = {
                LIST_2("gm_handgrenade_frag_rgd5"),
                LIST_4("rhs_mag_rdg2_white"),
                LIST_7("rhs_30Rnd_762x39mm_bakelite_tracer"),
                LIST_4("rhs_GRD40_Green"),
                LIST_4("rhs_GRD40_Red"),
                LIST_4("rhs_GRD40_White")
            };
        };

        class helipilot_F: Soldier_F {
            headgear = "rhs_zsh7a_mike";
            radio = "TFAR_fadak";
        };
    };

    /* class Rank {
        class LIEUTENANT {
            headgear = "SMM_MilCap_BW_FT";
        };
    }; */
};
