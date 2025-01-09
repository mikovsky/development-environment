local wezterm = require("wezterm")
local config = wezterm.config_builder()

---@diagnostic disable-next-line: unused-local
local jetbrains_font = "JetBrains Mono"
---@diagnostic disable-next-line: unused-local
local meslo_font = "MesloLGS Nerd Font Mono"

config = {
	enable_wayland = false,
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "TITLE | RESIZE",
	color_scheme = "Tokyo Night",
	font_size = 12,
	font = wezterm.font(jetbrains_font, { weight = "Regular" }),
}

return config
