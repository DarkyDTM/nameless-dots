hl.config({
	input = {
		kb_layout = "us,ru",
		repeat_delay = 450,
		repeat_rate = 40,
		sensitivity = "+0.4",

		touchpad = {
			natural_scroll = true,
			disable_while_typing = false,
			scroll_factor = 1.25
		}
	}
})

local mods = { '', "SUPER", "CTRL", "SHIFT", "ALT", "CTRL+SUPER", "SUPER+ALT", "SUPER+SHIFT" }

for _, mod in ipairs(mods) do
	hl.gesture({
		fingers = 4,
		direction = "horizontal",
		action = "workspace",
		mods = mod
	})
end
