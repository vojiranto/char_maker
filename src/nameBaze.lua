function new.NameBaze (x)
    local private = {}
    local public  = {}

    private.init = function ()
        private.baze = new.File(x).lines()
        local sum = 0
        for k, v in ipairs (private.baze) do
            local name, num = utf8.match(v, "(.*)	(%d+)")
            sum = sum + num
            private.baze[k] = {
                num  = sum,
                name = name,
            }
        end
    end

    private.find = function (key)
        local i    = round(#private.baze / 2)
        local j    = i
        local rest = #private.baze/2 - round(#private.baze / 2)

        while i > 0 do
            i    =              round(i/2 + rest)
            rest = i/2 + rest - round(i/2 + rest)
        
            if j == 0 then
                return private.baze[1].name
            end

            if private.baze[j].num > key then
                j = j - i
            elseif private.baze[j].num < key then
                j = j + i
            else
                return private.baze[j].name
        end end
        return private.baze[j+1].name
    end

    public.rand = function ()
        return private.find(math.random (1, private.baze[#private.baze].num))
    end

    private.init()
    return copy(public)
end
