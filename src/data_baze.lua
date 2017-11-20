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
function to_pair_form(baze)
    for k, v in ipairs (baze) do
        baze[k] = to_pair(v) 
end end


-- пересчитываем частотные ключи.
function norm_num_key_of(baze)
    local j = 0
    for k, v in ipairs (baze) do
        j = j + v.num
        baze[k].num = j
end end


-- формируем базу для поиска имён.
function make_baze(x)
    local baze = new.File(x).lines()

    to_pair_form(baze)
    norm_num_key_of(baze)

    return baze
end


-- поиск по массиву за log(key)
function find_in(key, baze)
    local i = round(#baze / 2)
    local j = i

    -- локализуем.
    while i > 0 do
        i = round(i/2)
        if baze[j].num > key then
            j = j - i
        elseif baze[j].num < key then
            j = j + i
        else
            return baze[j].name
    end end

    -- откатываемся вверх, если нужно.
    while baze[j].num < key and j < #baze do
        j = j + 1
    end

    -- откатыаемся вниз, если нужно.
    while baze[j].num > key and j > 1 do
        j = j - 1
    end
    return baze[j].name
end
