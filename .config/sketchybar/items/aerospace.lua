local colors = require("colors")
local workspaces = { "1", "2", "3", "4", "5" }
local space_items = {}
local current_focused = nil

for _, value in ipairs(workspaces) do
    local space = sbar.add("item", "space_" .. value, {
        position = "left",
        label = { string = value },
        drawing = true,
    })
    space_items[value] = space
end

local test = sbar.add("item", {
    drawing = true,
})

test:subscribe("aerospace_workspace_change", function(env)
    if current_focused and space_items[current_focused] then
        space_items[current_focused]:set({
            label = {
                color = colors.white,
                font = {
                    size = 12.0,
                    style = "Normal"
                }
            }
        })
    end

    if env.FOCUSED_WORKSPACE and space_items[env.FOCUSED_WORKSPACE] then
        space_items[env.FOCUSED_WORKSPACE]:set({
            label = {
                color = colors.green,
                font = {
                    size = 14.0,
                    style = "Bold",
                }
            }
        })
        current_focused = env.FOCUSED_WORKSPACE
    end
end)
