#include "script_component.hpp"

params ["_type", "_states", "_update"];

VAR(database,shared) get QUOTE(COMPONENT) get TYPES set [_type, createhashmapfromarray [
    ["states", _states],
    ["update", _update]
]];

publicVariable QUOTE(VAR(database,shared));
