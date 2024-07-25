#include "script_component.hpp"

params ["_owner", "_data"];

private _currentWorkers = (GVAR(scheduler,workers) getVariable "_all");
if not (_owner in _currentWorkers) then {
    diag_log format ["Server: received new worker: %1", _owner];
    GVAR(scheduler,workers) setVariable ["_all", _currentWorkers + [_owner]];
};
private _id = str _owner;
GVAR(scheduler,workers) setVariable ["_data" + _id, _data];
GVAR(scheduler,workers) setVariable ["_last_update" + _id, time];
