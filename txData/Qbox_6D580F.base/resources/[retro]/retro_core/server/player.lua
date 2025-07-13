local giveStartingItems = require 'server.functions.items'



RegisterNetEvent("retro_core:handleCharacterJoin", function(source, Player)
    local citizenid = Player.PlayerData.citizenid

    -- oyuncunun karakter verileri varsa çek yoksa başlat
    MySQL.query('SELECT * FROM playerskins WHERE citizenid = ? AND active = 1', {
        citizenid
    }, function(result)
        if result and result[1] then
            print(("Oyuncu [%s] mevcut skinle giriş yaptı."):format(citizenid))
            -- karakteri otomatik yükle
        else
            print(("Oyuncu [%s] için karakter oluşturulacak."):format(citizenid))
            -- skin menüsü vs tetiklenebilir
        end
    end)

    -- Başlangıç itemleri ver
    giveStartingItems(source, citizenid)

    -- Oyuncuyu spawn et (en kritik satır!)
    TriggerClientEvent('retro_spawn:checkPlayer', source)
end)