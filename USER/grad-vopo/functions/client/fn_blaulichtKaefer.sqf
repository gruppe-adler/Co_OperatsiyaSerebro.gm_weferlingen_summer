/*
    optimized for GM trabant
*/

params ["_car"];

fnc_SetPitchBankYaw = {
    private ["_object","_rotations","_aroundX","_aroundY","_aroundZ","_dirX","_dirY",
    "_dirZ","_upX","_upY","_upZ","_dir","_up","_dirXTemp","_upXTemp"];
    _object = _this select 0;
    _rotations = _this select 1;
    _aroundX = _rotations select 0;
    _aroundY = _rotations select 1;
    _aroundZ = (360 - (_rotations select 2)) - 360;
    _dirX = 0;
    _dirY = 1;
    _dirZ = 0;
    _upX = 0;
    _upY = 0;
    _upZ = 1;
    if (_aroundX != 0) then {
        _dirY = cos _aroundX;
        _dirZ = sin _aroundX;
        _upY = -sin _aroundX;
        _upZ = cos _aroundX;
    };
    if (_aroundY != 0) then {
        _dirX = _dirZ * sin _aroundY;
        _dirZ = _dirZ * cos _aroundY;
        _upX = _upZ * sin _aroundY;
        _upZ = _upZ * cos _aroundY;
    };
    if (_aroundZ != 0) then {
        _dirXTemp = _dirX;
        _dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ);
        _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);
        _upXTemp = _upX;
        _upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ);
        _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ);
    };
    _dir = [_dirX,_dirY,_dirZ];
    _up = [_upX,_upY,_upZ];
    _object setVectorDirAndUp [_dir,_up];
};


private _positionLeft = [0,0.28,0.4];


private _reflectorLeftBlue = "Reflector_Cone_01_wide_blue_F" createVehicleLocal [0,0,0];
_reflectorLeftBlue attachTo [_car, _positionLeft];


private _reflectorLeftBlue2 = "Reflector_Cone_01_wide_blue_F" createVehicleLocal [0,0,0];
_reflectorLeftBlue2 attachTo [_car, _positionLeft];


[{
    params ["_args", "_handle"];
    _args params [
        "_car",
        "_reflectorLeftBlue",
        "_reflectorLeftBlue2"
    ];


    if (!(_car getVariable ["IC_vopo_blaulicht", false]) || isNull _car || !alive _car) exitWith {

        {
          deleteVehicle _x;
        } forEach [
            _reflectorLeftBlue,
            _reflectorLeftBlue2
        ];

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _rotationLeft = _car getVariable ["rotationLeft", 0];
    _rotationLeft = _rotationLeft + 8;
    _car setVariable ["rotationLeft", _rotationLeft];



    [_reflectorLeftBlue,[0,0,_rotationLeft+270]] call fnc_SetPitchBankYaw;

    [_reflectorLeftBlue2,[0,0,_rotationLeft+90]] call fnc_SetPitchBankYaw;

}, 0, [
    _car,
    _reflectorLeftBlue,
    _reflectorLeftBlue2]
] call CBA_fnc_addPerFrameHandler;
