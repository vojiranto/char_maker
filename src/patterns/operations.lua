dofile ("./src/baze.lua")
dofile ("./src/random/number.lua")  -- генераторы случайных чисел.
dofile ("./src/random/breast.lua")

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
    for k, v in pairs (pat) do
        if k == "ГР" then
            print (k..":", breast_rand(v)) 
        else 
        print (k..":", v - log_randomR (v))
    end end
end
