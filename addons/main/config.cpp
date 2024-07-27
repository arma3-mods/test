#include "script_component.hpp"

class CfgMods {
    class ADDON {
        dir = "@mis";
        name = "mis";
    };
};

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
        requiredVersion = 1.60;
    };
};
