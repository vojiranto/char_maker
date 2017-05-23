dofile ("./src/random/number.lua")

body_type = {}
body_type.fem = {
    [1] = "Очень худая",
    [2] = "Худая",
    [3] = "Нормальное",
    [4] = "Полная",
    [5] = "Толстая"}

body_type.mal = {
    [1] = "Очень худой",
    [2] = "Худой",
    [3] = "Нормальное",
    [4] = "Полный",
    [5] = "Толстый"}

function get_body_type (pat)
    return body_type [pat.sex] [random_shift_number(pat.Bt)]
end
