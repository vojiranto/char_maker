-- преобразование мужской фамилии в женскую.
function to_femal_surname (surname)
    local rev_surname = string.reverse(surname)
    
    -- меняем окончание.
    if string.find(rev_surname, "[й][и]") == 1 then
        return string.reverse(string.sub (rev_surname, 5)) .. "ая"
    
    -- оставляем неизменным.
    elseif string.find(rev_surname, "[о]") == 1 then
        return surname
    
    -- добавляем окончание.
    else
        return surname.."а"
end end


-- строим по мужскому отчеству женское.
function to_femal_patronymic(patronymic)
    local rev_patronymic = string.reverse(patronymic)
    if string.find(patronymic, "ыч") then
        return string.reverse(string.sub (rev_patronymic, 5)) .. "овна"
    else
        return string.reverse(string.sub (rev_patronymic, 5)) .. "на"
end end
