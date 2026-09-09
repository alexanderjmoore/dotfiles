-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Monitor outputs are defined in variables.lua.

hl.monitor({
	output = MONITOR1,
	mode = "2560x1440@144",
	position = "0x0",
	scale = "1",
})

hl.monitor({
	output = MONITOR2,
	mode = "2560x1440@144",
	position = "2560x0",
	scale = "1",
})
