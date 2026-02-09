local wezterm = require("wezterm")

-- local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
-- wezterm.plugin.update_all()

local config = wezterm.config_builder()

-- config.term = "wezterm"

-- config.window_background_image = '/Users/lmartini/.config/wezterm/doom.jpg'
-- config.window_background_image_hsb = {
--   brightness = 0.03,
-- }
config.enable_scroll_bar = true

-- config.color_scheme = 'Everforest Dark (Gogh)'
config.color_scheme = "Dracula (Official)"
-- config.color_scheme = "Catppuccin Latte"
-- config.color_scheme = "rose-pine"
-- config.color_scheme = "rose-pine-dawn"
-- config.color_scheme = "rose-pine-moon"
-- config.color_scheme = "Dracula (Official)"
-- config.color_scheme = "Dracula"
-- config.color_scheme = 'Doom'
-- config.color_scheme = 'Catppuccin Mocha Vibrant'
-- config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'Terminal Basic'

-- local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
-- config.colors = theme.colors()
-- config.window_frame = theme.window_frame()

local color_schemes = require("color_schemes")
color_schemes.add_color_schemes(config)

config.font = wezterm.font({
	family = "FiraCode Nerd Font",
	weight = "Medium",
	harfbuzz_features = { "ss05", "ss03", "ss02", "cv19", "cv23", "cv22" },
})
-- config.font = wezterm.font({
-- 	family = "IosevkaTerm Nerd Font",
-- 	weight = "Medium",
-- 	harfbuzz_features = { "calt=0", "JSPT=1" },
-- })
config.font_size = 12
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.enable_kitty_keyboard = true

local key_bindings = require("key_bindings")
key_bindings.set_key_bindings(config)

wezterm.on("window-config-reloaded", function(window)
	window:toast_notification("wezterm", "configuration reloaded!", nil, 4000)
end)

-- and finally, return the configuration to wezterm
return config
