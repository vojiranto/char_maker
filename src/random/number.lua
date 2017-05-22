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

function gr_rand (x)
    local r = math.random() 
    if r < 0.3 then
        return 2
    elseif r < 0.5 then
        return 1
    elseif r < 0.7 then
        return 3
    elseif r < 0.8 then
        return 0
    elseif r < 0.9 then
        return 4
    elseif r < 0.95 then
        return 5
    elseif r < 0.975 then
        return 6
    else
        return 7
end end
