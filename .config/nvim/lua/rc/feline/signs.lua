-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local icons = {
  separator = {
    symmetry = {},
    left = {},
    right = {},
  },
}

icons.separator.left = {
  triangle_broad = '',
  triangle_narrow = '',

  slant_broad = '',
  slant_narrow = '',

  slant_upper_broad = '',
  slant_upper_narrow = '',

  rounded_broad = '',
  rounded_narrow = '',
}

icons.separator.symmetry = {
  vertical_bar_broad = '┃',
  vertical_bar_narrow = '│',
  block = '█',
  circle = '●',
}

icons.separator.right = {
  triangle_broad  = '',
  triangle_narrow  = '',

  slant_broad  = '',
  slant_narrow  = '',

  slant_upper_broad  = '',
  slant_upper_narrow  = '',

  rounded_broad  = '',
  rounded_narrow  = '',
}

icons.default = {
  separator = {
    left = icons.separator.left.rounded_narrow,
    symmetry = icons.separator.symmetry.vertical_bar_broad,
    right = icons.separator.right.rounded_narrow,
  },
}

return icons
