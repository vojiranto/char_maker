#!/usr/bin/lua5.2
math.randomseed(os.time())
dofile ("./src/patterns/patterns.lua")      -- шаблоны персонажей.
dofile ("./src/patterns/operations.lua")    -- операции над шаблонами.

char_print(make_char(mal_pat))
print ""
for i = 1, 20 do
    char_print(make_char(fem_pat))
end
