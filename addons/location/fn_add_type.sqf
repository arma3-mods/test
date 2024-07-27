#include "script_component.hpp"

params ["_type", ["_states", [], [[]]]];
diag_log format ["[mis_location_fnc_add_type] %1: new type '%2'", clientOwner, _type];

VAR(database,shared) get QUOTE(COMPONENT) get TYPES set [_type, _states];

publicVariable QUOTE(VAR(database,shared));
