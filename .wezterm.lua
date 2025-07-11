local wezterm = require 'wezterm'

local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')

wezterm.plugin.update_all()

local config = wezterm.config_builder()

config.window_background_image = '/Users/lmartini/misc/doom.jpg'
config.window_background_image_hsb = {
  brightness = 0.03,
}
config.enable_scroll_bar = true

-- config.color_scheme = 'Everforest Dark (Gogh)'
-- config.color_scheme = 'Catppuccin Frappe'
config.color_scheme = 'Dracula (Official)'
-- config.color_scheme = 'Doom'
-- config.color_scheme = 'Catppuccin Mocha Vibrant'

config.color_schemes = {
  ['Doom'] = {
    foreground = '#f8d488',
    background = '#1a0f0f',
    cursor_bg = '#ff6f1a',
    cursor_fg = '#1a0f0f',
    cursor_border = '#ff6f1a',
    selection_fg = '#5c2a2a',
    selection_bg = '#f8d488',
    ansi = { "#1a0f0f", "#ff1e1e", "#748b4c", "#f8d488", "#3f5f7f", "#d36cab", "#6b8a85", "#f1e7dc", },
    brights = { "#5c2a2a", "#ff4f4f", "#9fbf4b", "#ffe680", "#5f8abf", "#f070c0", "#a0dbcd", "#ffffff", },
    compose_cursor = '#5c2a2a',
  },
  ["Catppuccin Mocha Vibrant"] = {
    foreground = "#cdd6f4",
    background = "#1e1e2e",
    cursor_bg = "#f5e0dc",
    cursor_border = "#f5e0dc",
    cursor_fg = "#1e1e2e",
    selection_bg = "#585b70",
    selection_fg = "#cdd6f4",
    ansi = { "#45475a", "#f38ba8", "#a6e3a1", "#f9e2af", "#89b4fa", "#f5c2e7", "#94e2d5", "#bac2de" },
    brights = { "#585b70", "#f38ba8", "#a6e3a1", "#f9e2af", "#89b4fa", "#f5c2e7", "#94e2d5", "#a6adc8" },
  },
}


config.font = wezterm.font('FiraCode Nerd Font')
config.freetype_load_target = 'Light'
config.font_size = 12.0
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.enable_kitty_keyboard = true

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }

local act = wezterm.action
config.keys = {
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
  {
    key = 'LeftArrow',
    mods = 'SUPER',
    action = act.SendKey {
      key = 'Home',
    },
  },
  {
    key = 'RightArrow',
    mods = 'SUPER',
    action = act.SendKey {
      key = 'End',
    },
  },
  -- disable decrease font size to rebind "undo"
  {
    key = '-',
    mods = 'CTRL',
    action = act.DisableDefaultAssignment,
  },
  -- Tabs
  {
    key = 'w',
    mods = 'CMD',
    action = act.CloseCurrentTab { confirm = false },
  },
  {
    key = ',',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(
        function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end
      ),
    },
  },
  -- Panes
  {
    key = 'v',
    mods = 'LEADER',
    action = act.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  {
    key = 's',
    mods = 'LEADER',
    action = act.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
    },
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
}

smart_splits.apply_to_config(config, {
  direction_keys = { 'h', 'j', 'k', 'l' },
  modifiers = {
    move = 'CTRL',
    resize = 'META',
  },
  log_level = 'info',
})

wezterm.on('window-config-reloaded', function(window, pane)
  window:toast_notification('wezterm', 'configuration reloaded!', nil, 4000)
end)

-- and finally, return the configuration to wezterm
return config
