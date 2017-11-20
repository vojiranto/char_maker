function new.randomName (x)
    local private = {}
    local public  = {}
    private.getRand = function (x)
        return find_in(math.random (1, x[#x].num), x)
    end
    
    public.init = function ()
        private.names       = make_baze ("./data/" .. x.names       .. ".txt")
        private.lastnames   = make_baze ("./data/" .. x.lastnames   .. ".txt")
        private.patronymics = make_baze ("./data/" .. x.patronymics .. ".txt")
    end
    
    public.get = function ()
        return private.getRand(private.names) .. " "
            .. private.getRand(private.patronymics) .. " " ..
               private.getRand(private.lastnames)
    end
    return copy(public)
end
