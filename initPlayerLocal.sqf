	sleep 4;

	call compilefinal preprocessFileLineNumbers "oo_camera.sqf";

	private ["_player"];

	_cam = ["new", []] call OO_CAMERA;
	["backCamera", player] call _cam;
	["showCamera", [-0.4, 0.8,0.3,0.4]] call _cam;

	_cam2 = ["new", []] call OO_CAMERA;
	["topCamera", player] call _cam2;
	["showCamera", [0, 0.8,0.3,0.4]] call _cam2;

	_cam3 = ["new", []] call OO_CAMERA;
	["faceCamera", player] call _cam3;
	["showCamera", [0.4, 0.8,0.3,0.4]] call _cam3;

	_cam4 = ["new", []] call OO_CAMERA;
	["uavCamera", player] spawn _cam4;
	["showCamera", [0.8, 0.8,0.3,0.4]] call _cam4;	
