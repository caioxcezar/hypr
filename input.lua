---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
local rk84 = {
	kb_layout = "us",
	kb_variant = "intl",
	kb_model = "pc105",
	kb_options = "cedilla:cedilla",
}
local kanvas_pro = {
	transform = 0,
	output = "HDMI-A-1",
	left_handed = true,
}

hl.device(Merge({ name = "compx-2.4g-wireless-receiver-keyboard" }, rk84))
hl.device(Merge({ name = "compx-2.4g-wireless-receiver" }, rk84))

hl.device(Merge({ name = "huion-huion-monitor-stylus" }, kanvas_pro))
hl.device(Merge({ name = "huion-huion-monitor" }, kanvas_pro))
