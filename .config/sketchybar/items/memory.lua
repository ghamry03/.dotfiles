local icons = require("icons")

local memory = sbar.add("item", {
    updates = true,
    position = "right",
    icon = {
        -- style = "Regular",
        -- size = 19.0,
        string = icons.ram,
    },
    -- label = { size = 12.0 },
    update_freq = 5,
})

memory:subscribe({ "forced", "routine", "system_woke" }, function()
    sbar.exec(
    'memory_pressure | grep "System-wide memory free percentage:" | awk \'{printf "%02d", 100-$5}\'',
        function(memoryUsage)
            memory:set({ label = { string = memoryUsage .. "%" }})
        end)
end)
