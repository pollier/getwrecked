//
//      Name: changeVehicle
//      Desc: Selects a vehicle and triggers the preview menu to update
//      Return: None
//

private ["_argument", "_newPreview", "_type"];

if (GW_WAITLOAD) exitWith {};

_argument = _this select 0;
_newPreview = _argument;
_type = typename _argument;

if ((_type != "STRING") && (_type != "SCALAR")) exitWith {};

if (_type == "STRING") then {

	switch (_argument) do {
		case "null": { _newPreview = currentPreview; };
		case "next": { _newPreview = currentPreview + 1; };
		case "prev": { _newPreview = currentPreview - 1; };
		default { _newPreview = _argument };
	};

} else {
	_newPreview = _argument;
};

// Ensure the selected vehicle is in range of the array
_newPreview = [_newPreview, 0, (count GW_LIBRARY), true] call limitToRange;
[_newPreview] spawn previewVehicle;