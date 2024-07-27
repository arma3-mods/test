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
_factions select {!isNil {_x get "side"}}
