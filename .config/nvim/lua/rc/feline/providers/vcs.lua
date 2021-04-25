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

local get_git_stat = function(key)
  local gsd = vim.b.gitsigns_status_dict
  local stat = gsd and gsd[key] or 0
  return stat > 0
  and ' ' .. stat ..  ' '
  or ''
end

git.diff = {
  added = {
    provider = function()
      return get_git_stat('added')
    end,
    hl = {
      fg = colors.black,
      bg = colors.green,
      style = 'bold',
    },
  },

  changed = {
    provider = function()
      return get_git_stat('changed')
    end,
    hl = {
      fg = colors.black,
      bg = colors.orange,
      style = 'bold',
    },
  },

  removed = {
    provider = function()
      return get_git_stat('removed')
    end,
    hl = {
      fg = colors.black,
      bg = colors.red,
      style = 'bold',
    },
  },
}

return vcs
