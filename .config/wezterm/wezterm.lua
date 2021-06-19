---@diagnostic disable-next-line unused local
local wezterm = require"wezterm"

local configs = {
  tab_config = require("my_tabs");
  keys_config = require("my_keys");
  font_config = require("my_font");
  color_config = require("my_colors");
}

local config = {}

for _, partial_config in pairs(configs) do
  for k, v in pairs(partial_config) do
    config[k] = v
  end
end

return config
