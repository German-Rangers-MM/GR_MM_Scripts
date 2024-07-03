//nach bedarf an init anhängen

//CamSwitch

	_iconTOC = "a3\ui_f\data\igui\cfg\simpletasks\types\search_ca.paa";
	_state = ["An","An",_iconTOC,{[["an",_this#0], "scripts\camSwitch.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
	[tocPC, 0, ["ACE_MainActions"], _state] call ace_interact_menu_fnc_addActionToObject;

	_state = ["Code","Code",_iconTOC,{[["code",_this#0], "scripts\camSwitch.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
	[tocPC, 0, ["ACE_MainActions"], _state] call ace_interact_menu_fnc_addActionToObject;

	_state = ["Aus","Aus",_iconTOC,{[["aus",_this#0], "scripts\camSwitch.sqf"] remoteExec ["execVM"];},{true}] call ace_interact_menu_fnc_createAction;
	[tocPC, 0, ["ACE_MainActions"], _state] call ace_interact_menu_fnc_addActionToObject;

[cam1, "piprendertg1", 0.6, 0] execVM "scripts\setSurveillanceCam.sqf";
