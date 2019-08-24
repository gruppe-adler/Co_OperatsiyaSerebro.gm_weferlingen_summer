params ["_unit"];

if (!local _unit) exitWith {};
_unit action ["SwitchWeapon", _unit, _unit, 100];