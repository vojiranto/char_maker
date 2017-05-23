dofile ("./src/random/number.lua")
dofile ("./src/files.lua")

-- взятие случайного элемента из списка.
function random_elem(x)
    return x[math.random(1, #x)]
end


-- взятие случайной строчки из файла.
function get_elem_from(x)
    return random_elem(lines_from(x))
end


-- получить мужское имя.
function get_mal_name()
    local mal_name        = get_elem_from("./data/mal_names")
    local mal_patronymic  = get_elem_from("./data/mal_patronymics")
    local mal_surname     = get_elem_from("./data/mal_surnames")
    return mal_name.." "..mal_patronymic.." "..mal_surname
end

-- получить женское имя
function get_fem_name(mal_surname)
    if is_null(mal_surname) then
        mal_surname = get_elem_from("./data/mal_surnames")
    end

    local fem_name        = get_elem_from("./data/norm_fem_names")
    local fem_patronymic  = to_femal_patronymic(
                                get_elem_from("./data/mal_patronymics"))
    return fem_name.." " ..fem_patronymic.." "..to_femal_surname(mal_surname)
end
