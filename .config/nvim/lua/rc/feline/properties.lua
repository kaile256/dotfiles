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
  'gitcommit',
  'gitrebase',
  'packer',
  'startify',
  'twiggy',
}

properties.force_inactive.buftypes = {
  'acwrite',
  'help',
  'nofile',
  'nowrite',
  'quickfix',
  'terminal',
  'prompt',
}

return properties
