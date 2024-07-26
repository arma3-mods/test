// Serializes the dictionary
#include "script_component.hpp"

/*
OB_SEPARATOR = (toString [13,10]) + "%%%>";
OB_START = ("%%%{" + (toString [13,10]));
OB_END = ((toString [13,10]) + "%%%}");
AR_START = ("%%%[" + (toString [13,10]));
AR_END = ((toString [13,10]) + "%%%]");
*/

private _test_copy = {
    private _dict = createhashmapfromarray [
        ["string", "b"],
        ["number", 1],
        ["bool", false],
        ["text", text "b"],
        ["array", [1,"b"]]
    ];

    private _copy = _dict call mis_serde_fnc_copy;
    private _is_copy = _copy isEqualTo _dict;
    _copy set ["string", "c"];
    _is_copy && {_dict get "string" isEqualTo "b"}
};

private _test_serialize = {
    private _dict = createhashmapfromarray [
        ["string", "b"],
        ["number", 1],
        ["bool", false],
        ["text", text "b"],
        ["array", [1,"b"]]
    ];
    private _string = _dict call mis_serde_fnc_serialize;
    private _expected = format["%2bool:BO:false%1string:ST:""b""%1text:TE:b%1array:AR:%4:SC:1,1:ST:""b""%5%1number:SC:1%3",
        OB_SEPARATOR, OB_START, OB_END, AR_START + "0", AR_END];
    _string isEqualTo _expected
};

private _test_roundtrip = {
    private _dict = createhashmapfromarray [
        ["string", "b"],
        ["number", 1],
        ["bool", false],
        ["text", text "b"],
        ["array", [1,"b"]],
        ["obj", createhashmapfromarray [
            ["a", "a"]
        ],
        ["a,b", "a,b"],
        ["b", "b"],
        ["empty_array", [[],[]]]]
    ];

    private _string = _dict call mis_serde_fnc_serialize;
    private _dict1 = _string call mis_serde_fnc_deserialize;
    _dict isequalto _dict1
};

private _test_serialize_ignore = {
    private _dict = createhashmapfromarray [
        ["a", "a"],
        ["b", "b"]
    ];

    private _string1 = _dict call mis_serde_fnc_serialize;
    private _result1 = _string1 isEqualTo format["%2a:ST:""a""%1b:ST:""b""%3", OB_SEPARATOR, OB_START, OB_END];

    // ignoring "a" should result in "b" only
    private _string2 = [_dict, [["a"]]] call mis_serde_fnc_serialize;
    (_string2 isEqualTo format["%1b:ST:""b""%2", OB_START, OB_END]) and _result1
};

private _test_serialize_obj = {
    private _dict = createhashmapfromarray [
        ["obj", createhashmapfromarray [["a", 1]]]
    ];

    private _string = _dict call mis_serde_fnc_serialize;
    _string isEqualTo format["%1obj:HA:%1a:SC:1%2%2", OB_START, OB_END]
};

DICT_tests = createhashmapfromarray [
    ["copy", _test_copy],
    ["test_serialize", _test_serialize],
    ["test_serialize_ignore", _test_serialize_ignore],
    ["test_serialize_obj", _test_serialize_obj]
];

hint "running tests..";

DICT_results = [];
{
    [_x, _y] call {
        params ["_name", "_test"];
        private _result = call _test;
        if (isNil "_result") then {
            _result = false;
        };
        diag_log format ["Test %1: %2", _name, ["FAILED", "PASSED"] select _result];
        DICT_results pushBack [_name, _result];
    };
} forEach DICT_tests;

private _results = +DICT_results;

DICT_tests = nil;
DICT_results = nil;

hint format ["results: %1", _results];
_results
