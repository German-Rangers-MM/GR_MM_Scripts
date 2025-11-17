params ["_jumpers",["_autoOpenHeight",500],["_nvgFailChance",0]];


if (!hasInterface) exitWith {};
if !(player in _jumpers) exitWith {};

waitUntil{(getPos player select 2) <= _autoOpenHeight};

player action ["OpenParachute", player];
[player, "hit", 1] call ace_medical_feedback_fnc_playInjuredSound;

if (_nvgFailChance > 0) then {
    private _callNVG = ((random 1 + linearConversion[0,1,windStr,0,0.6,true])/2) < _nvgFailChance;

    if (_callNVG) then {
        player action ["NvGogglesOff", player];
    };
};