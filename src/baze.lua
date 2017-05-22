function is_null (x)
    return x == nil
end


function is_table (x)
    return type (x) == "table"
end


-- значение по умолчанию.
function def(x, z)
    if is_null (x) then
        return z
    else
        return x
end end
