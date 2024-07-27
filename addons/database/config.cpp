#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
        requiredVersion = 2.02;
    };
};

class CfgFunctions {
    class ADDON {
        class server {
            file = QUOTE(FOLDER);

            class init {};
        };
    };
};
