params ["_plane"];

if (!hasInterface) exitWith {};

_plane addEventHandler ["GetIn", {
	params ["_plane", "_role", "_unit", "_turret"];

    if (_unit != player) exitWith {};

    [{
        params ["_plane"];

        speed _plane > 80 ||
        (vehicle player) != _plane
    },{
        params ["_plane"];

        if (vehicle player != _plane) exitWith {};

        private _helperObj = "Land_HelipadEmpty_F" createVehicleLocal (getPos _plane);
        _helperObj attachTo [_plane];

        private _sounds = [
            ["grad_wind1",30,0],
            ["grad_wind2",28,0],
            ["grad_wind3",35,0]
        ];

        [{
            params ["_args","_handle"];
            _args params ["_plane","_helperObj","_sounds"];

            if (vehicle player != _plane) exitWith {
                deleteVehicle _helperObj;
                [_handle] call CBA_fnc_removePerFrameHandler;
            };

            {
                _x params ["_sound","_loopTime","_lastPlayedTime"];
                if (CBA_missionTime - _lastPlayedTime > _loopTime) then {
                    _helperObj say2D _sound;
                    _x set [2,CBA_missionTime];
                };
            } forEach _sounds;

        },0,[_plane,_helperObj,_sounds]] call CBA_fnc_addPerFrameHandler;
    },[_plane]] call CBA_fnc_waitUntilAndExecute;
}];
