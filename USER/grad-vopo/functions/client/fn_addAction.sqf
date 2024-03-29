/*
    [_car] call GRAD_vopo_fnc_addAction;
*/

params ["_car"];

if (typeOf _car == "gm_gc_bgs_p601") then {

// blaulicht
_car addAction [
    "<t color='#333399'>Blaulicht AN</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["IC_vopo_blaulicht", true, true];
        [_target] remoteExec ["GRAD_vopo_fnc_blaulichtTrabant", 0];
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "!(_originalTarget getVariable ['IC_vopo_blaulicht', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];

_car addAction [
    "<t color='#333399'>Blaulicht AUS</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["IC_vopo_blaulicht", false, true];
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "(_originalTarget getVariable ['IC_vopo_blaulichtKaefer', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];

} else {
    
// blaulicht
_car addAction [
    "<t color='#333399'>Blaulicht AN</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["IC_vopo_blaulicht", true, true];
        [_target] remoteExec ["GRAD_vopo_fnc_blaulichtKaefer", 0];
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "!(_originalTarget getVariable ['IC_vopo_blaulicht', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];

_car addAction [
    "<t color='#333399'>Blaulicht AUS</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["IC_vopo_blaulicht", false, true];
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "(_originalTarget getVariable ['IC_vopo_blaulichtKaefer', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];
  
};
