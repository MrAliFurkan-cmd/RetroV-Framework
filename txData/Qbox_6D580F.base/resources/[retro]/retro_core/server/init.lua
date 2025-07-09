-- retro_core/server/init.lua

local function giveStartingItems(source, citizenid)
    for _, item in ipairs(Config.DefaultStartingItems) do
        exports.ox_inventory:AddItem(source, item.name, item.amount)
    end
end

RegisterNetEvent("retro_core:playerLoaded", function(playerId)
    local player = exports['qbx_core']:GetPlayer(playerId)
    if not player then return end

    if Config.LogPlayerJoin then
        exports["retro_logs"]:Log("PlayerJoin", string.format(
            "[Giriş] %s sunucuya giriş yaptı. License: %s",
            GetPlayerName(playerId),
            GetPlayerIdentifierByType(playerId, "license")
        ))
    end

    if Config.UseCustomCharacterSelector then
        TriggerEvent("retro_core:handleCharacterJoin", playerId, player)
    end
end)
