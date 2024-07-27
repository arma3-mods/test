#include "script_component.hpp"

params ["_owner", "_data"];

private _currentWorkers = (VAR(scheduler,workers) getVariable "_all");
if not (_owner in _currentWorkers) then {
    diag_log format ["Server: received new worker: %1", _owner];
    VAR(scheduler,workers) setVariable ["_all", _currentWorkers + [_owner]];
};
private _id = str _owner;
VAR(scheduler,workers) setVariable ["_data" + _id, _data];
VAR(scheduler,workers) setVariable ["_last_update" + _id, time];
