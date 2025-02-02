local wezterm = require("wezterm")
local config = wezterm.config_builder()

---@diagnostic disable-next-line: unused-local
local jetbrains_font = "JetBrains Mono"
---@diagnostic disable-next-line: unused-local
local meslo_font = "MesloLGS Nerd Font Mono"

config = {
  enable_wayland = false,
  automatically_reload_config = true,
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "TITLE | RESIZE",
  window_padding = { left = 5, top = 5, right = 5, bottom = 5 },
  color_scheme = "tokyonight",
  font_size = 11,
  font = wezterm.font(jetbrains_font, { weight = "Regular" }),
}

return config
