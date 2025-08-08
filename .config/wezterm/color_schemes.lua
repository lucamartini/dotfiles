local C = {}

function C.add_color_schemes(config)
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
end

return C
