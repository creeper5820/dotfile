hl.config({
	debug = {
		disable_logs = false,
	},
})

require("monitor")

hl.on("hyprland.start", function()
	hl.exec_cmd("fcitx5 --replace -d")
	hl.exec_cmd("/usr/bin/flclash")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("LANG=C dms run")
	-- hl.exec_cmd("[workspace 9 silent] linuxqq")
	-- hl.exec_cmd("[workspace 9 silent] /opt/wechat/wechat")
	-- hl.exec_cmd("[workspace 9 silent] /usr/bin/feishu")
end)

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

hl.env("GDK_SCALE", "1")

hl.env("LANG", "zh_CN.UTF-8")

-- SDG MENU
hl.env("XDG_MENU_PREFIX", "arch-")

-- SOME KDE THEME
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("XDG_MENU_PREFIX", "plasma-")

-- CURSOR
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")

-- NVIDIA
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")

-- FCITX5
hl.env("QT_IM_MODULE", "fcitx")
hl.env("GTK_IM_MODULE", "fcitx")
hl.env("XIM", "fcitx")
hl.env("XIM_PROGRAM", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("SDL_IM_MODULE", "fcitx")

-- QT PLATFORM
-- env = QT_QPA_PLATFORM,xcb

-- ELECTRON APP
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- PROXY
hl.env("http_proxy", "http://127.0.0.1:7890")
hl.env("https_proxy", "http://127.0.0.1:7890")
hl.env("all_proxy", "socks5://127.0.0.1:7890")

-- SCREEN-SHOT
hl.env("HYPRSHOT_DIR", "/home/creeper/pictures/screenshots")

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 3,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,

		allow_tearing = false,

		layout = "scrolling",
	},
})

hl.config({
	decoration = {
		rounding = 5,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 4,
			passes = 2,
			vibrancy = 0.1696,
		},
	},
})

hl.layer_rule({
	blur = true,
	match = { namespace = "waybar" },
})

hl.config({
	animations = {
		enabled = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	master = {
		new_status = "slave",
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
		column_width = 0.95,
		direction = "right",
		explicit_column_widths = "0.5, 0.95",
	},
})

hl.config({
	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
		font_family = "JetBrains Mono, WenQuanYi Micro Hei",
	},
})

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:escape",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = -0.5,

		touchpad = {
			disable_while_typing = true,
			natural_scroll = true,
		},
	},
})

hl.config({
	gestures = {
		workspace_swipe_touch = true,
	},
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

hl.device({
	name = "msft0001:00-27c6:01e0-touchpad",
	sensitivity = 0.0,
})

require("keymap")

hl.window_rule({
	name = "feishu-viewer",
	match = {
		class = "^(Feishu|Lark)$",
		title = "^(图片|Photo)$",
	},
	float = true,
	center = true,
})

hl.window_rule({
	name = "qq-viewer",
	match = {
		class = "^(QQ)$",
		title = "^(图片查看器|视频播放器)$",
	},
	float = true,
	center = true,
})
