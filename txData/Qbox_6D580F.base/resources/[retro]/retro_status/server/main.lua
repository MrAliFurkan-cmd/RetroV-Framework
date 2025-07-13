-- retro_status/server/main.lua

local defaultStatus = {
    hunger = 100,
    thirst = 100,
    stress = 0,
    energy = 100
}

AddEventHandler('QBX:PlayerLoaded', function(player)
    local src = source
    local Player = exports['qbx_core']:GetPlayer(src)
    if not Player then return end

    for status, value in pairs(defaultStatus) do
        Player.Functions.SetMetaData(status, value)
    end

    print(("[retro_status] %s için status başlatıldı."):format(GetPlayerName(src)))
end)

RegisterNetEvent("retro_status:consumeItem", function(type, amount)
    local src = source
    local Player = exports['qbx_core']:GetPlayer(src)
    if not Player then return end

    local current = Player.Functions.GetMetaData(type) or 100
    local newVal = math.min(100, current + amount)

    Player.Functions.SetMetaData(type, newVal)
    print(("[retro_status] %s → %s = %d"):format(GetPlayerName(src), type, newVal))
end)

CreateThread(function()
    while true do
        Wait(60000) -- 60 saniye

        for _, playerId in pairs(GetPlayers()) do
            local Player = exports['qbx_core']:GetPlayer(tonumber(playerId))
            if Player then
                for _, status in pairs({"hunger", "thirst"}) do
                    local current = Player.Functions.GetMetaData(status) or 100
                    local newVal = math.max(0, current - 1)
                    Player.Functions.SetMetaData(status, newVal)
                end
            end
        end
    end
end)
