-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim
local colors = require('rc.feline.colors')
local signs = require('rc.feline.signs')
local devicons = require('nvim-web-devicons')
local sep = signs.separator
local sep_left = sep.left
local default_sep_left  = signs.default.separator.left
local default_sep_right = signs.default.separator.right
local separators = require('rc.feline.separators')

local buffer = {
  left = {},
  mid = {},
  right = {},
}

local scroll_bar = function()
  local blocks =  {
    '█',
    '▇',
    '▆',
    '▅',
    '▄',
    '▃',
    '▂',
    '▁',
  }
  local width = 2

  local curr_line = vim.fn.line('.')
  local lines = vim.fn.line('$')

  local index = vim.fn.floor(curr_line / lines * (#blocks - 1)) + 1

  return string.rep(blocks[index], width)
end

buffer.scrollbar = {
  provider = scroll_bar,
  hl = {
    fg = colors.black,
    bg = colors.skyblue,
    style = 'bold'
  },
}

buffer.root_path = {
  provider = function()
    return vim.fn.expand('%:~:p:h')
  end,
}
buffer.left.file_path = {
  provider = function()
    local buftype = vim.bo.buftype
    if buftype ~= '' then
      return ''
    end

    local fpath = vim.fn.expand('%:~:p')
    local len_fpath = string.len(fpath)
    local winwidth = vim.fn.winwidth(0)
    if winwidth < len_fpath * 3 then
      fpath = vim.fn.expand('%:t')
    end
    -- Note: modified_icon in the same component means to express in the same highlight.
    return fpath
  end,
  hl = {
    fg = colors.fg,
    bg = colors.bg,
  },
  left_sep = {
    ' ',
  },
}

buffer.filetype_icon = function()
  local extension = vim.fn.expand('%:e')
  local fname = vim.fn.expand('%:t')
  if fname == '' then
    fname = 'unnamed'
  end
  local ft_icon = devicons.get_icon(fname, extension, { default = true })
  return ft_icon
end

buffer.left.filetype_icon = {
  provider = function()
    return buffer.filetype_icon()
  end,
  hl = {
    fg = colors.white,
    bg = colors.bg,
  },
  right_sep = {
    ' ',
    separators.left.rounded_narrow(colors.fg, colors.bg),
    ' ',
    bg = colors.bg, -- Reset bg color in case this component is the last one.
  }
}

buffer.right.filetype_with_icon = {
  provider = function()
    local ft = vim.bo.filetype
    if ft == "" then ft = "NONE" end
    return buffer.filetype_icon() .. " " .. ft
  end,
  hl = {
    fg = colors.white,
    bg = colors.bg,
  },
  left_sep = {
    separators.right.rounded_narrow(colors.fg, colors.bg),
    ' ',
    bg = colors.bg, -- Reset bg color in case this component is the last one.
  },
  right_sep = " ",
}

buffer.modified = function()
  if vim.bo.modified then
    local modified_icon = ''
    -- local modified_icon = ''
    return ' ' .. modified_icon
  end
  return ''
end

buffer.left.modified = {
  enabled = vim.bo.modified == true,
  provider = function()
    return buffer.modified()
  end,
  hl = {
    fg = colors.orange,
    bg = colors.bg,
    -- style = 'bold',
  },
  right_sep = {
    ' ',
    {
      str = default_sep_left,
      hl = {
        fg = colors.fg,
        bg = colors.bg,
      },
    },
    ' ',
    {
      str = '',
      hl = {
        fg = colors.fg,
        bg = colors.bg,
      },
    },
  }
}

buffer.file_name = {
  provider = 'file_info',
  hl = {
    fg = colors.white,
    bg = colors.oceanblue,
    style = 'bold'
  },
  left_sep = {
    ' ',
    {
      str = ' ',
      -- str = sep_left.rounded_broad .. ' ',
      hl = {
        bg = colors.oceanblue,
        fg = colors.bg,
      }
    }
  },
  right_sep = {
    sep_left.rounded_broad,
    ' ',
  }
}

buffer.left.file_size = {
  provider = 'file_size',
  enabled = function()
    return vim.fn.getfsize(vim.fn.expand('%:t')) > 0
  end,
  right_sep = {
    {
      str = default_sep_left,
      hl = {
        fg = colors.fg,
        bg = colors.bg
      },
    },
    ' ',
  }
}

buffer.right.file_size = {
  provider = 'file_size',
  enabled = function()
    return vim.fn.getfsize(vim.fn.expand('%:t')) > 0
  end,
  left_sep = {
    ' ',
    {
      str = default_sep_right,
      hl = {
        fg = colors.fg,
        bg = colors.bg
      }
    },
    ' ',
  }
}

buffer.right.cursor_position = {
  provider = 'position',
  left_sep = {
    ' ',
    {
      str = default_sep_right,
      hl = {
        fg = colors.fg,
        bg = colors.bg
      }
    },
    ' ',
  },
}

buffer.right.line_percentage = {
  provider = 'line_percentage',
  hl = {
    style = 'bold'
  },
  left_sep = {
    ' ',
    {
      str = default_sep_right,
      hl = {
        fg = colors.fg,
        bg = colors.bg,
      },
    },
    ' ',
  },
  right_sep = ' ',
}

buffer.left.file_type = {
  provider = 'file_type',
  hl = {
    fg = colors.white,
    bg = colors.oceanblue,
    style = 'bold'
  },
  left_sep = {
    {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = colors.oceanblue
      }
    },
  },
  right_sep = {
    {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = colors.oceanblue
      }
    },
    {
      str = sep_left.rounded_broad,
      hl = {
        fg = colors.oceanblue,
        bg = colors.bg,
      },
    },
  },
}

function buffer.special_path()
  local ft = vim.bo.filetype
  if ft == 'help' or ft == 'man' then
    return ft .. '://' .. vim.fn.expand('%:t:r')
  elseif ft == 'defx' then
    local cwd = vim.b.defx.path[1] or vim.fn.matchstr(vim.fn.getline(1), '\\f\\+/')
    return 'defx://' .. cwd
  end

  if vim.bo.buftype ~= '' then return '' end

  return vim.fn.expand('%:~:p')
end

buffer.left.special_path = {
  provider = function()
    return buffer.special_path()
  end,
  left_sep = {
    ' ',
  },
  right_sep = {
    ' ',
    {
      str = sep_left.rounded_narrow,
      hl = {
        fg = colors.fg,
        bg = colors.bg,
      },
    },
  }
}

buffer.foldmethod = function ()
  local fdm = vim.wo.foldmethod
  if fdm == 'expr' then
    local fde = vim.wo.foldexpr
    return '%<%(fde=' .. fde:gsub('%(.*%)', '') .. '%)'
  end
  return 'fdm=' .. fdm
end
buffer.right.foldmethod = {
  provider = function()
    return buffer.foldmethod()
  end,
  left_sep = {
    {
      str = default_sep_right,
      hl = {
        fg = colors.fg,
        bg = colors.bg,
      }
    },
    ' ',
  }
}

return buffer
