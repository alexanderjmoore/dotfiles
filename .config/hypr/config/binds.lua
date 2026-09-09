local moveWindow = require("config.move_window")
local mainMod = "SUPER"
local noctCall = "noctalia msg "
local launchPrefix = "uwsm app -- " -- if you are not using UWSM, make this empty (e.g. "")

---------------------------
---- WINDOW MANAGEMENT ----
---------------------------

-- Window manipulation
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprctl kill"), { description = "Select a window to force close" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close the active window" })
hl.bind(mainMod .. " + ALT + Space", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating window" })
hl.bind(mainMod .. " + D", hl.dsp.window.fullscreen({ mode = 1 }), { description = "Toggle maximized window" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(), { description = "Toggle fullscreen" })
hl.bind(mainMod .. " + J", hl.dsp.layout("promote"), { description = "Move window into its own column" })

-- Cycle column widths; Super+J moves a stacked window into its own column.
hl.bind(mainMod .. " + R", hl.dsp.layout("colresize +conf"), { description = "Cycle to next column width" })
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.layout("colresize -conf"), { description = "Cycle to previous column width" })

-- Change focus
hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "left" }), { description = "Focus window to the left" })
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }), { description = "Focus window to the right" })
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }), { description = "Focus window above" })
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }), { description = "Focus window below" })
hl.bind("ALT + Tab", hl.dsp.window.cycle_next(), { description = "Cycle to next window" })
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd(noctCall .. "window-switcher"), { description = "Open window switcher" })

-- Move active window around workspaces & monitors
local moveScrollingWindow = require("config.scrolling_move")
hl.bind(mainMod .. " + SHIFT + Up", moveWindow({ direction = "u" }), { description = "Move window up" })
hl.bind(mainMod .. " + SHIFT + Right", function()
	moveScrollingWindow("r")
end, { description = "Move window right without merging columns" })
hl.bind(mainMod .. " + SHIFT + Left", function()
	moveScrollingWindow("l")
end, { description = "Move window left without merging columns" })
hl.bind(mainMod .. " + SHIFT + Down", moveWindow({ direction = "d" }), { description = "Move window down" })
hl.bind(mainMod .. " + SHIFT + 1", moveWindow({ monitor = MONITOR1 }), { description = "Move window to monitor 1" })
hl.bind(mainMod .. " + SHIFT + 2", moveWindow({ monitor = MONITOR2 }), { description = "Move window to monitor 2" })
hl.bind(mainMod .. " + SHIFT + mouse_up", moveWindow({ monitor = "-1" }), { description = "Move window to previous monitor" })
hl.bind(mainMod .. " + SHIFT + mouse_down", moveWindow({ monitor = "+1" }), { description = "Move window to next monitor" })
hl.bind(mainMod .. " + CONTROL + SHIFT + Up", moveWindow({ monitor = "u" }), { description = "Move window to monitor above" })
hl.bind(mainMod .. " + CONTROL + SHIFT + Right", moveWindow({ monitor = "r" }), { description = "Move window to monitor on the right" })
hl.bind(mainMod .. " + CONTROL + SHIFT + Left", moveWindow({ monitor = "l" }), { description = "Move window to monitor on the left" })
hl.bind(mainMod .. " + CONTROL + SHIFT + Down", moveWindow({ monitor = "d" }), { description = "Move window to monitor below" })
hl.bind(mainMod .. " + CONTROL + SHIFT + mouse_up", moveWindow({ workspace = "m-1" }), { description = "Move window to previous workspace on this monitor" })
hl.bind(mainMod .. " + CONTROL + SHIFT + mouse_down", moveWindow({ workspace = "m+1" }), { description = "Move window to next workspace on this monitor" })

for i = 1, NUM_WPM do
	local key = i % 10
	hl.bind(mainMod .. " + SHIFT + CONTROL + " .. key, moveWindow({ workspace = "m~" .. i }), { description = "Move window to workspace " .. i .. " on this monitor" })
end

-- Move & Resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { description = "Drag window with mouse" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { description = "Resize window with mouse" })

-- Zoom
local function zoomfunction(value)
	local zoomvalue = hl.get_config("cursor:zoom_factor")
	if (zoomvalue + value) > 3.0 then
		hl.config({ cursor = { zoom_factor = 3.0 } })
	elseif (zoomvalue + value) < 1.0 then
		hl.config({ cursor = { zoom_factor = 1.0 } })
	else
		hl.config({ cursor = { zoom_factor = zoomvalue + value } })
	end
end
hl.bind(mainMod .. " + Minus", function()
	zoomfunction(-0.3)
end, { repeating = true, description = "Zoom out" })
hl.bind(mainMod .. " + Plus", function()
	zoomfunction(0.3)
end, { repeating = true, description = "Zoom in" })

--# Zoom with keypad
hl.bind(mainMod .. " + code:82", function()
	zoomfunction(-0.3)
end, { repeating = true, description = "Zoom out" })
hl.bind(mainMod .. " + code:86", function()
	zoomfunction(0.3)
end, { repeating = true, description = "Zoom in" })

