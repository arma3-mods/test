#include "script_component.hpp"

params ["_type", "_states", "_update"];
diag_log format ["[mis_spawn_fnc_add_type] %1: new type '%2'", clientOwner, _type];

VAR(database,shared) get QUOTE(COMPONENT) get TYPES set [_type, createhashmapfromarray [
    ["states", _states],
    ["update", _update]
]];

publicVariable QUOTE(VAR(database,shared));
