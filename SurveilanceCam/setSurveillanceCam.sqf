params ["_realCam", "_renderTexture", "_fov", "_pipEffect"];

//#(argb,512,512,1)r2t(surface,aspectratio)

_pipCam = "camera" camCreate (getPos _realCam);

_pipCam camSetFov _fov;
_pipCam camCommit 0;

[_renderTexture, _pipCam] call BIS_fnc_PIP;

//Normal - [0], Night Vision - [1], Thermal - [2]
_renderTexture setPiPEffect [_pipEffect];

_actualDirection = round (getDir _realCam);

while {true} do
{
	_actualDirection = _actualDirection;
	_realCam setDir _actualDirection;
	_pipCam setDir (_actualDirection + 180);
};
