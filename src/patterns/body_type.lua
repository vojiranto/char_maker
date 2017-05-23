dofile ("./src/random/number.lua")

body_type = {}
body_type.fem = {
    [1] = "очень худая",
    [2] = "худая",
    [3] = "нормальное",
    [4] = "полная",
    [5] = "толстая"}

body_type.mal = {
    [1] = "очень худой",
    [2] = "худой",
    [3] = "нормальное",
    [4] = "полный",
    [5] = "толстый"}

function get_body_type (pat)
    return body_type [pat.sex] [random_shift_number(pat.Bt)]
end
