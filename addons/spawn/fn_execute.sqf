// Function to execute a spawn. It
// starts from the state where the spawn was left.
#include "script_component.hpp"

params ["_spawn"];

private _spawns = VAR(database,shared) get QUOTE(COMPONENT) get "spawns";

if not (_spawn in _spawns) exitWith {
    diag_log format ["[mis_spawn_fnc_execute] Error: spawn '%1' does not exist", _spawn];
};

private _type = _spawns get _spawn get TYPE;

_type call FNC(spawn,get_type) params ["_states", "_functions"];

// take ownership of this spawn
_spawn set [SOWNER, clientOwner];
publicVariable QUOTE(VAR(database,shared));

private _state_index = _spawns get _spawn get STATE;
while {_state_index < count _functions} do {
    diag_log format ["[mis_spawn_fnc_execute] %1: spawn '%2' started state '%3'", clientOwner, _spawn, _states select _state_index];
    _spawn call (_functions select _state_index);
    diag_log format ["[mis_spawn_fnc_execute] %1: spawn '%2' finished state '%3'", clientOwner, _spawn, _states select _state_index];
    // the function above can change the `state_index` to a new one. We load it and use it
    _state_index = _spawns get _spawn get STATE;
    _state_index = _state_index + 1;

    _spawns get _spawn set [STATE, _state_index];
    publicVariable QUOTE(VAR(database,shared));
};
_spawns deleteAt _spawn;
publicVariable QUOTE(VAR(database,shared));
