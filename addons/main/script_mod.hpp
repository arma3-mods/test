#define MAINPREFIX z
#define PREFIX mis

#define TRIPLES(var1,var2,var3) var1##_##var2##_##var3
#define DOUBLES(var1,var2) var1##_##var2
#define QUOTE(var1) #var1

#define ADDON DOUBLES(PREFIX,COMPONENT)

#define FOLDER \MAINPREFIX\PREFIX\addons\COMPONENT

#define VAR(component, var) TRIPLES(PREFIX,component,var)
#define FNC(component, name) TRIPLES(DOUBLES(PREFIX,component),fnc,name)
