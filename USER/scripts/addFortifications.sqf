/*
this execVM "USER\scripts\addFortifications.sqf"
*/

params ["_crate"];

if (!isServer) exitWith {};

waitUntil {!isNull _crate};

{
    [_crate,_x select 0,_x select 1] call grad_fortifications_fnc_addFort;
} forEach [
    ["Land_HBarrier_1_F",5]
];
