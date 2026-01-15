local K = {}

function K.set_key_bindings(config)
	local wezterm = require("wezterm")
	local action = wezterm.action
	local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }

	config.keys = {
		{
			key = "LeftArrow",
			mods = "OPT",
			action = action.SendKey({
				key = "b",
				mods = "ALT",
			}),
		},
		{
			key = "RightArrow",
			mods = "OPT",
			action = action.SendKey({
				key = "f",
				mods = "ALT",
			}),
		},
		{
			key = "LeftArrow",
			mods = "SUPER",
			action = action.SendKey({
				key = "Home",
			}),
		},
		{
			key = "RightArrow",
			mods = "SUPER",
			action = action.SendKey({
				key = "End",
			}),
		},
		-- disable decrease font size to rebind "undo"
		{
			key = "-",
			mods = "CTRL",
			action = action.DisableDefaultAssignment,
		},
		-- Tabs
		{
			key = "w",
			mods = "CMD",
			action = action.CloseCurrentTab({ confirm = false }),
		},
		{
			key = ",",
			mods = "LEADER",
			action = action.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		-- Panes
		{
			key = "v",
			mods = "LEADER",
			action = action.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			key = "s",
			mods = "LEADER",
			action = action.SplitPane({
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{
			key = "x",
			mods = "LEADER",
			action = action.CloseCurrentPane({ confirm = false }),
		},
		-- Make the physical Delete key send "Delete" (CSI 3 ~)
		{ key = "Delete", action = wezterm.action.SendString("\x1b[3~") },
	}

	smart_splits.apply_to_config(config, {
		direction_keys = { "h", "j", "k", "l" },
		modifiers = {
			move = "CTRL",
			resize = "META",
		},
		log_level = "info",
	})
end

return K
