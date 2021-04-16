-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim

local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')
local buffer = require('rc.feline.provider.buffer')

local active = {
  left = {},
  right = {},
}

active.left[1] = {
  provider = '▊ ',
  hl = {
    fg = 'skyblue'
  }
}


active.left[2] = {
  provider = 'vi_mode',
  hl = function()
    local val = {}

    val.name = vi_mode_utils.get_mode_highlight_name()
    val.fg = vi_mode_utils.get_mode_color()
    val.style = 'bold'

    return val
  end,
  right_sep = ' '
}

active.left[3] = {
  provider = 'file_info',
  hl = {
    fg = 'white',
    bg = 'oceanblue',
    style = 'bold'
  },
  left_sep = {
    ' ', 'slant_left_2',
    {str = ' ', hl = {bg = 'oceanblue', fg = 'NONE'}}
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
        fg = 'fg',
        bg = 'bg'
      }
    },
    ' '
  }
}

active.left[5] = {
  provider = 'position',
  right_sep = {
    ' ',
    {
      str = 'slant_right_2_thin',
      hl = {
        fg = 'fg',
        bg = 'bg'
      }
    }
  }
}

active.left[6] = {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = { fg = 'red' }
}

active.left[7] = {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = { fg = 'yellow' }
}

active.left[8] = {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = { fg = 'cyan' }
}

active.left[9] = {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  hl = { fg = 'skyblue' }
}

active.right[1] = {
  provider = 'git_branch',
  hl = {
    fg = 'white',
    bg = 'black',
    style = 'bold'
  },
  right_sep = function()
    local val = {hl = {fg = 'NONE', bg = 'black'}}
    if vim.b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

    return val
  end
}

active.right[2] = {
  provider = 'git_diff_added',
  hl = {
    fg = 'green',
    bg = 'black'
  }
}

active.right[3] = {
  provider = 'git_diff_changed',
  hl = {
    fg = 'orange',
    bg = 'black'
  }
}

active.right[4] = {
  provider = 'git_diff_removed',
  hl = {
    fg = 'red',
    bg = 'black'
  },
  right_sep = function()
    local val = {hl = {fg = 'NONE', bg = 'black'}}
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
