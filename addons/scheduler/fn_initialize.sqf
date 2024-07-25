#include "script_component.hpp"

// number of samples in the moving average of FPS
#define WINDOW_SIZE 12

GVAR(scheduler,FPSsamples) = []; // the recent FPS samples of each machine (local)
for "_i" from 0 to WINDOW_SIZE do {
    GVAR(scheduler,FPSsamples) pushBack 60;
};

if isServer then {
    // the server stores status of the clients
    GVAR(scheduler,workers) = createSimpleObject ["Static", [0, 0, 0]];
    GVAR(scheduler,workers) setVariable ["_all", []];
} else {
    // clients send status to the server
    [] spawn {
        while {true} do {
            call GFUN(scheduler,sendStatus);
            sleep 5;
        };
    };
};
// all sides measure FPS
[] spawn GFUN(scheduler,measureFPS);
