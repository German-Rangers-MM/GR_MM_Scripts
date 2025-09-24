params ["_vehicle"];

private _return = [];
private _crew = fullCrew [_vehicle,"cargo",false];

// return all units in vehicle and pushback to return array
{
    _return pushBack _x#0;
} forEach _crew;

_return
