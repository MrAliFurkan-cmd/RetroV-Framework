RETRO = RETRO or {}
local Log = require 'modules/logs'
local Utils = require 'modules/utils'

-- Örnek: oyuncu bağlandığında log atalım
AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local src = source
    deferrals.defer()
    Wait(0)
    deferrals.update("Giriş kontrol ediliyor...")
    
    local license = nil
    for _, id in ipairs(GetPlayerIdentifiers(src)) do
        if string.match(id, "license:") then
            license = id
            break
        end
    end

    if not license then
        deferrals.done("Steam / Rockstar izni bulunamadı.")
        return
    end

    RETRO.Log:Send("Giriş", ("%s sunucuya bağlanıyor. License: %s"):format(name, license), "green", "connection")
    deferrals.done()
end)
