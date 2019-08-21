ASL_SLING_RULES_OVERRIDE = [
    ["Air", "CAN_SLING", "Land_Cargo20_EMP_F"]
];

missionNameSpace setVariable ["ASL_HEAVY_LIFTING_ENABLED", true];
missionNameSpace setVariable ["ASL_HEAVY_LIFTING_MIN_LIFT_OVERRIDE", 0];

ASL_SLING_LOAD_POINT_CLASS_HEIGHT_OFFSET = [  
    ["All", [-0.05, -0.05, -0.05]],  
    ["CUP_CH47F_base", [-0.05, -2, -0.05]],  
    ["CUP_AW159_Unarmed_Base", [-0.05, -0.06, -0.05]],
    ["RHS_CH_47F", [-0.75, -2.6, -0.75]], 
    ["rhsusf_CH53E_USMC", [-0.8, -1, -1.1]], 
    ["rhsusf_CH53E_USMC_D", [-0.8, -1, -1.1]],
    ["land_gm_computer_teleraet_81_m", [0, 0, 0]],
    ["Land_Caravan_01_green_F", [0,0,0]]
];