------------------
---- LAUNCHER ----
------------------

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(launchPrefix .. TERMINAL), { description = "Open terminal" })
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(launchPrefix .. BROWSER), { description = "Open web browser" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(launchPrefix .. FILE_MANAGER), { description = "Open file manager" })
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(launchPrefix .. EDITOR), { description = "Open text editor" })
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(launchPrefix .. CALCULATOR), { description = "Open calculator" })
hl.bind("XF86Calculator", hl.dsp.exec_cmd(launchPrefix .. CALCULATOR), { description = "Open calculator" })
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(launchPrefix .. BROWSER), { description = "Open web browser" })
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e btop"), { description = "Open system monitor (btop)" })
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(noctCall .. "settings-toggle"), { description = "Toggle Noctalia settings" })
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center"), { description = "Toggle control center" })
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher"), { description = "Toggle app launcher" })
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher /emo"), { description = "Toggle emoji picker" })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(noctCall .. "session lock"), { description = "Lock the screen" })
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd(noctCall .. "panel-toggle session"), { description = "Toggle session and power menu" })

---------------------------
---- HARDWARE CONTROLS ----
---------------------------

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume-up"), { locked = true, repeating = true, description = "Increase volume" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume-down"), { locked = true, repeating = true, description = "Decrease volume" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctCall .. "volume-mute"), { locked = true, description = "Toggle audio mute" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(noctCall .. "mic-mute"), { locked = true, description = "Toggle microphone mute" })

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true, description = "Play or pause media" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true, description = "Play or pause media" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(noctCall .. "media next"), { locked = true, description = "Next media track" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(noctCall .. "media previous"), { locked = true, description = "Previous media track" })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noctCall .. "brightness-up"), { locked = true, repeating = true, description = "Increase brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctCall .. "brightness-down"), { locked = true, repeating = true, description = "Decrease brightness" })

-------------------
---- UTILITIES ----
-------------------

-- Screen Capture
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprpicker -a -n"), { description = "Pick and copy a screen color" })
hl.bind(mainMod .. "+ SHIFT + S", hl.dsp.exec_cmd(noctCall .. "screenshot-region"), { description = "Take a region screenshot" })
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(noctCall .. "screenshot-fullscreen"), { description = "Take a fullscreen screenshot" })

-- Theming and Wallpaper
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(noctCall .. "panel-toggle wallpaper"), { description = "Toggle wallpaper picker" })

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctCall .. "panel-toggle clipboard"), { description = "Toggle clipboard history" })

-- Notifications
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center notifications"), { description = "Toggle notifications panel" })

-- Notes
hl.bind("SUPER + N", hl.dsp.exec_cmd("noctalia msg panel-toggle noctalia/notes:panel"), { description = "Toggle notes panel" })

hl.bind("SUPER + K", hl.dsp.exec_cmd("noctalia msg panel-toggle kenn/keybind-cheatsheet:cheatsheet"), { description = "Toggle keybind cheatsheet" })

-------------------------------
---- WORKSPACES & MONITORS ----
-------------------------------

-- Focus on monitors
hl.bind(mainMod .. " + 1", hl.dsp.focus({ monitor = MONITOR1 }), { description = "Focus monitor 1" })
hl.bind(mainMod .. " + 2", hl.dsp.focus({ monitor = MONITOR2 }), { description = "Focus monitor 2" })

-- Focus on workspace number
-- Absolute
for i = 1, NUM_WPM do
	local key = i % 10
	hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.focus({ workspace = i }), { description = "Focus workspace " .. i })
end
-- Relative
for i = 1, NUM_WPM do
	local key = i % 10
	hl.bind(mainMod .. " + CONTROL + " .. key, hl.dsp.focus({ workspace = "m~" .. i }), { description = "Focus workspace " .. i .. " on this monitor" })
end

-- Move to adjacent workspaces and next empty on a given monitor
hl.bind(mainMod .. " + CONTROL + Right", hl.dsp.focus({ workspace = "m+1" }), { description = "Next workspace on this monitor" })
hl.bind(mainMod .. " + CONTROL + Left", hl.dsp.focus({ workspace = "m-1" }), { description = "Previous workspace on this monitor" })
hl.bind(mainMod .. " + CONTROL + Down", hl.dsp.focus({ workspace = "emptym" }), { description = "Focus empty workspace on this monitor" })

-- Scroll columns with Super; keep Control+Super for workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.layout("focus r"), { description = "Focus column to the right" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.layout("focus l"), { description = "Focus column to the left" })
hl.bind(mainMod .. " + CONTROL + mouse_up", hl.dsp.focus({ workspace = "m-1" }), { description = "Previous workspace on this monitor" })
hl.bind(mainMod .. " + CONTROL + mouse_down", hl.dsp.focus({ workspace = "m+1" }), { description = "Next workspace on this monitor" })

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special(), { description = "Toggle scratchpad workspace" })

-------------------------
---- Keyboard Remaps ----
-------------------------

-- Rebind caps lock to esc
hl.config({
	input = {
		kb_layout = "us",
		kb_options = "caps:escape",
	},
})
