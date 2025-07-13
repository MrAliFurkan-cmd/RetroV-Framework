local function giveStartingItems(source, citizenid)
    for _, item in ipairs(Config.DefaultStartingItems) do
        exports.ox_inventory:AddItem(source, item.name, item.amount)
    end
end

return giveStartingItems