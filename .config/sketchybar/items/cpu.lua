local icons = require("icons")

local cpu = sbar.add("item", {
    updates = true,
    position = "right",
    icon = {
        -- style = "Regular",
        -- size = 19.0,
        string = icons.cpu,
    },
    -- label = { size = 12.0 },
    update_freq = 5,
})

cpu:subscribe({ "forced", "routine", "system_woke" }, function()
    sbar.exec(
        'top -l 1 | grep -o "CPU usage: .*%" | cut -d" " -f3 | cut -d"%" -f1 | cut -d"." -f1 | awk \'{printf "%02d", $1}\'',
        function(cpuUsage)
            cpu:set({ label = { string = cpuUsage .. "%" }})
        end)
end)
