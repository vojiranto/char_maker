#!/usr/bin/lua5.2
math.randomseed(os.time())
dofile ("./src/patterns/patterns.lua")      -- шаблоны персонажей.
dofile ("./src/random/elem.lua")            -- выбор случайного элемента
dofile ("./src/fem_name_make.lua")          -- преобразование имён в женский род
dofile ("./src/patterns/operations.lua")    -- операции над шаблонами.


pat_print(mal_pat)
pat_print(fem_pat)

l = [1,2,3,4]
print (#l % 2)
