local wezterm = require('wezterm');

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end


config.keys = {
    {
        key = 'r',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ReloadConfiguration,
    },
    {
        key = 't',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain'
    },
}

config.default_domain = 'WSL:Ubuntu'

config.color_scheme = 'AdventureTime'
config.window_background_opacity = 0.8

config.font = wezterm.font_with_fallback({
    'Fira Code',
})


return config
