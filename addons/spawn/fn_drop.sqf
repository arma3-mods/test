// called when a client (owner) drops.
#include "script_component.hpp"

params ["_owner"];

diag_log format ["[mis_spawn_fnc_drop] %1: taking ownership of all spawns from '%2'", clientOwner, _owner];

private _spawns = VAR(database,shared) get QUOTE(COMPONENT) get SPAWNS;

// delegate all spawns from the dropped owner to the server
{
    if ((_x get SOWNER) == _owner) then {
        _x spawn FNC(spawn,execute);
    }
} forEach _spawns;
