dofile ("./src/random/number.lua")
dofile ("./src/data_baze.lua")

lastnames_female   = make_baze ("./data/lastnames_female.txt")
lastnames_male     = make_baze ("./data/lastnames_male.txt")
names_female       = make_baze ("./data/names_female.txt")
names_male         = make_baze ("./data/names_male.txt")
patronymics_female = make_baze ("./data/patronymics_female.txt")
patronymics_male   = make_baze ("./data/patronymics_male.txt")

function get_rand_elem(x)
    return find_in(math.random (1, x[#x].num), x)
end

function get_name(names, patronymics, lastnames)
    return  get_rand_elem(names) .. " " ..
            get_rand_elem(patronymics) .. " " ..
            get_rand_elem(lastnames)
end

-- получить мужское имя.
function get_mal_name()
    return get_name (names_male, patronymics_male, lastnames_male)
end

-- получить женское имя
function get_fem_name()
    return get_name (names_female, patronymics_female, lastnames_female)
end
