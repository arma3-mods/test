// Serializes the dictionary
#include "script_component.hpp"

params ["_dictionary",
    ["_ignore_keys", []],
    ["_object_start", OB_START],
    ["_object_separator", OB_SEPARATOR],
    ["_object_end", OB_END],
    ["_array_start", AR_START],
    ["_array_separator", ","],
    ["_array_end", AR_END]
];

// _complete_key stores the complete key of the element being serialized
// used to ignore elements

private _serialize_single = {
    params ["_key", "_value", "_complete_key"];
    _complete_key = _complete_key + [_key];
    private _result = "";
    if (_complete_key in _ignore_keys) exitWith {
        _result
    };
    call {
        if (typeName _value == "HASHMAP") exitWith {
            private _strings = [];
            {
                private _string = ([_x, _y, _complete_key] call _serialize_single);
                if (_string != "") then {
                    _strings pushBack _string;
                };
            } forEach _value;
            _result = _object_start + (_strings joinString _object_separator) + _object_end;
        };
        if (typeName _value == "ARRAY") exitWith {
            private _strings = [];
            {
                private _string = ([str _forEachIndex, _x, _complete_key] call _serialize_single);
                if (_string != "") then {
                    _strings pushBack _string;
                };
            } forEach _value;
            _result = _array_start + (_strings joinString _array_separator) + _array_end;
        };
        if (typeName _value in ["BOOL", "STRING", "SCALAR", "TEXT"]) exitWith {
            _result = str _value;
        };
        diag_log format ["DICT:serialize(%1):ERROR: value can only be of types %2 (is ""%3"")",
            _complete_key,
            ["HASHMAP", "ARRAY", "BOOL", "STRING", "SCALAR", "TEXT"],
            typeName _value];
    };
    [_key, (typeName _value select [0,2]), _result] joinString ":"
};

private _strings = [];
{
    private _string = ([_x, _y, []] call _serialize_single);
    if (_string != "") then {
        _strings pushBack _string;
    };
} forEach _dictionary;

_object_start + (_strings joinString _object_separator) + _object_end
