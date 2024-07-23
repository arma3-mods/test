// https://community.bistudio.com/wiki/Side
private _side = createHashMapFromArray [
    [0, "east"],
    [1, "west"],
    [2, "guer"],
    [3, "civ"]
];

// get all factions
private _factions = "true" configClasses ( configFile >> "CfgFactionClasses" );
private _factions = _factions apply {
    createHashMapFromArray [
        ["id", configName _x],
        ["side", _side get (getNumber (_x >> "side"))],
        ["name", getText (_x >> "displayName")]
    ]
};
private _factions = _factions select {!isNil {_x get "side"}};

// Recursively calls `inheritsFrom` in a config to build the parents
private _get_tree = {
    params ["_config", ["_container", [], [[]]]];
    if (!isNull _config) then {
        _container pushBack (configName _config);
        [inheritsFrom _config, _container] call _get_tree;
    };
    _container
};

// uses CfgVehicles to build the list of all soldiers and cars
_factions apply {
    private _all = format ["
        (getText (_x >> ""faction"")) == ""%1""
    ", _x get "id"] configClasses (configfile >> "CfgVehicles");

    private _names = _all apply {[_x, _x call _get_tree]};

    private _soldiers = _names select { "CAManBase" in (_x select 1) } apply { _x select 0 };
    private _soldiers = _soldiers apply {
        createHashMapFromArray [
            ["id", configName _x],
            ["name", getText (_x >> "displayName")],
            ["config", _x]
        ]
    };
    _x set ["soldiers", _soldiers];

    private _cars = _names select { "Car" in (_x select 1) } apply { _x select 0 };
    private _cars = _cars apply {
        createHashMapFromArray [
            ["id", configName _x],
            ["name", getText (_x >> "displayName")],
            ["config", _x]
        ]
    };
    _x set ["cars", _cars];

    _x
}
