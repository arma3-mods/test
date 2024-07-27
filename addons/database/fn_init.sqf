#include "script_component.hpp"

VAR(database,server) = createhashmap;
VAR(database,shared) = createhashmap;
publicVariable QUOTE(VAR(database,shared));
