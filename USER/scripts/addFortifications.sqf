/*
this execVM "USER\scripts\addFortifications.sqf"
*/

params ["_crate"];

if (!isServer) exitWith {};

waitUntil {!isNull _crate};

{
    [_crate,_x select 0,_x select 1] call grad_fortifications_fnc_addFort;
} forEach [
    ["land_gm_sandbags_01_short_01",10],
    ["land_gm_sandbags_01_door_02",10],
    ["land_gm_sandbags_01_window_02",10],
    ["land_gm_sandbags_01_round_01",4],
    ["land_gm_sandbags_01_low_01",4],
    ["land_gm_sandbags_01_wall_01",8]
];
