local wezterm = require 'wezterm';

local module = {}

wezterm.on("open-uri", function(window, pane, uri)
    local start, match_end = uri:find("hyperfile:");
    if start == 1 then
        local name = uri:sub(match_end+1);
        local start, match_end = name:find(":");
        local lineno = name:sub(match_end+1)
        name = name:sub(1, match_end-1)

        local action = wezterm.action{SpawnCommandInNewWindow={
            args={"nvim", "+"..lineno, name}
        }};
        window:perform_action(action, pane);

        -- prevent the default action from opening in a browser
        return false
    end
end)

function module.apply_to_config(config)
    table.insert(config.hyperlink_rules, {
        regex = "^\\s*[a-zA-Z0-9/_\\-\\. ]+\\.?[a-zA-Z0-9]+:[0-9]+",
        format = "hyperfile:$0"
    })
end

return module
