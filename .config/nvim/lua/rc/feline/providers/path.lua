local vim = vim
local colors = require('rc.feline.colors')
local signs = require('rc.feline.signs')
local sep = signs.separator
local sep_left = sep.left
local separators = require('rc.feline.separators')

local path = {
  left = {},
  mid = {},
  right = {},
}

path.left.root_dir = {
  enabled = function()
    local fpath = vim.fn.expand('%:~:p:h')
    local len_fpath = string.len(fpath)
    local winwidth = vim.fn.winwidth(0)
    return len_fpath < winwidth / 3
  end,
  provider = function() return vim.fn.expand('%:p:h') end,
  right_sep = {
    ' ',
    separators.left.rounded_narrow(colors.fg, colors.bg),
    ' ',
  },
}

path.left.file_name = {
  provider = function() return vim.fn.expand('%:t') end,
}

path.left.fullpath = {
  enabled = function()
    local fpath = vim.fn.expand('%:~:p:h')
    local len_fpath = string.len(fpath)
    local winwidth = vim.fn.winwidth(0)
    return len_fpath < winwidth / 3
  end,
  provider = function()
    local buftype = vim.bo.buftype
    if buftype ~= '' then
      return ''
    end

    -- Note: modified_icon in the same component means to express in the same highlight.
    local root_dir = vim.fn.expand('%:~:p:h')
    local fname = vim.fn.expand('%:t')
    local format = root_dir .. ' ' .. sep_left.rounded_narrow .. ' ' .. fname
    return format
  end,
  hl = {
    fg = colors.fg,
    bg = colors.bg,
  },
  left_sep = {
    ' ',
  },
}

path.file_name = {
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

function path.special_path()
  local ft = vim.bo.filetype
  if ft == 'help' or ft == 'man' then
    return ft .. '://' .. vim.fn.expand('%:t:r')
  elseif ft == 'defx' then
    local cwd = vim.fn.matchstr(vim.fn.getline(1), '\\f\\+/')
    return 'defx://' .. cwd
  end

  if vim.bo.buftype ~= '' then return '' end

  return vim.fn.expand('%:~:p')
end

path.left.special_path = {
  provider = function()
    return path.special_path()
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

return path
