-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- config.color_scheme = 'Dracula'
config.color_scheme = 'Everforest Dark (Gogh)'
-- config.color_scheme = 'Dracula (Gogh)'
-- config.color_scheme = 'Dracula (Official)'
-- config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font = wezterm.font('FiraCode Nerd Font')
config.freetype_load_target = 'Light'
config.font_size = 12.0
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

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
