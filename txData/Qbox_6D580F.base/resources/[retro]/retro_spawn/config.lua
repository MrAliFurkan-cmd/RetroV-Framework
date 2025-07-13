Config = {}

-- İlk spawn noktası
Config.DefaultSpawn = vector4(-1037.6, -2737.8, 20.17, 329.64) -- örnek: havalimanı

-- İlk kıyafet seti (illenium appearance formatında)
Config.DefaultClothing = {
    model = "mp_m_freemode_01",
    components = {
        { component_id = 3, drawable = 15, texture = 0 },
        { component_id = 4, drawable = 14, texture = 0 },
        { component_id = 6, drawable = 1, texture = 0 },
        { component_id = 8, drawable = 15, texture = 0 },
        { component_id = 11, drawable = 5, texture = 0 },
    }
}
