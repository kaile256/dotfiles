-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local signs = {
  separator = {
    symmetry = {},
    left = {},
    right = {},
  },
}

signs.separator.symmetry = {
  vertical_bar = '┃',
  vertical_bar_thin = '│',
  block = '█',
  circle = '●',
}

signs.separator.right = {
  triangle  = '',
  triangle_thin  = '',

  slant  = '',
  slant_thin  = '',

  slant_upper  = '',
  slant_upper_thin  = '',

  rounded  = '',
  rounded_thin  = '',
}

signs.separator.left = {
  triangle = '',
  triangle_thin = '',

  slant = '',
  slant_thin = '',

  slant_upper = '',
  slant_upper_thin = '',

  rounded = '',
  rounded_thin = '',
}

return signs
