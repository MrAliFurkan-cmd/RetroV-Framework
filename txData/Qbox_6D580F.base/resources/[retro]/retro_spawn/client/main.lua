local function DoSpawn(model, coords)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(50) end

    SetPlayerModel(PlayerId(), model)
    local ped = PlayerPedId()

    SetPedDefaultComponentVariation(ped)
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
    SetEntityHeading(ped, coords.w)
    FreezeEntityPosition(ped, false)
    SetEntityVisible(ped, true, false)
    SetEntityAlpha(ped, 255, false)
    SetPlayerInvincible(PlayerId(), false)
    ClearPedTasksImmediately(ped)

    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
    DoScreenFadeIn(1000)
end

RegisterNetEvent('retro_spawn:selectCharacterSkin', function()
    DoScreenFadeOut(1000)
    Wait(1000)

    exports['illenium-appearance']:startPlayerCustomization(function(appearance)
        if appearance then
            local model = appearance.model or `mp_m_freemode_01`
            TriggerServerEvent("illenium-appearance:server:saveAppearance", appearance)
            TriggerEvent("retro_spawn:spawnPlayer", model, appearance)
        else
            print("Karakter özelleştirme iptal edildi")
        end
    end, {
        ped = true,
        headBlend = true,
        faceFeatures = true,
        headOverlays = true,
        components = true,
        props = true,
        tattoos = true
    })
end)

RegisterNetEvent('retro_spawn:spawnPlayer', function(model, skin)
    DoScreenFadeOut(1000)
    Wait(1000)

    exports['illenium-appearance']:setPlayerAppearance(skin)
    local coords = Config.DefaultSpawn
    DoSpawn(model, coords)
end)
