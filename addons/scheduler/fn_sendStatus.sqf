#include "script_component.hpp"

// client side: send status information to the server
private _data = [GVAR(scheduler,FPSsamples), hasInterface, isDedicated];

[clientOwner, _data] remoteExec [QUOTE(GFUN(scheduler,measureFPS)), 2];
