dofile ("./src/baze.lua")

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


-- [-x, x]
function log_randomR (x, b)
    local log_randomD = function (x, b)
        return x - 1 - to_int (math.log(math.random (1, b^x - 1 - b^(x-b)), b))
    end

    b = def(b, 2)
    if math.random() < 0.5 then
        return -log_randomD (x, b)
    else
        return  log_randomD (x, b)
end end


function random_shift_number(v, b)
    b = def(b, 2)
    return v - log_randomR (v, b)
end

-- распределение вероятностей по таблице.
function discrete_rand (x)
    local r, l = math.random(), 0
    for k, v in pairs (x) do
        l = l + v
        if r < l then
            return k
end end end
