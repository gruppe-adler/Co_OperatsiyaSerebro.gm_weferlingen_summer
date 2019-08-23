diwako_dui_main_toggled_off = true;
titleText ["","BLACK FADED",999];

[{
    time > 0
},{
    
    // we need sleep
    [] spawn {
        // dont display for JIP
        if (didJIP) exitWith {
            titleText ["", "BLACK IN", 0];
            10 fadeSound 1;
        };
        setAperture 2;
        1 fadeSound 1;
        playSound "intro";

        diwako_dui_main_toggled_off = true;
        
        player setVariable ["tf_voiceVolume", 0, true];

        player action ["WeaponOnBack", player];

        /*
        private _viewDistanceCache = viewDistance;
        private _objectViewDistanceCache = getObjectViewDistance;

        setViewDistance 8000;
        setObjectViewDistance [4000,200];
        */

        [] spawn GRAD_introCam_fnc_textEffects;
        // [] spawn GRAD_introCam_fnc_playRecord;

        private _shots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

        private _count = count _shots;
        {
          	[_x, _forEachIndex] call GRAD_introCam_fnc_camCommands;
        } forEach _shots;

        player action ["WeaponOnBack", player];

        cutText [" ", "BLACK IN", 3];
        private _camera = "camera" camCreate (getpos player);
        _camera cameraeffect ["terminate", "back"];
        camDestroy _camera;

        STHud_UIMode = 1;

        /*
        setViewDistance _viewDistanceCache;
        setObjectViewDistance _objectViewDistanceCache;
        */
       
        titleText ["", "BLACK IN", 0];
        player setVariable ["tf_voiceVolume", 1, true];
        diwako_dui_main_toggled_off = false;
        setAperture -1;
    };
    
}, []] call CBA_fnc_waitUntilAndExecute;