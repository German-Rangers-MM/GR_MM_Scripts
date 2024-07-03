_intel1 = [  
 "intel1",  
 "Leiche untersuchen",  
 "",  
 {titletext ["<t color='#ffffff' size='2' font='RobotoCondensed' shadow = '2' >TEXT HIER</t>", "PLAIN DOWN", -1, true, true];},  
 {true}  
 ] call ace_interact_menu_fnc_createAction;  
 
[this, 0, ["ACE_MainActions"], _intel1] call ace_interact_menu_fnc_addActionToObject;
