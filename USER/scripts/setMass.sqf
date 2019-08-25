params ["_vehicle", ["_slingloadable", false]];

if (_slingloadable) then {
    _vehicle setMass 2000;
} else {
    _vehicle setMass 40000;
};