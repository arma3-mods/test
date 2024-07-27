#include "script_component.hpp"
params ["_on"];

if (not VAR(spawn,_active) and _on) exitWith {
    VAR(spawn,_active) = true;
    diag_log format ["[mis_spawn_fnc_toggle] %1: spawn loop started.", clientowner];

    [] spawn {
        while {VAR(spawn,_active)} do {
            call FNC(spawn,update);
            sleep VAR(spawn,_updateFrequency);
        };
    };
};

if (VAR(spawn,_active) and not _on) then {
    VAR(spawn,_active) = false;
    diag_log format ["[mis_spawn_fnc_toggle] %1: spawn loop stopped.", clientowner];
};
