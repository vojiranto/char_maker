#!/usr/bin/lua5.1

utf8 = require "lua-utf8"

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
--    "random",
}

dofiles {
    "nameBaze",
    "randomName"
}

randomFemalName = new.randomName {
    lastnames   = "lastnames_female",
    names       = "names_female",
    patronymics = "patronymics_female",    
}

randomMalName   = new.randomName {
    lastnames   = "lastnames_male",
    names       = "names_male",
    patronymics = "patronymics_male",
}

for i = 1, 20 do
    print (randomFemalName.get())
end

for i = 1, 20 do
    print (randomMalName.get())
end
