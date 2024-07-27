#include "script_component.hpp"

params ["_name", "_type", "_position"];

private _properties = VAR(database,shared) get QUOTE(COMPONENT) get TYPES get _type;

if isNil "_properties" exitWith {
    diag_log format ["[mis_location_fnc_add] %1 Error: spawn '%2': '%3' is not a valid spawn type", clientOwner, _name, _type];
} else {
    diag_log format ["[mis_location_fnc_add] %1: new spawn '%2' of type '%3'", clientOwner, _name, _type];
};

private _item = createhashmapfromarray [
    [TYPE, _type],
    [POSITION, _position],
    [PROPERTIES, +_properties]
];
VAR(database,shared) get QUOTE(COMPONENT) get LOCATIONS set [_name, _item];

publicVariable QUOTE(VAR(database,shared));
