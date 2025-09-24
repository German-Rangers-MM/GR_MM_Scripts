params ["_jumpers",["_autoOpenHeight",500]];


if (!hasInterface) exitWith {};
if !(player in _jumpers) exitWith {};

waitUntil{(getPos player select 2) <= _autoOpenHeight};

player action ["OpenParachute", player];