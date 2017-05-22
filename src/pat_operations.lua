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
    
    -- если нужно сумировать множество патернов.
    if type (x) == "table" and y == nil then
        for _, v in pairs (x) do    
            modify_pat(new, v)
        end
    else
        new = copy_pat(x)
        modify_pat(new, y)
    end
    return new
end

