CreateThread(function()
    while true do
        Wait(10000) -- 10 saniyede bir güncelle HUD

        for _, playerId in pairs(GetPlayers()) do
            local Player = exports['qbx_core']:GetPlayer(tonumber(playerId))
            if Player then
                local statusData = {
                    hunger = Player.Functions.GetMetaData("hunger") or 100,
                    thirst = Player.Functions.GetMetaData("thirst") or 100,
                    stress = Player.Functions.GetMetaData("stress") or 0,
                    energy = Player.Functions.GetMetaData("energy") or 100,
                }
                TriggerClientEvent("retro_status:updateHud", tonumber(playerId), statusData)
            end
        end
    end
end)
