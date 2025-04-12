local wezterm = require("wezterm")
local config = wezterm.config_builder()

local FONTS = {
  jetbrains = "JetBrains Mono",
  meslo = "MesloLGS Nerd Font Mono",
}

local OS = {
  MACOS = "aarch64-apple-darwin",
  LINUX = "x86_64-unknown-linux-gnu",
}

local THEMES = {
  catppuccin = {
    mocha = "Catppuccin Mocha",
    macchiato = "Catppuccin Macchiato",
    frappe = "Catppuccin Frappé",
  },
  tokyonight = "tokyonight",
  rose_pine = {
    default = "Rosé Pine (Gogh)",
    moon = "Rosé Pine Moon (Gogh)",
  },
}

config.automatically_reload_config = true
config.color_scheme = THEMES.rose_pine.default
config.enable_tab_bar = false
config.font = wezterm.font(FONTS.jetbrains, { weight = "Regular" })
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "TITLE | RESIZE"
config.window_padding = { left = 5, top = 5, right = 5, bottom = 5 }

if wezterm.target_triple == OS.MACOS then
  config.dpi = 144
  config.font_size = 15
end

if wezterm.target_triple == OS.LINUX then
  config.enable_wayland = false
  config.font_size = 12
end

return config
