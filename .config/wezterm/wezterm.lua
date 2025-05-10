-- Pull in the wezterm API
local wezterm = require("wezterm")

-- local panes = require 'panes'
local appearence = require("appearence")
local c_cr = require("c-cr")
local hyperfile = require("hyperfile")

local config = wezterm.config_builder()

config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.keys = {}

-- apply configs
-- TODO: make this loop over all files in the directory
-- panes.apply_to_config(config)
appearence.apply_to_config(config)
c_cr.apply_to_config(config)
hyperfile.apply_to_config(config)

table.insert(config.keys, { key = "F9", mods = "ALT", action = wezterm.action.ShowTabNavigator })

---------------------------------------------------

-- Correctly send the OPTION (ALT) key
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

return config
