dofile ("./src/random/number.lua")
dofile ("./src/baze.lua")

body_type = {}
body_type.fem = {
    [1] = "очень худая",
    [2] = "худая",
    [3] = "нормальное",
    [4] = "полная",
    [5] = "толстая"}

body_type.mal = {
    [1] = "очень худой", -- 15
    [2] = "худой",       -- 18
    [3] = "нормальное",  -- 22
    [4] = "полный",      -- 27
    [5] = "толстый"}     -- 32

function get_body_type (pat)
    return body_type [pat.sex] [random_shift_number(pat.Bt)]
end

-- вычисляем вес.
-- v / r^2 = i >=> v ~ i * r^2
function get_weight(i, Gr, St, Br)
    local table = {17, 20, 24, 29, 35}
    Br = def (Br, 0)
    return table[i] * (Gr/100)^2 + 0.15*Br  * ((St/10)^1/3)
end



