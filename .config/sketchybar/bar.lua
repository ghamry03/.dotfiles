local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  height = 30,
  color = colors.bar.bg,
  sticky = true,
  margin = 10,
  padding_right = 10,
  padding_left = 10,
  topmost="window",
  corner_radius=50,
  y_offset = 10,
})
