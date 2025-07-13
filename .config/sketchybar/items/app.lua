local colors = require("colors")

local car = sbar.add("item", {
    position = "center",
    label = {
        string = "Porsche GT3RS",
        font = {
            size = 14,
            style = "Bold",
        }
    },
    drawing = true,
})


-- local appIcon = sbar.add("item", {
--     background = {
--         image = {
--             scale = 0.8,
--             corner_radius = 2,
--         },
--         color = colors.transparent,
--     },
--     position = "center",
--     updates = true,
--     drawing = false,
-- })
--
-- local appName = sbar.add("item", {
--     icon = { drawing = false },
--     position = "center",
--     updates = true,
--     drawing = false
-- })
--
-- appIcon:subscribe("front_app_switched", function(env)
--     if env.INFO then
--         appIcon:set({
--             background = {
--                 image = {
--                     string = "app." .. env.INFO,
--                 },
--             },
--             drawing = true,
--         })
--
--         appName:set({
--             label = {
--                 string = env.INFO,
--             },
--             drawing = true,
--         })
--     else
--         appIcon:set({
--             drawing = false
--         })
--     end
--
-- end)
