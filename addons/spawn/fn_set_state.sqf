#include "script_component.hpp"

params ["_type", "_spawn", "_state"];

VAR(database,shared) get QUOTE(COMPONENT) get SPAWNS get _type get _spawn set [STATE, _state];

publicVariable QUOTE(VAR(database,shared));
