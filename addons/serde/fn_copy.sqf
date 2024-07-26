// a deep copy of the dictionary
// this copy is such that deleting a copy does not alter the original
#include "script_component.hpp"

params ["_dictionary", ["_ignore_keys", []]];

private _serialize_single = {
    params ["_key", "_value", "_complete_key", "_copy"];
    _complete_key = _complete_key + [_key];
    if (_complete_key in _ignore_keys) exitWith {};
    if (typeName _value == "HASHMAP") then {
        _copy set [_key, createhashmap];
        {
            [_x, _y, _complete_key, _copy get _key] call _serialize_single;
        } forEach _value;
    } else {
        _copy set [_key, _value];
    };
};

private _copy = createhashmap;
{
    [_x, _y, [], _copy] call _serialize_single;
} forEach _dictionary;
_copy
