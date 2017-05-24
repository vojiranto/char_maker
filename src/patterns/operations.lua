dofile ("./src/baze.lua")
dofile ("./src/random/number.lua")  -- генераторы случайных чисел.
dofile ("./src/random/elem.lua")
dofile ("./src/random/breast.lua")
dofile ("./src/patterns/body_type.lua")
dofile ("./src/random/hair_color.lua")

-- изменить патерн
function modify_pat(x, y)
    for k, v in pairs (y) do
        if is_null(x[k]) then
            x[k] = v
        else
            x[k] = x[k] + v
end end end


-- скопировать патерн.
function copy_pat(pat)
    local new = {}
    for k, v in pairs (pat) do
        new[k] = v
    end
    return new
end


-- сумировать патерны.
function sum_pat(x, y)
    local new = {}
    
    -- если нужно суммировать множество патернов.
    if is_table(x) and is_null(y) then
        for _, v in pairs (x) do    
            modify_pat(new, v)
        end
    else
        new = copy_pat(x)
        modify_pat(new, y)
    end
    return new
end

function make_char(pat)
    local char = {}

    char.sex = pat.sex
        -- базовые атрибуты.
    for _, k in pairs ({"St", "Dx", "Ht", "Iq", "Bt"}) do
        char[k] = random_shift_number(pat[k])
    end
    char.hair_color = get_hair_color()
    char.eye_color  = get_eye_color()
    char.Gr         = random_shift_number(pat.Gr, 1.28)
    if char.sex == "mal" then
        char.name = get_mal_name()
    else
        char.name = get_fem_name()

        -- определяем размер груди.
        if char.Gr < 145 then
            char.Br   = breast_rand(pat.Br - 2)
        elseif char.Gr < 155 then
            char.Br   = breast_rand(pat.Br - 1)
        else
            char.Br   = breast_rand(pat.Br)
    end end
    -- эмоции.
    for _, k in pairs ({"FA", "SH"}) do
        char[k] = pat[k]+ log_randomR(3)
    end
    return char
end

-- печать персонажа.
function char_print (char)
    print "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --"
    print (char.name)
    print "Базовые параметры"
    print ("Сила:\t", char.St)
    print ("Ловкость:", char.Dx)
    print ("Здоровье:", char.Ht)
    print ("Интеллект:", char.Iq)

    print ""
    print "Вторичные параметры"
    print ("Цвет волос:", char.hair_color)
    print ("Цвет глаз:",  char.eye_color)
    
    print ("Телосложение:", body_type [char.sex][char.Bt])
    print ("Рост:\t", char.Gr.." см" )
    print ("Вес:\t", get_weight(char.Bt, char.Gr, char.St, char.Br).." кг")
    if char.sex == "fem" then
        print ("Грудь:\t", char.Br)
    end

    print ""
    print "Эмоциональная склонность"
    print ("Страх/Гнев:", char.FA)
    print ("Печаль/Радость:", char.SH)
    print "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --"
end
