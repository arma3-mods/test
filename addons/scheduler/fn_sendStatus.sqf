#include "script_component.hpp"

// client side: send status information to the server
private _data = [VAR(scheduler,FPSsamples), hasInterface, isDedicated];

[clientOwner, _data] remoteExec [QUOTE(FNC(scheduler,measureFPS)), 2];
