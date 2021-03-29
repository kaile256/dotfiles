local condition = require('galaxyline.condition')
local colors = require('rc.galaxyline.colors')
local icons = require('rc.galaxyline.icons')

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

local Scrollbar = {
  condition = condition.hide_in_width,
  provider = function()
    -- Ref: https://raw.githubusercontent.com/gcavallanti/dotfiles/master/.vimrc
    -- box: '□', '■', '▭',
    -- rectangle: '▬'
    -- hyphen: '―', '⁃', '╍',
    -- vertical: '┇',

    local hidden = '―'
    local revealed = '■'
    local line = vim.fn['noscrollbar#statusline'](20, hidden, revealed)
    local has_margin = line:find(hidden)
    return has_margin and line or ''
  end;
  highlight = 'GalaxyViMode',
}

-- local ScrollbarSep = {
--   -- TODO: Hide separator if scrollbar is hidden.
--   separator = icons.filled_separator_right,
--   separator_highlight = 'GalaxyViModeInv'
-- }

local ColLine = {
  condition = condition.hide_in_width,
  provider = function()
    local line = vim.fn.line('.')
    local col = vim.fn.col('.')
    local col_margin = string.rep(' ', 2 - string.len(col))
    local line_margin = string.rep(' ', math.min(3, string.len(vim.fn.line('$'))) - string.len(line))
    col = col_margin .. col .. 'C'
    line = line_margin .. line .. 'L'
    return col .. ':' .. line
  end;
  highlight = 'GalaxyViMode',
  separator = icons.filled_separator_right,
  separator_highlight = 'GalaxyViModeInv'
}

local BufInfo = {
  FileSize = {FileSize = FileSize},
  FileIcon = {FileIcon = FileIcon},
  FileName = {FileName = FileName},

  LineInfo = {LineInfo = LineInfo},
  Percent = {Percent = Percent},

  FileType = {FileType = FileType},
  BufIcon = {BufIcon = BufIcon},
  SFileName = {SFileName = SFileName},

  Scrollbar = {Scrollbar=Scrollbar},
  ColLine = {ColLine=ColLine},
  -- ScrollbarSep = {ScrollbarSep=ScrollbarSep},
}
return BufInfo
