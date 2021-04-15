-- TOML: appearance.toml
-- Repo: glepnir/indent-guides.nvim

require('indent_guides').setup {
  indent_levels = 20, -- the max indent level to detect
  indent_guide_size = 2,
  indent_start_level = 1,

  indent_enable = true,
  indent_tab_guides = true,
  indent_space_guides = true,
  indent_soft_pattern = '\\s',

  exclude_filetypes = {
    'NvimTree',
    'agit',
    'agit_log',
    'agit_stat',
    'dashboard',
    'dashpreview',
    'defx',
    'fzf',
    'help',
    'sagahover',
    'twiggy',
    'vista',
  },

  even_colors = {
    fg = 'NONE',
    bg = '#5e4990',
  },

  odd_colors = {
    fg = 'NONE',
    bg = '#766e91',
  },
}
