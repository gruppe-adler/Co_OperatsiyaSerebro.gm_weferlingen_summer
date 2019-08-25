#include "script_component.hpp"

params ["_generator"];

private _peeAction = [QGVAR(peeAction),"Pee on","",FUNC(onActionPee),FUNC(canPeeOn)] call ace_interact_menu_fnc_createAction;
[_generator,0,["ACE_MainActions"],_peeAction] call ace_interact_menu_fnc_addActionToObject;