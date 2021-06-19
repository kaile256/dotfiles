-- From: wezterm.lua

local wezterm = require"wezterm"

local send_keys = function(key_sequence)
  return wezterm.action({ SendString = key_sequence })
end

local keys = {
  { key=",", mods="CTRL", action=send_keys("\x1b[44;5u"), };
  { key=".", mods="CTRL", action=send_keys("\x1b[46;5u"), };

  { key=";", mods="CTRL", action=send_keys("\x1b[59;5u"), };
  { key=":", mods="CTRL", action=send_keys("\x1b[58;5u"), };
}

local config = {
  keys = keys;

  disable_default_key_bindings = true;
  send_composed_key_when_left_alt_is_pressed  = true;
  send_composed_key_when_right_alt_is_pressed = true;
}

return config
