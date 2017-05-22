#!/usr/bin/lua5.2
math.randomseed(os.time())
dofile ("./src/patterns.lua")       -- шаблоны персонажей.
dofile ("./src/random/elem.lua")    -- выбор случайного элемента

print (get_mal_name())
pat_print(mal_pat)

print ""
print (get_fem_name())
pat_print (fem_pat)
