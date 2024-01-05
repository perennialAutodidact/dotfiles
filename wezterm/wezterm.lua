local wezterm = require("wezterm")

local config = {}

-- if wezterm.config_builder then
--    config = wezterm.config_builder()
--    return config
-- end

wezterm.log_info("config file " .. wezterm.config_file)

config.keys = {
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
}

config.default_domain = "WSL:Ubuntu"

-- config.color_scheme = 'AdventureTime'
config.color_scheme = "Earthsong (Gogh)"
config.window_background_opacity = 0.9

config.font = wezterm.font_with_fallback({
	"Hack NFM",
	"Fira Code",
})

return config
