ASL_SLING_RULES_OVERRIDE = [
    ["All","CAN_SLING","All"],
    ["RHS_Mi8AMT_vdv", "CAN_SLING", "Land_Cargo40_grey_F"],
    ["RHS_Mi24V_vvs", "CAN_SLING", "Land_Cargo40_grey_F"]
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

ASL_Rope_Get_Lift_Capability = {
    params ["_vehicle"];
    private ["_slingLoadMaxCargoMass"];
    _slingLoadMaxCargoMass = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "slingLoadMaxCargoMass");
    if(_slingLoadMaxCargoMass <= 0) then {
        _slingLoadMaxCargoMass = 4000;
    };
    if (typeOf _vehicle == "RHS_Mi24V_vvs") then {
        _slingLoadMaxCargoMass = 1;
    };

    if (typeOf _vehicle == "RHS_Mi8AMT_vdv") then {
        _slingLoadMaxCargoMass = 10000;
    };

    _slingLoadMaxCargoMass; 
};

ASL_Attach_Ropes = {
    params ["_cargo","_player"];
    _vehicleWithIndex = _player getVariable ["ASL_Ropes_Vehicle", [objNull,0]];
    _vehicle = _vehicleWithIndex select 0;
    if(!isNull _vehicle) then {
        if(local _vehicle) then {
            private ["_ropes","_attachmentPoints","_objDistance","_ropeLength","_allCargo"];
            _ropes = [_vehicle,(_vehicleWithIndex select 1)] call ASL_Get_Ropes;
            if(count _ropes == 4) then {
                _attachmentPoints = [_cargo] call ASL_Get_Corner_Points;
                _ropeLength = (ropeLength (_ropes select 0));
                _objDistance = (_cargo distance _vehicle) + 2;
                if( _objDistance > _ropeLength ) then {
                    [["The cargo ropes are too short. Move vehicle closer.", false],"ASL_Hint",_player] call ASL_RemoteExec;
                } else {        
                    [_vehicle,_player] call ASL_Drop_Ropes;
                    [_cargo, _attachmentPoints select 0, [0,0,-1]] ropeAttachTo (_ropes select 0);
                    [_cargo, _attachmentPoints select 1, [0,0,-1]] ropeAttachTo (_ropes select 1);
                    [_cargo, _attachmentPoints select 2, [0,0,-1]] ropeAttachTo (_ropes select 2);
                    [_cargo, _attachmentPoints select 3, [0,0,-1]] ropeAttachTo (_ropes select 3);
                    _allCargo = _vehicle getVariable ["ASL_Cargo",[]];
                    _allCargo set [(_vehicleWithIndex select 1),_cargo];
                    _vehicle setVariable ["ASL_Cargo",_allCargo, true];
                    if(_vehicle getVariable ["ASL_HEAVY_LIFTING_ENABLED",true]) then {
                        [_cargo, _vehicle, _ropes] spawn ASL_Rope_Adjust_Mass;      
                    };              
                };
            };
        } else {
            [_this,"ASL_Attach_Ropes",_vehicle,true] call ASL_RemoteExec;
        };
    };
};