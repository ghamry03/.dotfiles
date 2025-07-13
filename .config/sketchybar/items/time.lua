local time = sbar.add("item", {
    updates = true,
    update_freq = 30,
    position = "right"
})

time:subscribe({ "forced", "routine", "system_woke" }, function(env)
  time:set({ icon = os.date("%a. %d %b."), label = os.date("%H:%M") })
end)
