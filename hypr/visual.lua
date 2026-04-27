hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		col = {
			active_border = "rgba(89b4faff)", "rgba(89dcebff)"
		},
		layout = "dwindle",
		resize_on_border = false,
		allow_tearing = true,
},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		close_special_on_empty = false,
		middle_click_paste = false
	},

	cursor = {
		zoom_detached_camera = false
	},

	dwindle = {
		preserve_split = false,
		smart_split = false,
		smart_resizing = false
	},

	xwayland = {
		force_zero_scaling = true
	},

	ecosystem = {
		no_donation_nag = true
	},

	decoration = {
		blur = {
			enabled = true,
			xray = true,
			new_optimizations = true,
			size = 21,
			passes = 3
		}
	},

	animations = {
		enabled = false
	}
})
