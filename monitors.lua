------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
if HOSTNAME == "R732512AI-15" then
	hl.monitor({
		output = "eDP-1",
		mode = "1920x1080@60",
		position = "-1920x0",
		scale = "1",
		cm = "auto",
	})
	hl.monitor({
		output = "HDMI-A-1",
		mode = "1920x1080@60",
		position = "0x0",
		scale = "1",
		cm = "auto",
	})
elseif HOSTNAME == "B450M" then
	hl.monitor({
		output = "DP-3",
		mode = "2560x1440@180",
		position = "0x0",
		scale = "1",
		bitdepth = 8,
		supports_hdr = 1,
		vrr = 1,
		cm = "auto",
		supports_wide_color = 1,
		sdr_max_luminance = 80,
		max_luminance = 600,
	})

	hl.monitor({
		output = "HDMI-A-1",
		mode = "1920x1080@60",
		position = "0x1440",
		scale = "1",
		bitdepth = 8,
		transform = 0,
		cm = "srgb",
	})
end
