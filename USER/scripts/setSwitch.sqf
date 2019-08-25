
/*

animation sources

Power_1
Power_2
"SwitchLight"
SwitchPosition
*/

params ["_vehicle"];

_vehicle addAction [
    "<t color='#333399'>Rechner ausschalten</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["GRAD_hasPower", false, true];

        _target animate ["Power_1", 0];
        _target animate ["Power_2", 0];
        _target animate ["SwitchLight", 0];
        _target animate ["SwitchPosition", 1];

        systemChat "off";

        {
           if (typeOf _x == "land_gm_computer_teleraet_81_r" ||
            typeOf _x == "land_gm_computer_teleraet_81_m" ||
            typeOf _x == "land_gm_computer_teleraet_81_fs") then {
                 _x setVariable ['gm_device_enabled', false];
                 _x enableSimulationGlobal false;
            };  
        } forEach nearObjects 20;
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

        systemChat "on";


        {
           if (typeOf _x == "land_gm_computer_teleraet_81_r" ||
            typeOf _x == "land_gm_computer_teleraet_81_m" ||
            typeOf _x == "land_gm_computer_teleraet_81_fs") then {
                 _x setVariable ['gm_device_enabled', true];
                  _x enableSimulationGlobal true;
            };  
        } forEach nearObjects 20;
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