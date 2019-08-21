ASL_SLING_RULES_OVERRIDE = [
    ["All","CAN_SLING","All"],
    ["RHS_Mi8AMT_vdv", "CAN_SLING", "Land_Cargo40_grey_F"],
    ["RHS_Mi24V_vvs", "CANT_SLING", "Land_Cargo40_grey_F"]
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
    ["RHS_Mi8AMT_vdv", [0,-2,0]],
    ["Land_Cargo40_grey_F", [0,0,0]]
];