#define ADDON_NAME inventory

#define QUOTE(var1) #var1

#define FOLDER(var1) \z\ADDON_NAME\addons\##var1
#define QFOLDER(var1) QUOTE(FOLDER(var1))

class CfgPatches {
    class ADDON_NAME {
        name = QUOTE(ADDON_NAME);
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
        requiredVersion = 1.60;
    };
};

class CfgFunctions {
    class ADDON_NAME {
        class public {
            file = QFOLDER(main);
            class inventory {};
        };
    };
};
