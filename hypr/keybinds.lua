require("aliases")

local DIRECTIONS = { "up", "down", "left", "right" }
local DIRECTIONS_OFFSETS = {
	left = "-1",
	right = "+1",
}
local RESIZE_STEPS = {
	up = { x = 0, y = -15 },
	down = { x = 0,	y = 15 },
	left = { x = -15, y = 0 },
	right = { x = 15, y = 0	}
}

for i = 1, 9 do
	-- Focus to workspace
	bind("SUPER+"..i, focus({workspace=i}))
	-- Move window to workspace
	bind("SUPER+ALT+"..i, window.move({workspace=i}))
end

for _, direction in ipairs(DIRECTIONS) do
	-- Move window to another side
	bind("SUPER+SHIFT+"..direction, window.move({direction=direction}))
	-- Focus to another side
	bind("SUPER+"..direction, focus({direction=direction}))
	-- Resize window
end

for direction, offset in pairs(DIRECTIONS_OFFSETS) do
	-- Focus to next/previous workspace
	bind("CTRL+SUPER+"..direction, focus({workspace=offset}))
	-- Move window to next/previos workspace
	bind("CTRL+SUPER+SHIFT+"..direction, window.move({workspace=offset}))
end

for direction, step in pairs(RESIZE_STEPS) do
	bind("SUPER+ALT+"..direction, window.resize({
		x = step.x,
		y = step.y,
		relative = true
	}))
end

-- Special workspace
bind("SUPER+S", workspace.toggle_special("special"))
bind("SUPER+ALT+S", window.move({workspace="special"}))

-- QuickShell
bind("SUPER+PERIOD", exec(CALL.."launcher emoji"))
bind("SUPER+V", exec(CALL.."launcher clipboard"))
bind("XF86TOOLS", exec(CALL.."launcher toggle"))
bind("SUPER+ALT+SLASH", exec(CALL.."launcher toggle"))
bind("CTRL+ALT+DELETE", exec(CALL.."sessionMenu toggle"))
bind("CTRL+SUPER+R", exec("pkill qs;qs"))

-- Apps
bind("SUPER+T", exec(TELEGRAM_CLIENT))
bind("SUPER+E", exec(FILE_MANAGER))
bind("SUPER+RETURN", exec(TERM))
bind("CTRL+SUPER+W", exec(BROWSER))
bind("CTRL+SHIFT+ESCAPE", exec(TASK_MANAGER))

-- Action with window
bind("SUPER+Q", window.close())
bind("SUPER+F", window.fullscreen({mode="fullscreen"}))
bind("SUPER+D", window.fullscreen({mode="maximized"}))
bind("SUPER+ALT+F", window.fullscreen_state({
	internal = 0,
	client = 2
}))
bind("SUPER+mouse:272", window.drag())
bind("SUPER+mouse:273", window.resize())
bind("CTRL+SUPER+Z", window.kill())
bind("SUPER+ALT+SPACE", window.float())
bind("CTRL+SUPER+SHIFT+Z", exec(SCRIPT.."freezeactive.sh"))

--[[ Zoom
bind("CTRL+SUPER+EQUAL", exec(SCRIPT.."zoom.sh increase 0.25"))
bind("CTRL+SUPER+MINUS", exec(SCRIPT.."zoom.sh decrease 0.25")) ]]

-- Screen shot/record
bind("SUPER+SHIFT+S", exec("grimblast --freeze copy area"))
bind("Print", exec("grimblast copy"))
bind("SUPER+SHIFT+ALT+R", exec(SCRIPT.."record.sh --fullscreen-sound"))
bind("SUPER+ALT+R", exec(SCRIPT.."record.sh --sound"))

-- Display
bind("CTRL+SUPER+A", dsp.dpms())
bind("XF86MonBrightnessUp", exec(SCRIPT.."brightness.sh +"))
bind("XF86MonBrightnessDown", exec(SCRIPT.."brightness.sh -"))

-- Media
bind("SUPER+M", exec("playerctl play-pause"))
bind("XF86AudioRaiseVolume", exec("flock -n /tmp/hypr_raise.lock -c '" ..SCRIPT.. "volume.sh raise 5'"))
bind("XF86AudioLowerVolume", exec("flock -n /tmp/hypr_lower.lock -c '" ..SCRIPT.. "volume.sh lower 5'"))
bind("XF86AudioMute", exec(SCRIPT.."volume.sh reset"))
bind("XF86AudioMicMute", exec(SCRIPT.."volume.sh mute"))
bind("XF86AudioPause", exec("playerctl play-pause"))
bind("XF86AudioPlay", exec("playerctl play-pause"))
bind("XF86AudioNext", exec("playerctl next"))
bind("XF86AudioPrev", exec("playerctl previous"))

-- Switch keyboard layout
bind("SUPER+SPACE", exec("hyprctl switchxkblayout all next"))

-- Misc
bind("SUPER+SHIFT+P", exec("hyprpicker -a"))
bind("SUPER+SHIFT+R", exec(SCRIPT.."share_last_record.sh"))
bind("SUPER+SHIFT+X", exec(SCRIPT.."info_in_notif.sh"))

-- Session
bind("CTRL+SUPER+F", exec("doas poweroff"))
bind("CTRL+SUPER+S", exec("echo mem | doas tee /sys/power/state"))
