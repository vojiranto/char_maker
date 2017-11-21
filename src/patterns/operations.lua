dofile ("./src/random/breast.lua")
dofile ("./src/patterns/body_type.lua")

function get_hair_color()
    return random.discrete{
        ["чёрный"]            = 0.1,
        ["рыжий"]             = 0.05,
        ["пшеничный"]         = 0.1,
        ["русый"]             = 0.15, 
        ["тёмно-каштановый"]  = 0.4,
        ["светло-каштановый"] = 0.2
    }
end

-- изменить патерн
function modify_pat(x, y)
    for k, v in pairs (y) do
        if x[k] == nil then
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
    if type(x) == "table" and y == nil then
        for _, v in pairs (x) do    
            modify_pat(new, v)
        end
    else
        new = copy_pat(x)
        modify_pat(new, y)
    end
    return new
end

function make_character(pattern)
    local character = {}

    character.sex = pattern.sex
        -- базовые атрибуты.
    for _, k in pairs ({"St", "Dx", "Ht", "Iq", "Bt"}) do
        character[k] = random.shiftNumber(pattern[k])
    end
    character.hair_color = get_hair_color()
    character.eye_color  = get_eye_color()
    character.Gr         = random.shiftNumber(pattern.Gr, 1.28)
    if character.sex == "mal" then
        character.name = randomMalName.get()
    else
        character.name = randomFemalName.get()

        -- определяем размер груди.
        if character.Gr < 145 then
            character.Br   = breast_rand(pattern.Br - 2)
        elseif character.Gr < 155 then
            character.Br   = breast_rand(pattern.Br - 1)
        else
            character.Br   = breast_rand(pattern.Br)
    end end
    -- эмоции.
    for _, k in pairs ({"FA", "SH"}) do
        character[k] = pattern[k]+ random.logR(3)
    end
    return character
end

-- печать персонажа.
function character_print (character)
    print "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --"
    print (character.name)
    print "Базовые параметры"
    print ("Сила:\t", character.St)
    print ("Ловкость:", character.Dx)
    print ("Здоровье:", character.Ht)
    print ("Интеллект:", character.Iq)

    print ""
    print "Вторичные параметры"
    print ("Цвет волос:", character.hair_color)
    print ("Цвет глаз:",  character.eye_color)
    
    print ("Телосложение:", body_type [character.sex][character.Bt])
    print ("Рост:\t", character.Gr.." см" )
    print ("Вес:\t", get_weight(
        character.Bt,
        character.Gr,
        character.St,
        character.Br).." кг")
    if character.sex == "fem" then
        print ("Грудь:\t", character.Br)
    end

    print ""
    print "Эмоциональная склонность"
    print ("Страх/Гнев:", character.FA)
    print ("Печаль/Радость:", character.SH)
    print "-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --"
end
