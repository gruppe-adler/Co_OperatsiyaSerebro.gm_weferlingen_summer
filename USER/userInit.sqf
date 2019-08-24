/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

execVM "USER\scripts\configureSlingloading.sqf";

if (isServer) then {
    {
        _x disableAI "MOVE";
    } forEach playableUnits + switchableUnits;
};

execVM "USER\scripts\createBorderTowers.sqf";
execVM "USER\scripts\addModules.sqf";