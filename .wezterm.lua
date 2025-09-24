local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local action = wezterm.action

config.color_scheme = "Catppuccin Frappe" -- or Mocha, Macchiato, Latte
config.font = wezterm.font {
  family = 'JetBrains Mono',
  weight = 'Medium',
}
config.font_size = 14

config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0.5cell',
  bottom = '0cell'
}
config.default_cursor_style = 'SteadyBlock'


config.window_background_opacity = 0.96
config.macos_window_background_blur = 20
config.send_composed_key_when_left_alt_is_pressed = true

config.max_fps = 60
config.animation_fps = 60
config.front_end = "WebGpu"
config.prefer_egl = true

config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.automatically_reload_config = true

config.keys = {
  { key = 'd', mods = 'CMD|SHIFT', action = action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'd', mods = 'CMD', action = action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'k', mods = 'CMD', action = action.ClearScrollback 'ScrollbackAndViewport' },
  { key = 'w', mods = 'CMD', action = action.CloseCurrentPane { confirm = false } },
  { key = 'w', mods = 'CMD|SHIFT', action = action.CloseCurrentTab { confirm = false } },
  { key = 'LeftArrow', mods = 'CMD', action = action.SendKey { key = 'Home' } },
  { key = 'RightArrow', mods = 'CMD', action = action.SendKey { key = 'End' } },
  { key = 'p', mods = 'CMD|SHIFT', action = action.ActivateCommandPalette },
}

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return config
