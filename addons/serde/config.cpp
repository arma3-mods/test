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
        class public {
            file = QUOTE(FOLDER);

            class _splitString {};
            class _splitStringDelimited {};
            class serialize {};
            class deserialize {};
            class copy {};

            class _test {};
        };
    };
};
