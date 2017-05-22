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
