-- retro_core/server/init.lua
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
    TriggerClientEvent('retro_spawn:checkPlayer', source)
end)
