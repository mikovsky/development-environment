local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = {
    enable_wayland = false,
    automatically_reload_config = true,
    enable_tab_bar = false,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    color_scheme = "Tokyo Night",
    font_size = 12,
    font = wezterm.font("MesloLGS Nerd Font Mono", {
        weight = "Regular",
        stretch = "Normal",
        style = "Normal",
    }),
}

return config
