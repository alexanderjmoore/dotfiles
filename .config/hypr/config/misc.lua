hl.config({
    -- Niri-like horizontal scrolling columns.
    general = {
        layout = "scrolling",
    },
    scrolling = {
        direction = "right",
        column_width = 0.5,
        fullscreen_on_one_column = true,
        focus_fit_method = 1,
        follow_focus = true,
        wrap_focus = false,
        wrap_swapcol = false,
        explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
    },
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
    misc = {
        col = {
            splash = CACHYLGREEN,
        },
        middle_click_paste = false,
        enable_swallow = true,
        swallow_regex = "(kitty|ghostty|[Kk]onsole|Alacritty|gnome-terminal|xfce[0-9]?-terminal)",
        vrr = 3,
    },
    render = {
        direct_scanout = 2,
    },
    xwayland = {
        force_zero_scaling = true
    },
})
