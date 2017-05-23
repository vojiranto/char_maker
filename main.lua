#!/usr/bin/lua5.2
math.randomseed(os.time())
dofile ("./src/patterns/patterns.lua")      -- шаблоны персонажей.
dofile ("./src/random/elem.lua")            -- выбор случайного элемента
dofile ("./src/fem_name_make.lua")          -- преобразование имён в женский род
dofile ("./src/patterns/operations.lua")    -- операции над шаблонами.

print (get_mal_name())
pat_print(mal_pat)

for i = 1, 20 do
    print ""
    print (get_fem_name())
    pat_print (sum_pat(fem_pat, athlete_pat))
end
