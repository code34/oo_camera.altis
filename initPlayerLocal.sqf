	sleep 4;

	call compilefinal preprocessFileLineNumbers "oo_camera.sqf";

	private ["_player"];

	_cam = ["new", []] call OO_CAMERA;
	["backCamera", player] spawn _cam;
	sleep 1;
	["r2w", [-0.4, 0.8,0.3,0.4]] call _cam;

	_cam2 = ["new", []] call OO_CAMERA;
	["topCamera", player] spawn _cam2;
	["r2w", [0, 0.8,0.3,0.4]] call _cam2;

	_cam3 = ["new", []] call OO_CAMERA;
	["faceCamera", player] spawn _cam3;
	["r2w", [0.4, 0.8,0.3,0.4]] call _cam3;

	_cam4 = ["new", []] call OO_CAMERA;
	["uavCamera", player] spawn _cam4;
	["r2w", [0.8, 0.8,0.3,0.4]] call _cam4;	
