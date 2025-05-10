local helpers = require 'helpers'
local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    helpers.insert_multiple(config.keys, {
    {
        -- Disable the default M-CR keybinding
        key = 'Enter',
        mods = 'OPT',
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        -- Map C-CR to M-CR
        key = 'Enter',
        mods = 'CTRL',
        action = wezterm.action.SendKey { key = 'Enter', mods = 'OPT' },
    },
})
end

return module
