local wezterm = require 'wezterm'

local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

resurrect.state_manager.set_encryption({
  enable = true,
  method = "/opt/homebrew/bin/age",
  private_key = "/Users/lmartini/misc/key.txt",
  public_key = "age1v0theen093lj3muxdxtp857ehenr8v3wx70hzetc0cpsgp0u85wqanq3w5",
})
resurrect.state_manager.periodic_save({
    interval_seconds = 300,
    save_tabs = true,
    save_windows = true,
    save_workspaces = true,
})
resurrect.state_manager.set_max_nlines(5000)

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

config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 2000 }
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

local act = wezterm.action
config.keys = {
  {
    key = 'w',
    mods = 'CMD',
    action = act.CloseCurrentTab { confirm = false },
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
  -- Vertical split
  {
    key = 'v',
    mods = 'LEADER',
    action = act.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  -- Horizontal split
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

    {
    key = 'Space',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'Space', mods = 'CTRL' },
  },

   {
    key = "s",
    mods = "CTRL|ALT",
    action = wezterm.action_callback(function(win, pane)
        resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
      end),
  },
   {
    key = "r",
    mods = "CTRL|ALT",
    action = wezterm.action_callback(function(win, pane)
      resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
        local type = string.match(id, "^([^/]+)") -- match before '/'
        id = string.match(id, "([^/]+)$") -- match after '/'
        id = string.match(id, "(.+)%..+$") -- remove file extention
        local opts = {
          close_open_tabs = true,
          window = pane:window(),
          on_pane_restore = resurrect.tab_state.default_on_pane_restore,
          relative = true,
          restore_text = false,
        }
        if type == "workspace" then
          local state = resurrect.state_manager.load_state(id, "workspace")
          resurrect.workspace_state.restore_workspace(state, opts)
        elseif type == "window" then
          local state = resurrect.state_manager.load_state(id, "window")
          resurrect.window_state.restore_window(pane:window(), state, opts)
        elseif type == "tab" then
          local state = resurrect.state_manager.load_state(id, "tab")
          resurrect.tab_state.restore_tab(pane:tab(), state, opts)
        end
      end)
    end),
  },
}

smart_splits.apply_to_config(config, {
  -- directional keys to use in order of: left, down, up, right
  direction_keys = { 'h', 'j', 'k', 'l' },

  -- modifier keys to combine with direction_keys
  modifiers = {
    move = 'CTRL', -- modifier to use for pane movement, e.g. CTRL+h to move left
    resize = 'META', -- modifier to use for pane resize, e.g. META+h to resize to the left
  },
  -- log level to use: info, warn, error
  log_level = 'info',
})

local resurrect_event_listeners = {
  "resurrect.error",
}
for _, event in ipairs(resurrect_event_listeners) do
  wezterm.on(event, function(...)
    local args = { ... }
    local msg = event
    for _, v in ipairs(args) do
      msg = msg .. " " .. tostring(v)
    end
    wezterm.gui.gui_windows()[1]:toast_notification("Wezterm - resurrect", msg, nil, 4000)
  end)
end

-- and finally, return the configuration to wezterm
return config
