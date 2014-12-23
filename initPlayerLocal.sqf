	call compilefinal preprocessFileLineNumbers "oo_camera.sqf";

	sleep 4;

	_cam = ["new", []] call OO_CAMERA;
	["presetCamera", [player, "backCamera"]] spawn _cam;
	sleep 1;
	["r2w", [-0.4, 0.8,0.3,0.4]] call _cam;

	_cam2 = ["new", []] call OO_CAMERA;
	["presetCamera", [player, "topCamera"]] spawn _cam2;
	["r2w", [0, 0.8,0.3,0.4]] call _cam2;

	_cam3 = ["new", []] call OO_CAMERA;
	["presetCamera", [player, "goProCamera"]] spawn _cam3;
	["r2w", [0.4, 0.8,0.3,0.4]] call _cam3;

	_cam4 = ["new", []] call OO_CAMERA;
	["presetCamera", [player, "uavCamera"]] spawn _cam4;
	["r2w", [0.8, 0.8,0.3,0.4]] call _cam4;	

	sleep 3;
	["delete", _cam] call OO_CAMERA;

	_cam5 = ["new", []] call OO_CAMERA;
	["presetCamera", [player, "goProCamera"]] spawn _cam5;
	["r2o", toto] call _cam5;
	["setPipEffect", [2]] call _cam5;

