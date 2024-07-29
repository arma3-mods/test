#include "script_component.hpp"

params ["_type", "_name", ["_state", createhashmap]];

private _container = VAR(database,shared) get QUOTE(COMPONENT);

if not (_type in (_container get TYPES)) exitWith {
    diag_log format ["[mis_spawn_fnc_set] %1 Error: spawn '%2': '%3' is not a valid spawn type", clientOwner, _name, _type];
};
diag_log format ["[mis_spawn_fnc_set] %1: spawn '%2' of type '%3'", clientOwner, _name, _type];

_state merge createhashmapfromarray [
    [SOWNER, clientowner]
];

_container get SPAWNS get _type set [_name, _state];

publicVariable QUOTE(VAR(database,shared));
