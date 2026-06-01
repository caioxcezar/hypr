-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd("xrandr --output DP-3 --primary")
	hl.exec_cmd("hyprctl setcursor bloom 24")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("wl-clip-persist --clipboard regular")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("blueman-applet -h >/dev/null 2>&1 && blueman-applet")
	hl.exec_cmd("quickshell -d")
	hl.exec_cmd("flatpak run com.github.wwmm.easyeffects -w")
	hl.exec_cmd("steam -silent")
	hl.exec_cmd("ABDownloadManager --background")
	hl.exec_cmd("flatpak run dev.vencord.Vesktop --start-minimized")
	hl.exec_cmd("albert")
end)
