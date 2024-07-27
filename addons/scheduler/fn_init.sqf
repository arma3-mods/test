#include "script_component.hpp"

// number of samples in the moving average of FPS
#define WINDOW_SIZE 12

VAR(scheduler,FPSsamples) = []; // the recent FPS samples of each machine (local)
for "_i" from 0 to WINDOW_SIZE do {
    VAR(scheduler,FPSsamples) pushBack 60;
};

if isServer then {
    // the server stores status of the clients
    VAR(scheduler,workers) = createSimpleObject ["Static", [0, 0, 0]];
    VAR(scheduler,workers) setVariable ["_all", []];
} else {
    // clients send status to the server
    [] spawn {
        while {true} do {
            call FNC(scheduler,sendStatus);
            sleep 5;
        };
    };
};
// all sides measure FPS
[] spawn FNC(scheduler,measureFPS);
