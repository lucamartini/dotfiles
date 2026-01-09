local wezterm = require 'wezterm'

-- local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
-- wezterm.plugin.update_all()

local config = wezterm.config_builder()

config.window_background_image = '/Users/lmartini/.config/wezterm/doom.jpg'
config.window_background_image_hsb = {
  brightness = 0.03,
}
config.enable_scroll_bar = true

-- config.color_scheme = 'Everforest Dark (Gogh)'
-- config.color_scheme = 'Catppuccin Frappe'
config.color_scheme = 'Dracula (Official)'
-- config.color_scheme = 'Doom'
-- config.color_scheme = 'Catppuccin Mocha Vibrant'

local color_schemes = require 'color_schemes'
color_schemes.add_color_schemes(config)

config.font = wezterm.font('FiraCode Nerd Font')
config.freetype_load_target = 'Light'
config.font_size = 14.0
config.line_height = 1.2
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.enable_kitty_keyboard = true

local key_bindings = require 'key_bindings'
key_bindings.set_key_bindings(config)

wezterm.on('window-config-reloaded', function(window, pane)
  window:toast_notification('wezterm', 'configuration reloaded!', nil, 4000)
end)

-- and finally, return the configuration to wezterm
return config
