local vim = vim
local builtin_git = require('feline.providers.git')
local colors = require('rc.feline.colors')

local vcs = {
  git = {
    diff = {},
  },
}

local git = vcs.git

git.branch = {
  provider = function(component)
    local branch = builtin_git.git_branch(component)
    if branch == '' then
      branch = ' [none] '
    else
      branch = branch .. ' '
    end
    return branch
  end,
  hl = function()
    local val = {
      fg = colors.magenta,
      bg = colors.bg,
      style = 'bold'
    }
    if not vim.b.gitsigns_status_dict then
      val.fg, val.bg = colors.black, colors.orange
    end
    return val
  end,
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
