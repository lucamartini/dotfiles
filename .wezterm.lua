local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.window_background_image = '/Users/lmartini/misc/doom.jpg'
config.window_background_image_hsb = {
  brightness = 0.03,
}
config.enable_scroll_bar = true

-- config.color_scheme = 'Everforest Dark (Gogh)'
-- config.color_scheme = 'Catppuccin Frappe'
-- config.color_scheme = 'Dracula (Official)'
config.color_scheme = 'Doom'

config.color_schemes = {
  ['Doom'] = {
    foreground = '#f8d488',
    background = '#1a0f0f',
    cursor_bg = '#ff6f1a',
    cursor_fg = '#1a0f0f',
    cursor_border = '#ff6f1a',
    selection_fg = '#5c2a2a',
    selection_bg = '#f8d488',
    ansi = {
      "#1a0f0f", -- black
      "#ff1e1e", -- red
      "#748b4c", -- green
      "#f8d488", -- yellow
      "#3f5f7f", -- blue
      "#d36cab", -- magenta
      "#6b8a85", -- cyan
      "#f1e7dc", -- white
    },
    brights = {
      "#5c2a2a", -- bright black
      "#ff4f4f", -- bright red
      "#9fbf4b", -- bright green
      "#ffe680", -- bright yellow
      "#5f8abf", -- bright blue
      "#f070c0", -- bright magenta
      "#a0dbcd", -- bright cyan
      "#ffffff", -- bright white
    },
    compose_cursor = '#5c2a2a',
  }
}


config.font = wezterm.font('FiraCode Nerd Font')
config.freetype_load_target = 'Light'
config.font_size = 12.0
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.enable_kitty_keyboard = true

local act = wezterm.action

config.keys = {
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
  -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = act.SendKey {
      key = 'b',
      mods = 'ALT',
    },
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = act.SendKey {
      key = 'f',
      mods = 'ALT'
    },
  },
  -- disable decrease font size to rebind "undo"
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

-- and finally, return the configuration to wezterm
return config
