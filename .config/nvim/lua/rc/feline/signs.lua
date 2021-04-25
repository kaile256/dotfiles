-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local signs = {
  separator = {
    symmetry = {},
    left = {},
    right = {},
  },
}

signs.separator.left = {
  triangle_broad = '',
  triangle_narrow = '',

  slant_broad = '',
  slant_narrow = '',

  slant_upper_broad = '',
  slant_upper_narrow = '',

  rounded_broad = '',
  rounded_narrow = '',
}

signs.separator.symmetry = {
  vertical_bar_broad = '┃',
  vertical_bar_narrow = '│',
  block = '█',
  circle = '●',
}

signs.separator.right = {
  triangle_broad  = '',
  triangle_narrow  = '',

  slant_broad  = '',
  slant_narrow  = '',

  slant_upper_broad  = '',
  slant_upper_narrow  = '',

  rounded_broad  = '',
  rounded_narrow  = '',
}

signs.default = {
  separator = {
    left = signs.separator.left.rounded_narrow,
    symmetry = signs.separator.symmetry.vertical_bar_broad,
    right = signs.separator.right.rounded_narrow,
  },
}

return signs
