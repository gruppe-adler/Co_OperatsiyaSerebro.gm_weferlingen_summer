/*
[this] execVM "USER\scripts\antonovGlideMode.sqf"
*/

#define GLIDE_FACTOR        0.09

params [["_plane",objNull]];

if (CBA_missionTime < 10) exitWith {
    [{_this execVM "USER\scripts\antonovGlideMode.sqf"},_this,15] call CBA_fnc_waitAndExecute;
};


[{
    params ["_args","_handle"];
    _args params ["_plane"];

    if (isNull _plane) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
    if (!local _plane) exitWith {};

    if (isEngineOn _plane) exitWith {_args set [1,velocityModelSpace _plane]};
    if (speed _plane < 30) exitWith {};

    private _currentVelocity = velocityModelSpace _plane;
    private _previousForwardVelocity = (_args param [1,[0,0,0]]) select 1;
    private _currentForwardVelocity = _currentVelocity select 1;

    // allow max 10° pitch up before no longer applying speed loss reduction
    if (_currentForwardVelocity < _previousForwardVelocity && {((_plane call BIS_fnc_getPitchBank) select 0) < 10}) then {
        private _speedLoss = _previousForwardVelocity - _currentForwardVelocity;
        _currentVelocity set [1,_previousForwardVelocity - GLIDE_FACTOR * _speedLoss];
        _plane setVelocityModelSpace _currentVelocity;
    };

    _args set [1,_currentVelocity];

},0.1,[_plane,[0,0,0]]] call CBA_fnc_addPerFrameHandler;
