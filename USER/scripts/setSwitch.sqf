
/*

animation sources

Power_1
Power_2
"SwitchLight"
SwitchPosition
*/

params ["_vehicle"];

if (isServer) then {
    _vehicle animate ["Power_1", 1];  
    _vehicle animate ["Power_2", 1];  
    _vehicle animate ["SwitchLight", 0.1];  
    _vehicle animate ["SwitchPosition", -1]; 
    _vehicle setVariable ['GRAD_hasPower', true, true];
};

_vehicle addAction [
    "<t color='#333399'>Rechner ausschalten</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["GRAD_hasPower", false, true];

        _target animate ["Power_1", 0];
        _target animate ["Power_2", 0];
        _target animate ["SwitchLight", 0];
        _target animate ["SwitchPosition", 1];

        // systemChat "off";


        {
           if (typeOf _x == "land_gm_computer_teleraet_81_r" ||
            typeOf _x == "land_gm_computer_teleraet_81_m" ||
            typeOf _x == "land_gm_computer_teleraet_81_fs" ||
            typeOf _x == "land_gm_euro_furniture_lampfixture_03") then {
                 _x setVariable ['gm_device_enabled', false, true];
                 _x enableSimulationGlobal false;

                 [_x, position _x] spawn GRAD_electricFence_fnc_sparkLarge;
            };
        } forEach ((position _target) nearObjects 20);
        
        private _identifier = format ["GRAD_electricFenceGenerator_%1", 0];
        private _existingGenerators = missionNamespace getVariable [_identifier, []];
        (_existingGenerators select 0) setVariable ['GRAD_electricFence_generatorActive', false, true];
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "_this getVariable ['GRAD_isTechnician', false] && (_originalTarget getVariable ['GRAD_hasPower', false])",
    4,
    false,
    "",
    ""
];

_vehicle addAction [ 
    "<t color='#333399'>Rechner anschalten</t>", { 
        params ["_target", "_caller", "_actionId", "_arguments"]; 
        _target setVariable ["GRAD_hasPower", true, true]; 
 
        _target animate ["Power_1", 1]; 
        _target animate ["Power_2", 1]; 
        _target animate ["SwitchLight", 0.1]; 
        _target animate ["SwitchPosition", -1]; 

        // systemChat "on";


        {
           if (typeOf _x == "land_gm_computer_teleraet_81_r" ||
            typeOf _x == "land_gm_computer_teleraet_81_m" ||
            typeOf _x == "land_gm_computer_teleraet_81_fs" ||
            typeOf _x == "land_gm_euro_furniture_lampfixture_03") then {
                 _x setVariable ['gm_device_enabled', true, true];
                  _x enableSimulationGlobal true;
            };  
        } forEach ((position _target) nearObjects 20);
        
        private _identifier = format ["GRAD_electricFenceGenerator_%1", 0];
        private _existingGenerators = missionNamespace getVariable [_identifier, []];
        (_existingGenerators select 0) setVariable ['GRAD_electricFence_generatorActive', true, true];
    }, 
    [], 
    1.5,  
    true,  
    true,  
    "", 
    "_this getVariable ['GRAD_isTechnician', false] && (!(_originalTarget getVariable ['GRAD_hasPower', false]))",
    4, 
    false, 
    "", 
    "" 
];
