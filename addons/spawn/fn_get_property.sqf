#include "script_component.hpp"

params ["_spawn", "_property"];

VAR(database,shared) get QUOTE(COMPONENT) get SPAWNS get _spawn get _property
