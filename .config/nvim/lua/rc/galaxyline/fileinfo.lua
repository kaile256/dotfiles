local condition = require('galaxyline.condition')
local colors = require('rc.galaxyline.colors')

local FileSize = {
  provider = 'FileSize',
  condition = condition.buffer_not_empty,
  highlight = {colors.fg,colors.bg}
}

local FileIcon = {
  provider = 'FileIcon',
  condition = condition.buffer_not_empty,
  highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
}

local FileName = {
  provider = {'FileName'},
  condition = condition.buffer_not_empty,
  highlight = {colors.magenta,colors.bg,'bold'}
}

local LineInfo = {
  provider = 'LineColumn',
  separator = ' ',
  separator_highlight = {'NONE',colors.bg},
  highlight = {colors.fg,colors.bg},
}

local Percent = {
  provider = 'LinePercent',
  separator = ' ',
  separator_highlight = {'NONE',colors.bg},
  highlight = {colors.fg,colors.bg,'bold'},
}

local FileType = {
  provider = 'FileTypeName',
  highlight = 'GalaxyViMode',
}

local BufIcon = {
  provider= 'BufferIcon',
  highlight = {colors.fg,colors.bg}
}

local SFileName = {
  provider =  'SFileName',
  condition = condition.buffer_not_empty,
  highlight = {colors.fg,colors.bg,'bold'}
}

local M = {
  FileSize = {FileSize = FileSize},
  FileIcon = {FileIcon = FileIcon},
  FileName = {FileName = FileName},

  LineInfo = {LineInfo = LineInfo},
  Percent = {Percent = Percent},

  FileType = {FileType = FileType},
  BufIcon = {BufIcon = BufIcon},
  SFileName = {SFileName = SFileName},
}
return M
