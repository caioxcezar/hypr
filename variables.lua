---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
Terminal = "foot"
FileManager = "nautilus"
Menu = "albert toggle"

local vga = string.lower(RunCommand("lspci | grep -i 'vga\\|3d\\|display'"))
local nautilus = Trim(RunCommand("whereis -b dolphin | cut -d: -f2-"))

HOSTNAME = Trim(RunCommand("cat /etc/hostname"))
NVIDIA = string.find(vga, "nvidia")
AMD = string.find(vga, "amd")
KDE = nautilus ~= ""

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "bloom")
hl.env("GDK_BACKEND", "wayland,x11")

hl.env("PROTON_ENABLE_WAYLAND", "1")
hl.env("PROTON_USE_NTSYNC", "1")
hl.env("PROTON_ENABLE_HDR", "1")
hl.env("WAYLANDDRV_PRIMARY_MONITOR", "DP-3")

if KDE then
	hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
	hl.env("QT_QPA_PLATFORM", "wayland;xcb")
	hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
	hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
	hl.env("XDG_MENU_PREFIX", "arch-")
end

if NVIDIA then
	hl.env("LIBVA_DRIVER_NAME", "nvidia")
	hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
	hl.env("PROTON_ENABLE_NVAPI", "1")
	hl.env("PROTON_DLSS_UPGRADE", "1")
end
