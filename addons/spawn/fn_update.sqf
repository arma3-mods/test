#include "script_component.hpp"

private _component = VAR(database,shared) get QUOTE(COMPONENT);

{
    [_x, _y] params ["_type", "_spawns"];

    private _update = _component get TYPES get _type;
    {
        [_x, _y] params ["_name", "_spawn"];

        private _new_state = (_spawn get STATE) call _update;
        if not isnil "_new_state" then {
            [_type, _name, ] call FNC(spawn,set_state);
        }
    } forEach _spawns;
} forEach (_component get SPAWNS)
