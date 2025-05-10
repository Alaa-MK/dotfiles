local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	config.color_scheme = "Tokyo Night (Gogh)"

	-- local one_dark = wezterm.color.get_builtin_schemes()["OneDark (base16)"]
	-- one_dark.background = "#232326"
	-- config.color_schemes = {
	-- 	["My OneDark"] = one_dark,
	-- }
	-- config.color_scheme = "My OneDark"

	-- config.color_scheme = "One Light (base16)"

	-- Fonts
	-- tip: run `wezterm ls-fonts --list-system` to list available fonts
	config.font = wezterm.font("JetbrainsMono Nerd Font")
	config.font_size = 15.2

	-- Tab/title bar
	config.enable_tab_bar = false
	config.window_decorations = "RESIZE"

	-- Padding
	config.window_padding = {
		left = 8,
		right = 8,
		top = 18,
		bottom = 0,
	}

	-- Transparent background
	config.window_background_opacity = 0.95
	config.macos_window_background_blur = 100

	-- Maximize on start
	config.initial_cols = 192
	config.initial_rows = 53

	-- Don't ask for confirmation when closing the window
	config.window_close_confirmation = "NeverPrompt"

	-- disable ligatures
	config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

	--
	-- background gradient
	-- config.window_background_gradient = {
	--     -- colors = { '#EEBD89', '#D13ABD' },
	--     colors = { '#222222', '#111111' },
	--     -- Specifices a Linear gradient starting in the top left corner.
	--     orientation = { Linear = { angle = -45.0 } },
	-- }
end

return module
