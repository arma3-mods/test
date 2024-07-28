#include "script_component.hpp"

VAR(database,shared) set [QUOTE(COMPONENT), createhashmapfromarray [
    [SPAWNS, createhashmapfromarray [
        [SOWNER, 2],
        [STATE, createhashmap]
    ]],
    [TYPES, createhashmap]
]];
publicVariable QUOTE(VAR(database,shared));

VAR(spawn,_active) = false;
VAR(spawn,_updateFrequency) = 1;
