/*
	// put in init of generator object, different ID (number) for different fences
	
	[this, 2] call GRAD_electricFence_fnc_addGenerator;

    // weferlingen
    land_gm_euro_misc_powerbox_01
    land_gm_euro_misc_powerbox_02
    land_gm_euro_misc_powerbox_04_w
    land_gm_euro_misc_powerbox_03_w	
*/

params ["_generator", ["_id", 0]];

if (!isServer) exitWith {};

// get identifier for public var
private _identifier = format ["GRAD_electricFenceGenerator_%1", _id];

// check for existing parts, empty array if nothing there
private _existingGenerators = missionNamespace getVariable [_identifier, []];
_existingGenerators pushBackUnique _generator;

// save new array
missionNamespace setVariable [_identifier, _existingGenerators];