#include "script_component.hpp"

params ["_name", "_type"];

if not (_type in (VAR(database,shared) get QUOTE(COMPONENT) get TYPES)) exitWith {
    diag_log format ["[mis_spawn_fnc_add] %1 Error: spawn '%2': '%3' is not a valid spawn type", clientOwner, _name, _type];
};
diag_log format ["[mis_spawn_fnc_add] %1: new spawn '%2' of type '%3'", clientOwner, _name, _type];

private _spawn = createhashmapfromarray [
    [STATE, 0],
    [TYPE, _type]
];
VAR(database,shared) get QUOTE(COMPONENT) get SPAWNS set [_name, _spawn];

publicVariable QUOTE(VAR(database,shared));
