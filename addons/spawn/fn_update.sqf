#include "script_component.hpp"

private _component = VAR(database,shared) get QUOTE(COMPONENT);

// todo: despawned spawn states can be sent to other machines, reducing the load on them.
// here it would be a good opportunity to do so
// something like (over all states):
/*
if (_name == "despawned") then {
    // get best worker
    // set new owner
}
*/
// this results in the spawned to be spawned by the new worker, thereby distributing the work

private _update = {
    {
        [_x, _y] params ["_type", "_spawns"];

        private _update = _component get TYPES get _type;
        {
            [_x, _y] params ["_name", "_spawn"];

            // only run spawns owned by this machine.
            if (_spawn get SOWNER != clientowner) exitwith {};

            private _new_state = (_spawn get STATE) call _update;
            if not isnil "_new_state" then {
                [_type, _name, _new_state] call FNC(spawn,set_state);
            }
        } forEach _spawns;
    } forEach (_component get SPAWNS);
};

while {VAR(spawn,_active)} do {
    call _update;
    sleep VAR(spawn,_updateFrequency);
};
