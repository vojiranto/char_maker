dofile("./src/files.lua")

-- русские буквы
uppercase_rus_chars = "ЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ"
lowercase_rus_chars = "ёйцукенгшщзхъфывапролджэячсмитьбю"
all_rusChars = "["..uppercase_rus_chars..lowercase_rus_chars.."]"


function to_pair (str)
    local res = {}
        res.num  = string.match(str, "%d+")
        res.name = string.match(str, all_rusChars.."+")
    return res
end


-- разбиваем строчку на имя и число
function to_pair_form(x)
    for k, v in ipairs (x) do
        x[k] = to_pair(v) 
end end


-- пересчитываем частотные ключи.
function norm_num_key_of(x)
    local j = 0
    for k, v in ipairs (baze) do
        j = j + v.num
        baze[k].num = j
end end


-- формируем базу для поиска имён.
function make_baze(x)
    local baze = lines_from(x)

    to_pair_form(baze)
    norm_num_key_of(baze)

    return baze
end

lines = lines_from("./data/name_baze/lastnames_female.txt")

print (to_pair(lines[1000]).name)
print (lines[1000])
