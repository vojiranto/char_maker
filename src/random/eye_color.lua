dofile ("./src/random/number.lua")

rus_eye_color = {
    ["серый"] = 0.5,
    ["карий"] = 0.25,
    ["синий"] = 0.1,
    ["голубой"] = 0.1, 
    ["черный"] = 0.025,
    ["зелёный"] = 0.025}


function get_eye_color()
    return discrete_rand(rus_eye_color)
end
