#!/usr/bin/lua5.2
dofile ("./src/files.lua")

function number_of_file_lines(pr, postf, files)
    local i = 0
    for _, file_name in pairs (files) do
        i = i + #lines_from(pr..file_name..postf)
    end
    return i
end

local i = 0
i = i + number_of_file_lines("./src/random/", ".lua",
    {"breast", "elem", "eye_color", "hair_color", "number"})

i = i + number_of_file_lines("./src/patterns/", ".lua",
    {"body_tape", "operations", "patterns"})

i = i + number_of_file_lines("./src/", ".lua",
    {"files", "data_baze", "baze"})

i = i + number_of_file_lines("", ".lua", {"main"})

i = i + number_of_file_lines("./test/", ".lua", {"number_of_lines"})

print (i)
