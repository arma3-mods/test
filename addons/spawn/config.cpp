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
            class set_type {};
            class drop {};
            class toggle {};
        };

        class public {
            file = QUOTE(FOLDER);

            class update {};
            class set {};
            class delete {};
            class get_type {};
            class get_state {};
            class set_state {};
        };
    };
};
