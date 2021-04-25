-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local colors = {}

colors.vivid = {
  fg = '#D0D0D0',
  bg = '#1F1F23',

  black = '#1B1B1B',
  white = '#FFFFFF',

  skyblue   = '#50B0F0',
  cyan      = '#009090',
  oceanblue = '#0066cc',
  green     = '#60A040',

  red     = '#D10000',
  magenta = '#C26BDB',
  violet  = '#9E93E8',
  orange  = '#FF9000',
  yellow  = '#E1E120',
}

colors.spring_night = {
  fg = '#fffeeb',
  bg = '#334152',

  black = '#3a4b5c',
  white = '#ffffff',

  skyblue   = '#a8d2eb',
  cyan      = '#88C0D0',
  oceanblue = '#5E81AC',
  green     = '#8FBCBB',

  red     = '#fd8489',
  magenta = '#e7d5ff',
  violet  = '#a9667a',
  orange  = '#f0aa8a',
  yellow  = '#fedf81',
}

setmetatable(colors,{
  __index = colors.spring_night,
})
return colors
