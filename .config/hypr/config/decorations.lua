-- Compositor appearance; shell and app themes are managed by Noctalia.
local colors = require("config.colors")

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 8,
        border_size = 2,
        extend_border_grab_area = 10,
        resize_on_border = true,
        col = {
            active_border = {
                colors = { colors.primary, colors.secondary },
                angle = 45,
            },
            inactive_border = colors.outline,
        },
    },
    group = {
        col = {
            border_active = colors.secondary,
            border_inactive = colors.outline,
            border_locked_active = colors.surface_variant,
            border_locked_inactive = colors.outline,
        },
        groupbar = {
            col = {
                active = colors.primary,
                inactive = colors.outline,
                locked_active = colors.surface_variant,
                locked_inactive = colors.outline,
            },
        },
    },
    decoration = {
        dim_special = 0.3,
        rounding = 10,
        active_opacity = 0.95,
        inactive_opacity = 0.85,
        fullscreen_opacity = 1,
        blur = {
            size = 5,
            passes = 4,
            special = true,
        },
    },
})
