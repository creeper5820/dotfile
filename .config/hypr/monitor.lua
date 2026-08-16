local BUILTIN = "eDP-1"
local KTC27M1 = "HDMI-A-1"
-- local KTC165HZ = "HDMI-A-1"

-- monitor = KTC165HZ, 1920x1080@200, 0x0, 1, transform, 0
-- workspace = 1, monitor:KTC165HZ
-- workspace = 2, monitor:KTC165HZ
-- workspace = 3, monitor:KTC165HZ
-- workspace = 4, monitor:KTC165HZ

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
