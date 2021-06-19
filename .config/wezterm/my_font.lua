-- From: wezterm.lua

local wezterm = require"wezterm"

local font_size = 9.0

-- You can ensure current font config running `wezterm ls-fonts`.
local fonts = wezterm.font_with_fallback({
  {
    family = "SFMono Nerd Font Mono",
    weight = "DemiBold",
  };
  "JoyPixels";
  "JetBrains Mono";
  "monospace";
})

local config = {
  font = fonts;
  font_size = font_size;
  line_height = 1.0;
}

return config
