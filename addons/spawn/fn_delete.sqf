#include "script_component.hpp"

params ["_name"];

VAR(database,shared) get QUOTE(COMPONENT) get SPAWNS deleteAt _name
