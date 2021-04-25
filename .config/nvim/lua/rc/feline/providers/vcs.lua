local vim = vim
local colors = require('rc.feline.colors')

local vcs = {
  git = {
    diff = {},
  },
}

local git = vcs.git

git.branch = {
  provider = 'git_branch',
  hl = {
    fg = colors.white,
    bg = colors.black,
    style = 'bold'
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

git.diff = {
  added = {
    provider = 'git_diff_added',
    hl = {
      fg = colors.green,
      bg = colors.black
    }
  },

  changed = {
    provider = 'git_diff_changed',
    hl = {
      fg = colors.orange,
      bg = colors.black
    }
  },

  removed = {
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
      val.str = vim.b.gitsigns_status_dict and ' ' or ''
      return val
    end
  },
}

return vcs
