#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
        requiredVersion = 1.60;
    };
};

class CfgFunctions {
    class ADDON {
        class public {
            file = QUOTE(FOLDER);
            class initialize {};
        };
    };
};