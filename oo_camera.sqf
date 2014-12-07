	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014 Nicolas BOITEUX

	CLASS OO_CAMERA
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	#include "oop.h"

	CLASS("OO_CAMERA")
		PRIVATE VARIABLE("object","camera");
		PRIVATE VARIABLE("string","name");
		PRIVATE STATIC_VARIABLE("scalar","instanceid");

		PUBLIC FUNCTION("array","constructor") {
			private ["_cam", "_instanceid", "_name"];

			_instanceid = MEMBER("instanceid",nil);
			if (isNil "_instanceid") then {_instanceid = 0;};
			_instanceid = _instanceid + 1;
			MEMBER("instanceid",_instanceid);			

			_name = "rtt"+str(_instanceid);
			diag_log str(_name);

			_cam = "camera" camCreate [position player select 0, position player select 1, 50];
			_cam cameraEffect ["internal","back", _name]; 
			MEMBER("camera", _cam);
			MEMBER("name", _name);
		};

		PUBLIC FUNCTION("array","setPipEffect") {
			MEMBER("name", nil) setPiPEffect _this;
		};

		PUBLIC FUNCTION("object", "backCamera"){
			MEMBER("camera", nil) attachto [_this,[0.7,-2,1.5]];
		};

		PUBLIC FUNCTION("object", "topCamera"){
			MEMBER("camera", nil) attachto [_this,[0,0,30]];
			MEMBER("camera", nil) camSetTarget _this;
			MEMBER("camera", nil) camCommit 0;
		};

		PUBLIC FUNCTION("object", "faceCamera"){
			MEMBER("camera", nil) attachto [_this,[0,1,1.5]];
			MEMBER("camera", nil) camSetTarget _this;
			MEMBER("camera", nil) camCommit 0;
		};

		PUBLIC FUNCTION("object", "uavCamera"){
			private ["_uav", "_position", "_wp"];
			_position = [position _this select 0, position _this select 1, 100];
			_uav = createVehicle ["B_UAV_01_F", _position, [], 0, "FLY"]; 
			createVehicleCrew _uav; 
			_uav flyInHeight 50;
			MEMBER("camera", nil) attachTo [_uav, [0,1,0]];

			while { alive _uav} do {
				_position = [position _this select 0, position _this select 1, 100];
				_wp = (group _uav) addWaypoint [_position, 0];
				_wp setWaypointType "LOITER"; 
				_wp setWaypointLoiterType "CIRCLE_L"; 
				_wp setWaypointLoiterRadius 100;
				sleep 30;
				deletewaypoint _wp;
			};
		};

		PUBLIC FUNCTION("array","r2w") {
			// [-0.4, 0.8,0.3,0.4]	
			private ["_name"];
			_name = "camera_" + str(MEMBER("instanceid", nil));
			uiNamespace setvariable [_name, findDisplay 46 ctrlCreate ["RscPicture", -1]]; 
			(uiNamespace getvariable _name) ctrlSetPosition _this; 
			(uiNamespace getvariable _name) ctrlCommit 0; 
			(uiNamespace getvariable _name) ctrlSetText "#(argb,512,512,1)r2t("+ MEMBER("name", nil) + ", 1)"; 
		};

		PUBLIC FUNCTION("object","r2o") {
			private ["_name", "_object"];

			_object = _this;
			_name = "camera_" + str(MEMBER("instanceid", nil));
			_object setObjectTexture [0,"#(argb,512,512,1)r2t("+ MEMBER("name", nil) + ", 1)"];
		};

		PUBLIC FUNCTION("","deconstructor") { 
			camDestroy MEMBER("camera", nil);
			DELETE_VARIABLE("instanceid");
			DELETE_VARIABLE("camera");
			DELETE_VARIABLE("name");
		};
	ENDCLASS;