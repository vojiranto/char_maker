--  проверка существует ли файл.
function file_exists(file)
    local f = io.open(file, "rb")
    if f then 
        f:close()
    end
    return f ~= nil
end


-- возвращает все строки из файла 
-- вернёт пустой список, если файла нет.
function lines_from(file)
    if not file_exists(file) then
        return {}
    end
    lines = {}
    for line in io.lines(file) do 
        lines[#lines + 1] = line
    end
    return lines
end
