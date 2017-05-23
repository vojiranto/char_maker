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

-- таблица вероятностей размера груди при разном исходном размере шаблона.
local rand_number = {}
-- распределение для нуля.
rand_number[0] = {
    [0] = 0.4,     [1] = 0.3,  [2] = 0.17, [3] = 0.0875,
    [4] = 0.0325,  [5] = 0.01}

-- распределение для единици.
rand_number[1] = {
    [0] = 0.2,     [1] = 0.4,   [2] = 0.2, [3] = 0.1125,
    [4] = 0.05,    [5] = 0.025, [6] = 0.0125}

-- распределение для двойки.
rand_number[2] = {
    [0] = 0.1125, [1] = 0.2,  [2] = 0.3,   [3] = 0.2,
    [4] = 0.1,    [5] = 0.05, [6] = 0.025, [7] = 0.0125}

-- распределение для тройки.
rand_number[3] = {
    [0] = 0.0625, [1] = 0.1, [2] = 0.2,   [3] = 0.3,
    [4] = 0.2,    [5] = 0.1, [6] = 0.025, [7] = 0.0125}


function gr_rand (x)
    local r, l = math.random(), 0

    for k, v in pairs (rand_number[x]) do
        l = l + v
        if r < l then
            return k
end end end
