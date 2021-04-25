-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim

local buffer = require('rc.feline.providers.buffer')
local mode = require('rc.feline.providers.mode')
local diagnostics = require('rc.feline.providers.diagnostics')

local colors = require('rc.feline.colors')

local active = {
  left = {},
  right = {},
}

active.left[1] = {
  provider = '',
  hl = {
    fg = colors.skyblue,
  }
}

active.left[2] = mode.vi_mode

active.left[3] = {
  provider = 'file_info',
  hl = {
    fg = colors.white,
    bg = colors.oceanblue,
    style = 'bold'
  },
  left_sep = {
    ' ', 'slant_left_2',
    {str = ' ', hl = {bg = colors.oceanblue, fg = 'NONE'}}
  },
  right_sep = {'slant_right_2', ' '}
}

active.left[4] = {
  provider = 'file_size',
  enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
  right_sep = {
    ' ',
    {
      str = 'slant_left_2_thin',
      hl = {
        fg = colors.fg,
        bg = colors.bg
      }
    },
    ' '
  }
}

active.left[4] = buffer.file_size

active.left[5] = {
  provider = 'position',
  right_sep = {
    ' ',
    {
      str = 'slant_right_2_thin',
      hl = {
        fg = colors.fg,
        bg = colors.bg
      }
    }
  }
}

local left_sections = {
  diagnostics.error,
  diagnostics.warning,
  diagnostics.hint,
  diagnostics.info,
}

for _, sec in pairs(left_sections) do
  table.insert(active.left, sec)
end

active.right[1] = {
  provider = 'git_branch',
  hl = {
    fg = colors.white,
    bg = colors.black,
    style = 'bold'
  },
  right_sep = function()
    local val = {hl = {fg = 'NONE', bg = colors.black}}
    if vim.b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

    return val
  end
}

active.right[2] = {
  provider = 'git_diff_added',
  hl = {
    fg = colors.green,
    bg = colors.black
  }
}

active.right[3] = {
  provider = 'git_diff_changed',
  hl = {
    fg = colors.orange,
    bg = colors.black
  }
}

active.right[4] = {
  provider = 'git_diff_removed',
  hl = {
    fg = colors.red,
    bg = colors.black
  },
  right_sep = function()
    local val = {
      hl = {
        fg = 'NONE',
        bg = colors.black,
      }
    }
    if vim.b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

    return val
  end
}

active.right[5] = {
  provider = 'line_percentage',
  hl = {
    style = 'bold'
  },
  left_sep = '  ',
  right_sep = ' '
}

active.right[6] = buffer.scrollbar

return active
