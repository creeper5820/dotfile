local tool = require("tool")
local product = tool:read_product()

if product == "A7S" then
	local BUILTIN = "eDP-1"
	local KTC27M1 = "HDMI-A-1"

	hl.monitor({
		output = KTC27M1,
		mode = "2560x1440@144.00",
		position = "1920x0",
		scale = 1.25,
	})

	for i = 1, 9 do
		hl.workspace_rule({ workspace = tostring(i), monitor = KTC27M1 })
	end

	hl.monitor({
		output = BUILTIN,
		mode = "1920x1080@144",
		position = "0x0",
		scale = 1,
	})

	hl.workspace_rule({ workspace = "10", monitor = BUILTIN })
end

if product == "System Product Name" then
	local DP = "DP-1"
	local HDMI = "HDMI-A-2"

	hl.monitor({
		output = DP,
		mode = "1920x1080@100",
		position = "0x0",
		scale = 1,
		transform = 1,
	})

	hl.monitor({
		output = HDMI,
		mode = "1920x1080@100",
		position = "1080x320",
		scale = 1,
	})

	for i = 2, 10 do
		hl.workspace_rule({ workspace = tostring(i), monitor = HDMI })
	end

	hl.workspace_rule({ workspace = "1", monitor = DP })
end
