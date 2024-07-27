#include "script_component.hpp"

/*
{
    spawns: {
        str: {
            state: scalar
            type: string
        }
    }
    types: {
        str: {
        states: [[string, code]]
        update: code
        }
    }
}
*/
private _spawn = createhashmapfromarray [
    [SPAWNS, createhashmap],
    [TYPES, createhashmap]
];

VAR(database,shared) set [QUOTE(COMPONENT), _spawn];
publicVariable QUOTE(VAR(database,shared));

VAR(spawn,_active) = false;
VAR(spawn,_updateFrequency) = 1;
