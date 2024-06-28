-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.colors = {
--	foreground = "#CBE0F0",
--	background = "#011423",
--	cursor_bg = "#47FF9C",
--	cursor_border = "#47FF9C",
--	cursor_fg = "#011423",
--	selection_bg = "#706b4e",
--	selection_fg = "#f3d9c4",
--	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
--	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
--}

config.colors = {
	foreground = "#CBE0F0",
	background = "#1f2127",
	cursor_bg = "#eceff4",
	cursor_border = "#eceff4",
	cursor_fg = "#282828",
	selection_bg = "#eceff4",
	selection_fg = "#4c566a",

	ansi = { "#3b4252", "#bf616a", "#a3be8c", "#ebcb8b", "#81a1c1", "#b48ead", "#88c0d0", "#e5e9f0" },
	brights = { "#4c566a", "#bf616a", "#a3be8c", "#ebcb8b", "#81a1c1", "#b48ead", "#8fbcbb", "#eceff4" },
}

config.font = wezterm.font("MesloLGMDZNerdFontMono")
config.font_size = 11

config.enable_tab_bar = true

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.98
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 0,
}
config.initial_cols = 120
config.initial_rows = 25

-- and finally, return the configuration to wezterm
return config
