function new.randomName (x)
    local private = {}
    local public  = {}

    public.init = function ()
        private.names       = new.NameBaze("./data/" .. x.names       .. ".txt")
        private.lastnames   = new.NameBaze("./data/" .. x.lastnames   .. ".txt")
        private.patronymics = new.NameBaze("./data/" .. x.patronymics .. ".txt")
    end

    public.get = function ()
        return private.names.rand() .. " "
            .. private.patronymics.rand() .. " " ..
               private.lastnames.rand()
    end

    return copy(public)
end
