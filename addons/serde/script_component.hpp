#define COMPONENT serde
#include "\z\mis\addons\main\script_mod.hpp"

#define IS_HASHMAP(_value) (typeName _value == "HASHMAP")
#define IS_ARRAY(_value) (typeName _value == "ARRAY")

#define OB_SEPARATOR ((toString [13,10]) + "%%%>")
#define OB_START ("%%%{" + (toString [13,10]))
#define OB_END ((toString [13,10]) + "%%%}")
#define AR_START ("%%%[" + (toString [13,10]))
#define AR_END ((toString [13,10]) + "%%%]")

#define TYPE_TO_STRING(_typeName) (_typeName select [0,2])
