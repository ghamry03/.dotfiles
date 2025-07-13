local colors = require("colors")

local whitelist = {
    ["Spotify"] = true,
    ["Music"] = true
};

local mediaCover = sbar.add("item", {
    background = {
        image = {
            string = "media.artwork",
            scale = 0.8,
            corner_radius = 8,
        },
        color = colors.transparent,
    },
    label = { drawing = false },
    icon = { drawing = false },
    position = "right",
    updates = true,
})

local mediaArtist = sbar.add("item", {
    position = "right",
    drawing = false,
    padding_left = 3,
    padding_right = 0,
    width = 0,
    icon = { drawing = false },
    label = {
        font = { size = 9 },
        max_chars = 18,
        y_offset = 6,
    },
})

local mediaTitle = sbar.add("item", {
  position = "right",
  drawing = false,
  padding_left = 3,
  padding_right = 0,
  icon = { drawing = false },
  label = {
    font = { size = 11 },
    max_chars = 16,
    y_offset = -5,
  },
})

mediaCover:subscribe("media_change", function(env)
    if whitelist[env.INFO.app] then

        mediaCover:set({
            drawing = env.INFO.state == "playing"
        })

        mediaArtist:set({
            drawing = env.INFO.state == "playing",
            label = { string = env.INFO.artist },
        })

        mediaTitle:set({
            drawing = env.INFO.state == "playing",
            label = { string = env.INFO.title },
        })

    else
        mediaCover:set({ drawing = false })
        mediaArtist:set({ drawing = false })
    end
end)

