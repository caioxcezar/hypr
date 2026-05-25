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
	})
	hl.monitor({
		output = "HDMI-A-1",
		mode = "1920x1080@60",
		position = "0x0",
		scale = "1",
	})
elseif HOSTNAME == "B450M" then
	hl.monitor({
		output = "DP-3",
		mode = "2560x1440@180.00Hz",
		position = "0x0",
		scale = "1",
		bitdepth = 10,
		cm = "edid",
	})

	hl.monitor({
		output = "HDMI-A-1",
		mode = "1920x1080@60",
		position = "0x1440",
		scale = "1",
		transform = 0,
	})
end
