-- TOML: appearance.toml
-- Repo: seblj/nvim-tabline

local vim = vim

require('tabline').setup {
  no_name = '[No Name]', -- Name for buffers with no name

  modified_icon = '', -- Icon for showing modified buffer
  -- close_icon = '', -- Icon for closing tab with mouse
  close_icon    = '', -- Icon for closing tab with mouse
  separator     = '▌', -- Separator icon on the left side

  space = 0, -- Padding width
  always_show_tabs = true,
  color_all_icons  = true, -- Color devicons in active and inactive tabs
  right_separator  = true, -- Show right separator on the last tab

  colors = {
    active_background = '#1c1c1c',
    inactive_background = '#121212',

    active_filename = '#eeeeee',
    inactive_filename = '#7f8490',

    active_sep = '#ff6077',
    inactive_sep = '#7f8490',

    active_mod_icon = '#eeeeee',
    inactive_mod_icon = '#7f8490',

    active_close_icon = '#7f8490',
    inactive_close_icon = '#7f8490',

    inactive_devicon = '#7f8490'
  }
}
