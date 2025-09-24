# Automatik und Freifall Fallschirmscript

## Installation
- Step 1: Füg dieses Code-Snippet in deine description.ext in die cfgFunctions class ein:
```SQF
class IGC_halo_jump {
    class common {
        file = "IGC\halo_jump\fnc";
        class initFunctions {};
        class jump {};
        class openParachuteRemote {};
        class getVehicleCargoMembers {};
    };
};
```
- Step 2: Kopier den IGC-Ordner in den Missionsordner

## Nutzung
Die Function nimmt folgende Parameter an:
- _fahrzeug (object)
- _fallschirmAusrüsten (bool, default: false) (optional)
- _fallschirmClass (string(classname), default: "B_Parachute") (optional)
- _automatikSprung (bool, default: true) (optional)
- _automatikSprungHöhe (num, default: 500)  (optional)
- _onLandingCode (code, default {}) (optional)

### Minimal-Beispiele:
- [this] call IGC_halo_jump_fnc_initFunctions;
  - Automatiksprung für 500m mit lenkbaren Schirm 
- [this,nil,nil,false] call IGC_halo_jump_fnc_initFunctions;
  - Freifallsprung mit lenkbaren Schirm 

### Maximal-Beispiel:
- [this,true,"CUP_T10_Parachute_backpack",true,600,{hint format["You landed at %1 %2",getPos player select 0,getPos player select 1]}] call IGC_halo_jump_fnc_initFunctions;
  - Automatiksprung für 600m mit nicht-lenkbaren Schirm und Koordinaten-Ausgabe bei Landung
