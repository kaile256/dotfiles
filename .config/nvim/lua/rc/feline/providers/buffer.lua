-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim
local colors = require('rc.feline.colors')
local signs = require('rc.feline.signs')
local devicons = require('nvim-web-devicons')
local sep = signs.separator
local sep_left = sep.left
local default_sep_left = sep_left.rounded_narrow

local buffer = {}

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

buffer.file_path = {
  provider = function(component)
    local buftype = vim.bo.buftype
    if buftype ~= '' then
      return ''
    end

    local modified_str = ''
    if vim.bo.modified then
      local modified_icon = ''
      modified_str = modified_icon .. ' '
    end

    local fpath = vim.fn.expand('%:~:p')
    return fpath .. ' ' .. modified_str
  end,
  hl = {
    fg = colors.fg,
    bg = colors.bg,
  },
  left_sep = ' ',
}

buffer.filetype_icon = {
  provider = function()
    local extension = vim.fn.expand('%:e')
    local fname = vim.fn.expand('%:t')
    if fname == '' then
      fname = 'unnamed'
    end
    local ft_icon = devicons.get_icon(fname, extension, { default = true })
    return ft_icon
  end
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

buffer.file_size = {
  provider = 'file_size',
  enabled = function()
    return vim.fn.getfsize(vim.fn.expand('%:t')) > 0
  end,
  right_sep = {
    ' ',
    {
      str = default_sep_left,
      hl = {
        fg = colors.fg,
        bg = colors.bg
      }
    },
    ' '
  }
}

buffer.cursor_position = {
  provider = 'position',
  right_sep = {
    ' ',
    {
      str = default_sep_left,
      hl = {
        fg = colors.fg,
        bg = colors.bg
      }
    }
  }
}

buffer.line_percentage = {
  provider = 'line_percentage',
  hl = {
    style = 'bold'
  },
  left_sep = '  ',
  right_sep = ' ',
}

return buffer
