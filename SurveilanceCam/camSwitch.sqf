if (! isServer) exitWith {};

_state = _this select 0;
_blank = "#(argb,8,8,3)color(0,0,0,0.0,co)";
_feed = "#(argb,512,512,1)r2t(piprendertg1,1.33)";
_terminated = "a3\props_f_aow\civilian\gallery\data\screen_co.paa";
_code = "a3\structures_f\items\electronics\data\electronics_screens_laptop_co.paa";

switch (toLower _state) do
{
	case "an":{
		tocScreen setObjectTextureGlobal [0, _feed];
		tocPC setObjectTextureGlobal [1,_feed];
	};
	case "aus":{
		tocScreen setObjectTextureGlobal [0, _terminated];
		tocPC setObjectTextureGlobal [1,_terminated];
	};
	case "code":{
		tocScreen setObjectTextureGlobal [0, _code];
		tocPC setObjectTextureGlobal [1,_code];
	};
};
