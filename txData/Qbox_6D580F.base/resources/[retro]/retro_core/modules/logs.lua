RETRO = RETRO or {}
RETRO.Log = {}

function RETRO.Log:Send(title, message, color, category)
    local cat = category or "general"
    local clr = color or "white"

    print(("[LOG-%s] [%s] %s"):format(cat:upper(), title, message))

    -- Eğer Discord log eklenecekse buraya webhook gönderici fonksiyon gelecek
end
