#!/usr/bin/lua5.3

function dolibs(libs)
    for _, fileName in pairs(libs) do
        dofile("../../libs/" .. fileName .. "/main.lua")
end end

function dofiles (files)
    for _, fileName in pairs(files) do
        dofile("src/".. fileName .. ".lua")
end end

new = {}
dolibs {
    "functions",
    "file",
    "random",
}

dofiles {
    "data_baze",
    "randomName"
}

randomFemalName = new.randomName {
    lastnames   = "lastnames_female",
    names       = "names_female",
    patronymics = "patronymics_female",    
}
randomFemalName.init()

randomMalName   = new.randomName {
    lastnames   = "lastnames_male",
    names       = "names_male",
    patronymics = "patronymics_male",
}
randomMalName.init()

--------------------------------------------------------------------------------
random = new.Random()
random.init()

dofile ("./src/patterns/patterns.lua")      -- шаблоны персонажей.
dofile ("./src/patterns/operations.lua")    -- операции над шаблонами.

character_print(make_character(mal_pattern))
print ""
for i = 1, 20 do
    character_print(make_character(fem_pattern))
end
