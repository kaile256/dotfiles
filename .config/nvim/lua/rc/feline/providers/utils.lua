local colors = require('rc.feline.colors')

local utils = {}

utils.reset = {
  provider = '',
  hl = {
    fg = colors.fg,
    bg = colors.bg,
  }
}

return utils
