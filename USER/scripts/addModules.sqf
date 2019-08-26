
waitUntil {!isNull player};
waitUntil {  time > 3 };

{


    _x addEventHandler ["CuratorGroupPlaced", {
        params ["", "_group"];

        {
            _x setSkill ["aimingShake", 0.2];
            _x setSkill ["aimingSpeed", 0.9];
            _x setSkill ["endurance", 0.6];
            _x setSkill ["spotDistance", 1];
            _x setSkill ["spotTime", 0.9];
            _x setSkill ["courage", 1];
            _x setSkill ["reloadSpeed", 1];
            _x setSkill ["commanding", 1];
            _x setSkill ["general", 1];

        } forEach units _group;
    }];

    _x addEventHandler ["CuratorObjectPlaced", {
        params ["", "_object"];


        _object setSkill ["aimingShake", 0.2];
        _object setSkill ["aimingSpeed", 0.9];
        _object setSkill ["endurance", 0.6];
        _object setSkill ["spotDistance", 1];
        _object setSkill ["spotTime", 0.9];
        _object setSkill ["courage", 1];
        _object setSkill ["reloadSpeed", 1];
        _object setSkill ["commanding", 1];
        _object setSkill ["general", 1];

    }];

} forEach allCurators;


if (
    isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")
) then
{
    // Note that the line below has to be uncommented if your mission is a Zeus Game Master mission.
    // TODO check if below is necessary to uncomment
    waitUntil {not isNil "ares_category_list"};

    /*
    ["CO TAFELSILBER", "Start Alarm Light",
    {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

     alarmLight1 setVariable ["GRAD_alarmLightOn", true, true];
     [[alarmLight1],"USER\scripts\alarmLight.sqf"] remoteExec ["BIS_fnc_execVM",[0,-2] select isDedicated];

    }] call Ares_fnc_RegisterCustomModule;


    ["CO TAFELSILBER", "End Alarm Light",
    {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    alarmLight1 setVariable ["GRAD_alarmLightOn", false, true];

    }] call Ares_fnc_RegisterCustomModule;
    */

    ["CO TAFELSILBER", "Unit Put Away Weapon",
    {
        // Get all the passed parameters
        params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

        [[_objectUnderCursor],"USER\scripts\putAwayWeapon.sqf"] remoteExec ["BIS_fnc_execVM",2];

    }] call Ares_fnc_RegisterCustomModule;

    ["CO TAFELSILBER", "Set Container to HEAVY",
    {
        // Get all the passed parameters
        params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

        [[ciaContainer, false],"USER\scripts\setMass.sqf"] remoteExec ["BIS_fnc_execVM",ciaContainer];

    }] call Ares_fnc_RegisterCustomModule;

    ["CO TAFELSILBER", "Set Container to LIFTABLE",
    {
        // Get all the passed parameters
        params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

        [[ciaContainer, true],"USER\scripts\setMass.sqf"] remoteExec ["BIS_fnc_execVM",ciaContainer];

    }] call Ares_fnc_RegisterCustomModule;

    ["CO TAFELSILBER", "Techniker Fort. Hint",
    {
        if (isNil "grad_techniker" || {isNull grad_techniker}) exitWith {systemChat "grad_techniker is nil or null"};

        [[],{
            ["grad_notification1",["TECHNIKER","Da war doch was... (Map öffnen >> 'Techniker' Eintrag)"]] call bis_fnc_showNotification;
            player createDiarySubject ["Techniker","Techniker"];
            player createDiaryRecord ["Techniker",["Da war doch was...","<font face='PuristaLight'>Ich kann mich daran erinnern, beim großen Schornstein eine Palette Sandsäcke gesehen zu haben. Wenn wir hier noch länger aushalten müssen, könnten wir die gut gebrauchen.</font></t><br/><br/>ACE-Interact mit Palette >> Fortifications.<br/><br/>Nur du hast diese Nachricht erhalten. Andere Spieler können sich ebenfalls Sandsäcke nehmen, sind aber nicht so versiert wie du darin sie zu bauen und brauchen dafür länger."]];

        }] remoteExec ["call",grad_techniker,false];

    }] call Ares_fnc_RegisterCustomModule;

    ["CO TAFELSILBER", "Bluforize Police Group",
    {
        params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

        if (isNull _objectUnderCursor) exitWith {
            [objNull,"Error: Nothing selected."] call BIS_fnc_showCuratorFeedbackMessage;
        };

        if (side _objectUnderCursor != CIVILIAN) exitWith {
            [objNull,"Error: Selected object is not civilian."] call BIS_fnc_showCuratorFeedbackMessage;
        };

        [[group _objectUnderCursor],{
            params [["_oldGrp",grpNull]];

            if (isNull _oldGrp) exitWith {
                [objNull,"Error: Selected object does not have a group."] remoteExec ["BIS_fnc_showCuratorFeedbackMessage",remoteExecutedOwner,false];
            };

            {
                _x addWeapon "gm_p1_blk";
                _x addHandgunItem "gm_8Rnd_9x19mm_B_DM11_p1_blk";
                for "_i" from 1 to 8 do {_x addItemToUniform "gm_8Rnd_9x19mm_B_DM11_p1_blk";};
            } forEach (units _oldGrp);

            private _newGrp = createGroup WEST;
            (units _oldGrp) joinSilent _newGrp;
        }] remoteExecCall ["call",2,false];


    }] call Ares_fnc_RegisterCustomModule;

};
