-- From: wezterm.lua

local wezterm = require"wezterm"

local send_keys = function(key_sequence)
  return wezterm.action({ SendString = key_sequence })
end

-- Get keycodes by `showkey -a`
-- Modifiers: (http://www.leonerd.org.uk/hacks/fixterms/)
-- S: 2u | M: 3u | M-S: 4u | C: 5u | C-S: 6u | C-M: 7u | C-M-S: 8u
local keys = {
  { key="0", mods="CTRL", action=send_keys("\x1b[48;5u"), };

  { key=",", mods="CTRL", action=send_keys("\x1b[44;5u"), };
  { key=".", mods="CTRL", action=send_keys("\x1b[46;5u"), };

  { key=";", mods="CTRL", action=send_keys("\x1b[59;5u"), };
  { key=":", mods="CTRL", action=send_keys("\x1b[58;5u"), };

  { key="-", mods="CTRL", action=send_keys("\x1b[45;5u"), };
  { key="+", mods="CTRL", action=send_keys("\x1b[43;5u"), };
  { key="=", mods="CTRL", action=send_keys("\x1b[61;5u"), };
  { key="_", mods="CTRL", action=send_keys("\x1b[95;5u"), };

  { key=" ", mods="SHIFT",      action=send_keys("\x1b[32;2u") }; -- <S-Space>
  { key=" ", mods="CTRL|SHIFT", action=send_keys("\x1b[32;6u") }; -- <C-S-Space>

  { key="Enter", mods="SHIFT", action=send_keys("\x1b[13;2u") }; -- <S-CR>
  { key="Enter", mods="CTRL",  action=send_keys("\x1b[13;5u") }; -- <C-CR>
}

local config = {
  keys = keys;

  disable_default_key_bindings = true;
  send_composed_key_when_left_alt_is_pressed  = true;
  send_composed_key_when_right_alt_is_pressed = true;
}

return config
