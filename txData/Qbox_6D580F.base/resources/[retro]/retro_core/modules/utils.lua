RETRO = RETRO or {}
RETRO.Utils = {}

function RETRO.Utils:DumpTable(tbl, indent)
    indent = indent or 0
    local toprint = string.rep(" ", indent) .. "{\n"
    indent = indent + 2 
    for k, v in pairs(tbl) do
        toprint = toprint .. string.rep(" ", indent)
        toprint = toprint .. "[" .. tostring(k) .. "] = "
        if type(v) == "table" then
            toprint = toprint .. RETRO.Utils:DumpTable(v, indent + 2) .. ",\n"
        else
            toprint = toprint .. tostring(v) .. ",\n"
        end
    end
    toprint = toprint .. string.rep(" ", indent - 2) .. "}"
    return toprint
end
