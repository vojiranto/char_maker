#!/usr/bin/lua5.2
math.randomseed(os.time())
dofile ("./src/patterns/patterns.lua")      -- шаблоны персонажей.
dofile ("./src/patterns/operations.lua")    -- операции над шаблонами.

pat_print(mal_pat)
print ""
for i = 1, 20 do
    pat_print(fem_pat)
end
