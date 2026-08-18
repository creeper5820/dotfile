local kMainMod = "SUPER" -- Sets "Cmd" key as main modifier

local kTerminal = "kitty"
local kFileManager = "nautilus"
local kSetting = "systemsettings"

hl.bind(kMainMod .. " + return", hl.dsp.exec_cmd(kTerminal))
hl.bind(kMainMod .. " + E", hl.dsp.exec_cmd(kFileManager))
hl.bind(kMainMod .. " + D", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind(kMainMod .. " + P", hl.dsp.exec_cmd(kSetting))
hl.bind(kMainMod .. " + Q", hl.dsp.window.close())
hl.bind(kMainMod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind(kMainMod .. " + R", hl.dsp.window.pseudo())
hl.bind(kMainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(kMainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())

hl.bind(kMainMod .. " + TAB", hl.dsp.focus({ monitor = "+1" }))
hl.bind(kMainMod .. " + SHIFT + TAB", hl.dsp.window.move({ monitor = "+1" }))

-- Move focus with main + arrow keys
hl.bind(kMainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(kMainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(kMainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(kMainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with main + [0-9]
-- Move active window to a workspace with main + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10
	hl.bind(kMainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(kMainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(kMainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(kMainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through columns in scroll layout with main + scroll
hl.bind(kMainMod .. " + mouse_down", hl.dsp.layout("move +col"))
hl.bind(kMainMod .. " + mouse_up", hl.dsp.layout("move -col"))

-- Move/resize windows with main + LMB/RMB and dragging
hl.bind(kMainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(kMainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move window
hl.bind(kMainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(kMainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(kMainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(kMainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Scroll layout
hl.bind(kMainMod .. " + period", hl.dsp.layout("move +col"))
hl.bind(kMainMod .. " + K", hl.dsp.layout("move +col"))
hl.bind(kMainMod .. " + comma", hl.dsp.layout("move -col"))
hl.bind(kMainMod .. " + J", hl.dsp.layout("move -col"))
hl.bind(kMainMod .. " + SHIFT + period", hl.dsp.layout("swapcol r"))
hl.bind(kMainMod .. " + SHIFT + K", hl.dsp.layout("swapcol r"))
hl.bind(kMainMod .. " + SHIFT + comma", hl.dsp.layout("swapcol l"))
hl.bind(kMainMod .. " + SHIFT + J", hl.dsp.layout("swapcol l"))

hl.bind(kMainMod .. " + H", hl.dsp.layout("colresize +conf"))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%; pkill -RTMIN+8 waybar"),
	{ repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%; pkill -RTMIN+8 waybar"),
	{ repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle; pkill -RTMIN+8 waybar"),
	{ repeating = true }
)

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { repeating = true })

hl.bind(
	kMainMod .. " + SHIFT + bracketright",
	hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%; pkill -RTMIN+8 waybar"),
	{ repeating = true }
)
hl.bind(
	kMainMod .. " + SHIFT + bracketleft",
	hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%; pkill -RTMIN+8 waybar"),
	{ repeating = true }
)

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true })
hl.bind(kMainMod .. " + bracketright", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true })
hl.bind(kMainMod .. " + bracketleft", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshot
hl.bind(kMainMod .. " + CTRL + R", hl.dsp.exec_cmd("hyprshot --freeze -m region"))
hl.bind(kMainMod .. " + CTRL + W", hl.dsp.exec_cmd("hyprshot --freeze -m window"))
hl.bind(kMainMod .. " + CTRL + O", hl.dsp.exec_cmd("hyprshot --freeze -m output"))

-- Neovide
hl.bind(kMainMod .. " + N", hl.dsp.exec_cmd("neovide"))
