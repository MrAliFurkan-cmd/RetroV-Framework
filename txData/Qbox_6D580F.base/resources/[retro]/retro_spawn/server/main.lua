RegisterNetEvent('retro_spawn:checkPlayer', function()
    local src = source
    local license = nil

    for _, id in ipairs(GetPlayerIdentifiers(src)) do
        if string.match(id, "license:") then
            license = id
            break
        end
    end

    if not license then
        print("License bulunamadı!")
        return
    end

    exports.oxmysql:query('SELECT * FROM playerskins WHERE citizenid = ? AND active = 1', {
        license
    }, function(result)
        if result and result[1] then
            -- Skin mevcut, doğrudan spawn
            TriggerClientEvent('retro_spawn:spawnPlayer', src, result[1].model, result[1].skin)
        else
            -- Skin yok, ilk kez giriyor
            TriggerClientEvent('retro_spawn:selectCharacterSkin', src)
        end
    end)
end)
