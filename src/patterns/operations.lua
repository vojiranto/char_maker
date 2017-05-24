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


-- создать персонажа по патерну.
function pat_print (pat)
    print "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --"
    local name
    if pat.sex == "mal" then
        name = get_mal_name()
    else
        name = get_fem_name()
    end
    print (name)
    print "Базовые параметры"
    
    local St = random_shift_number(pat.St)
    print ("Сила:\t", St)
    print ("Ловкость:", random_shift_number(pat.Dx))
    print ("Здоровье:", random_shift_number(pat.Ht))
    print ("Интеллект:", random_shift_number(pat.Iq))

    print ""
    print "Вторичные параметры"
    print ("Цвет волос:", get_hair_color())
    print ("Цвет глаз:",  get_eye_color())
    
    local BT = random_shift_number(pat.Bt)
    print ("Телосложение:", body_type [pat.sex][BT])

    local Gr = random_shift_number(pat.Gr, 1.28)
    print ("Рост:\t", Gr.." см" )
    
    local Br
    if pat.sex == "fem" then
        Br = breast_rand(pat.Br)
    end
    
    print ("Вес:\t", get_weight(BT, Gr, St, Br).." кг")
    if pat.sex == "fem" then
        print ("Грудь:\t", Br)
    end

    print ""
    print "Эмоциональная склонность"
    print ("Страх/Гнев:",     pat.FA + log_randomR(3))
    print ("Печаль/Радость:", pat.SH + log_randomR(3))
    print "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --"
end
