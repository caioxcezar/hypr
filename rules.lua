--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	match = { float = true, xwayland = false },
	center = true,
	no_blur = true,
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = { 20, "monitor_h-120" },
	float = true,
})

hl.window_rule({
	name = "browser-pip",
	match = {
		class = "^(waterfox|firefox|app.zen_browser.zen)",
		title = "Picture-in-Picture",
	},
	float = true,
	pin = true,
	move = { "monitor_w - window_w - 10", "monitor_h - window_h - 10" },
	size = { 563, 317 },
	dim_around = false,
})

hl.window_rule({
	name = "dbeaver-focus-error",
	match = { class = "DBeaver", float = true },
	stay_focused = true,
})

hl.window_rule({
	name = "quickshel-no-focus",
	match = { class = "quickshell" },
	no_focus = true,
	no_follow_mouse = true,
})

hl.window_rule({
	name = "ab-downloadmanager-add-float",
	match = { class = "com-abdownloadmanager-desktop-AppKt" },
	float = true,
})

hl.window_rule({
	name = "vesktop-w8",
	match = { class = "vesktop" },
	workspace = 8,
})

hl.window_rule({
	name = "zen-w4",
	match = { class = "app.zen_browser.zen" },
	workspace = 4,
})

hl.layer_rule({
	name = "fix-blur",
	match = { namespace = ".*" },
	ignore_alpha = 0.01,
})

hl.layer_rule({
	name = "quickshell-blur",
	match = { namespace = "(quickshell.*|launcher)" },
	blur = true,
})

hl.layer_rule({
	name = "grim-blur",
	match = { namespace = "selection" },
	blur = false,
})

hl.on("window.open", function(win)
	if win.class == "jetbrains-toolbox" then
		hl.timer(function()
			hl.dispatch(hl.dsp.window.center({ window = win }))
		end, { timeout = 100, type = "oneshot" })
	elseif string.find(win.class, "steam_app") or win.content == "game" then
		hl.dispatch(hl.dsp.window.tag({ tag = "+game", window = win }))
	end
end)

hl.window_rule({ match = { tag = "game", fullscreen = true }, confine_pointer = true })

-- MASTER DUEL START
hl.window_rule({
	name = "untapped-floating-window",
	match = { class = "steam_app_1449850", title = "^(.*Untapped.gg Overlay.*)$" },
	no_blur = true,
})

hl.window_rule({
	name = "masterduel",
	match = { class = "steam_app_1449850", title = "masterduel" },
	render_unfocused = true,
})

-- hl.window_rule({
-- 	name = "masterduel",
-- 	match = { class = "steam_app_1449850", title = "masterduel" },
-- 	float = true,
-- 	stay_focused = false,
-- 	center = true,
-- })

-- -- OVERLAY THAT ONLY WORKS ABOVE THE GAME WINDOW
-- hl.window_rule({
-- 	name = "untapped-floating-window",
-- 	match = { class = "steam_app_1449850", title = "^(.*Untapped.gg Overlay.*)$" },
-- 	float = true,
-- 	pin = true,
-- 	stay_focused = true,
-- 	no_blur = true,
-- 	allows_input = true,
-- })

-- hl.on("workspace.active", function(ws)
-- 	local game = hl.get_window("title:masterduel")
-- 	local overlay = hl.get_window("title:^(.*Untapped.gg Overlay.*)$")

-- 	if game ~= nil and overlay ~= nil then
-- 		if game.workspace.id == ws.id then
-- 			if overlay.pinned == false then
-- 				hl.dispatch(hl.dsp.window.pin({ window = overlay }))
-- 			end

-- 			hl.dispatch(hl.dsp.window.set_prop({ prop = "allows_input", value = "1", window = overlay }))
-- 		else
-- 			if overlay.pinned == true then
-- 				hl.dispatch(hl.dsp.window.pin({ window = overlay }))
-- 			end
-- 			hl.dispatch(hl.dsp.window.move({ window = overlay, workspace = game.workspace, follow = false }))

-- 			hl.dispatch(hl.dsp.window.set_prop({ prop = "allows_input", value = "0", window = overlay }))
-- 		end
-- 	end
-- end)

-- MASTER DUEL END
