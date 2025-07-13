-- retro_status/client/main.lua

CreateThread(function()
    while true do
        Wait(15000) -- 15 saniyede bir log

        local hunger = LocalPlayer.state.metadata?.hunger or "N/A"
        local thirst = LocalPlayer.state.metadata?.thirst or "N/A"
        print(("🔹 Hunger: %s | Thirst: %s"):format(hunger, thirst))
    end
end)
