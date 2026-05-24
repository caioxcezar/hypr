-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
local function exec_cmd(command, ws)
	if ws == nil then
		ws = "1"
	end
	hl.exec_cmd(command, { workspace = ws .. " silent" })
end

hl.on("hyprland.start", function()
	exec_cmd("xrandr --output DP-3 --primary")
	exec_cmd("hyprctl setcursor bloom 24")
	exec_cmd("awww-daemon")
	exec_cmd("wl-clip-persist --clipboard regular")
	exec_cmd("systemctl --user start hyprpolkitagent")
	exec_cmd("nm-applet")
	exec_cmd("quickshell -d")
	exec_cmd("flatpak run com.github.wwmm.easyeffects -w")
	exec_cmd("steam -silent")
	exec_cmd("ABDownloadManager --background")
	exec_cmd("flatpak run dev.vencord.Vesktop --start-minimized")
end)
