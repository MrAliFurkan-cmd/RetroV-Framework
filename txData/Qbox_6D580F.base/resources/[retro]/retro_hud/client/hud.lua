local statusValues = {
    hunger = 100,
    thirst = 100,
    stress = 0,
    energy = 100
}

RegisterNetEvent('retro_status:updateHud', function(newStatus)
    statusValues = newStatus
end)

CreateThread(function()
    while true do
        Wait(1000)

        local y = 0.92
        DrawText2D(("🍗 Açlık: %s"):format(statusValues.hunger), 0.015, y, 0.35)
        DrawText2D(("💧 Susuzluk: %s"):format(statusValues.thirst), 0.015, y + 0.025, 0.35)
        DrawText2D(("😵 Stres: %s"):format(statusValues.stress), 0.015, y + 0.050, 0.35)
        DrawText2D(("💤 Enerji: %s"):format(statusValues.energy), 0.015, y + 0.075, 0.35)
    end
end)

function DrawText2D(text, x, y, scale)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 215)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end
