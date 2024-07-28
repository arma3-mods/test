#include "script_component.hpp"

params ["_type", "_spawn"];

VAR(database,shared) get QUOTE(COMPONENT) get SPAWNS get _type deleteAt _name;

publicVariable QUOTE(VAR(database,shared));
