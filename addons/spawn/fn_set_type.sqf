#include "script_component.hpp"

params ["_type", "_update"];
diag_log format ["[mis_spawn_fnc_set_type] %1: new type '%2'", clientOwner, _type];

VAR(database,shared) get QUOTE(COMPONENT) get TYPES set [_type, createhashmapfromarray [
    ["update", _update],
]];
VAR(database,shared) get QUOTE(COMPONENT) get SPAWNS set [_type, createhashmap];

publicVariable QUOTE(VAR(database,shared));
