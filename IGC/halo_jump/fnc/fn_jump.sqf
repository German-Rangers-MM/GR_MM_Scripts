params ["_jumpers","_vehicle","_giveParachute",["_parachuteClass","B_Parachute"],["_autoOpenHeight",500],["_onLanding",{}]];



if (!hasInterface) exitWith {};
if !(player in _jumpers) exitWith {};

if (_giveParachute) then {
    if (isClass (configFile >> "CfgPatches" >> "bocr_main")) then {
        if (backpack player isNotEqualTo _parachuteClass) then {
            [player] call zade_boc_fnc_actionOnChest;
        };
    };

    removeBackpack player;
    player addBackpackGlobal _parachuteClass;
};

if(canSuspend) then {sleep random [0,3,15];};

player moveOut _vehicle;

if (sunOrMoon < 0.3) then {
    if ("ACE_IR_Strobe_Item" in (items player)) then {
        [player, player, ["ACE_IR_Strobe_Item"]] call ace_attach_fnc_attach;
    };
};

player allowdamage false;

[{(toLower animationState player) in ["halofreefall_non","halofreefall_f","halofreefall_b"]}, {

    _this spawn {
        params ["_jumpers","_vehicle","_giveParachute",["_parachuteClass","B_Parachute"],["_autoOpenHeight",500],"_onLanding"];
        _v1 = (random 20) + 40;
        _v1 = (getDir _vehicle) + (round (random 8) - 4);


        resetCamShake;
        player setVelocity [_v1 * (sin _v1), _v1 * (cos _v1), -15 ];
        addCamShake [35, 25, 10];
        addCamShake [20, 10, 10];
        addCamShake [10, 20,  5];

        sleep 2;
        waitUntil {(animationState player == "para_pilot") || (animationState player == "chute_pos")};

        resetCamShake;
        34 cutText ["", "BLACK IN", 2];
        addCamShake [40, 3, 5];

        addCamShake [5,  3,  2];

        setAperture 0.05;
        setAperture -1;
        "DynamicBlur" ppEffectEnable true;
        "DynamicBlur" ppEffectAdjust [8.0];
        "DynamicBlur" ppEffectCommit 0.01;

        sleep 1;

        "DynamicBlur" ppEffectAdjust [0.0];
        "DynamicBlur" ppEffectCommit 3;

        sleep 3;

        "DynamicBlur" ppEffectEnable false;
        "RadialBlur" ppEffectAdjust [0.0, 0.0, 0.0, 0.0];
        "RadialBlur" ppEffectCommit 1.0;
        "RadialBlur" ppEffectEnable false;


        while {(getPos player select 2) > 8} do {
            addCamShake [2, 3.5, 1];
            sleep 4;
        };
        resetCamShake;

        call _onLanding;
        player allowdamage true;
        removeBackpack player;
    };
}, _this,900,{player allowDamage true}] call CBA_fnc_waitUntilAndExecute;
