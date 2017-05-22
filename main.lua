#!/usr/bin/lua5.2
math.randomseed(os.time())
dofile ("./src/random/number.lua")  -- генераторы случайных чисел.
dofile ("./src/patterns.lua")       -- шаблоны персонажей.
dofile ("./src/random/elem.lua")
dofile ("./src/fem_name_make.lua")
dofile ("./src/pat_operations.lua")

-- выбираем имя.
mal_name        = get_elem_from("./data/mal_names")
mal_patronymic  = get_elem_from("./data/mal_patronymics")
mal_surname     = get_elem_from("./data/mal_surnames")
print (mal_name.." "..mal_patronymic.." "..mal_surname)
for k, v in pairs (sum_pat{mal_pat, mag_pat, athlete_pat}) do
    print (k..":", v - log_randomR (v))
end

print ""

fem_name        = get_elem_from("./data/fem_names")
fem_patronymic  = to_femal_patronymic(get_elem_from("./data/mal_patronymics"))
print (fem_name.." " ..fem_patronymic.." "..to_femal_surname(mal_surname))
for k, v in pairs (fem_pat) do
    print (k..":", v - log_randomR (v))
end

