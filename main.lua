#!/usr/bin/lua5.2
math.randomseed(os.time())
dofile ("./src/patterns/patterns.lua")      -- шаблоны персонажей.
dofile ("./src/patterns/operations.lua")    -- операции над шаблонами.

character_print(make_character(mal_pattern))
print ""
for i = 1, 20 do
    character_print(make_character(fem_pattern))
end
