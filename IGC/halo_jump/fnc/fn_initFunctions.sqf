params [["_plane",objNull],["_giveParachute",false],["_parachuteClass","B_Parachute"],["_automaticChute",true],["_autoOpenHeight",500],["_nvgFailChance",0],["_onLanding",{}]];

if (!local _unit) exitWith {_this remoteExec ["IGC_halo_jump_fnc_initFunctions",2,false]};





private _jumpers = [_plane] call IGC_halo_jump_fnc_getVehicleCargoMembers;

switch (true) do {
    case (_jumpers isEqualType WEST): {_jumpers = playableUnits select {side _x == _jumpers}};
    case (_jumpers isEqualType objNull): {_jumpers = [_jumpers]};
};

[_jumpers,_plane,_giveParachute,_parachuteClass,_autoOpenHeight,_onLanding] remoteExec ["IGC_halo_jump_fnc_jump",0,false];


if (_automaticChute) then {
    [_jumpers,_autoOpenHeight,_nvgFailChance] remoteExec ["IGC_halo_jump_fnc_openParachuteRemote",0,false];
};