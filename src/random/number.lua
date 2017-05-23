-- округляем вниз.
function to_int (i)
    return i - i%1
end


-- случайное число.
function random_int (n, x)
    return n - x + math.random (0, x*2)
end


-- [0, x]
function log_random (x)
    return x - to_int (math.log(math.random (1, 2^x), 2))
end



function log_randomD (x)
    return x - 1 - to_int (math.log(math.random (1, 2^x - 1 - 2^(x-2)), 2))
end


-- [-x, x]
function log_randomR (x)
    if math.random() < 0.5 then
        return -log_randomD (x)
    else
        return  log_randomD (x)
end end


function random_shift_number(v)
    return v - log_randomR (v)
end

-- распределение вероятностей по таблице.
function discrete_rand (x)
    local r, l = math.random(), 0
    for k, v in pairs (x) do
        l = l + v
        if r < l then
            return k
end end end
