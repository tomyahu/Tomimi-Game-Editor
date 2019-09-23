-- A library with common errors to check

-- nilError: any -> None
-- Throws an error if var is nil
function nilError(var, msg)
    if var == nil then
        error(msg)
    end
end