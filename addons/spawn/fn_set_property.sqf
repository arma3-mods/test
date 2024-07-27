#include "script_component.hpp"

params ["_spawn", "_property", "_value"];

VAR(database,shared) get QUOTE(COMPONENT) get SPAWNS get _spawn set [_property, _value];

publicVariable QUOTE(VAR(database,shared));
