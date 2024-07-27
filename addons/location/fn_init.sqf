#include "script_component.hpp"

/*
{
    locations: {
        type: str
        position: pos
    }
    types: {}
}
*/
private _spawn = createhashmapfromarray [
    [LOCATIONS, createhashmap],
    [TYPES, createhashmap]
];

VAR(database,shared) set [QUOTE(COMPONENT), _spawn];
publicVariable QUOTE(VAR(database,shared));
