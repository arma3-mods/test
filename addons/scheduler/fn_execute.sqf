// selects a worker and remotely executes a given function on it.
#include "script_component.hpp"

params ["_arguments", "_functionName"];

diag_log format ["scheduler_fnc_execute(%1):", _functionName];
private _worker_id = call GFUN(scheduler,getWorker);

_arguments remoteExec [_functionName, _worker_id, false];
