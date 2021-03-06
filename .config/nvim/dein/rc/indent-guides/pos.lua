-- TOML: appearance.toml
-- Repo: glepnir/indent-guides.nvim

require('indent_guides').setup {
  indent_levels = 12, -- the max indent level to detect
  indent_guide_size = 8, -- Max width to indicate indent.
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
    'lspinfo',
    'man',
    'orghelp',
    'sagahover',
    'twiggy',
    -- 'vista',
  },

  even_colors = {
    fg = 'NONE',
    bg = '#596e83',
    -- bg = '#5e4990',
  },

  odd_colors = {
    fg = 'NONE',
    bg = '#425c73',
    -- bg = '#766e91',
  },
}
