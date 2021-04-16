-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local properties = {
  force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {},
  }
}

properties.force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'defx',
  'fugitive',
  'fugitiveblame',
  'fzf',
  'packer',
  'startify',
  'twiggy',
}

properties.force_inactive.buftypes = {
  'terminal',
}

return properties
