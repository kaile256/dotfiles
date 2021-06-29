---@diagnostic disable-next-line unused local
local wezterm = require"wezterm"

local config = {
  window_close_confirmation = "NeverPrompt";

  ---  enable_tab_bar = false;
  hide_tab_bar_if_only_one_tab = true;

  tab_bar_at_bottom = true;
}

return config
