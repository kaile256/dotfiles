local vim = vim
local builtin_git = require('feline.providers.git')
local signs = require('rc.feline.signs')
local sep = signs.separator

local colors = {
  branch = 'magenta',
  added = 'green',
  changed = 'orange',
  removed = 'red',
}

local vcs = {
  git = {
    diff = {},
  },
}

local git = vcs.git

local is_under_git = function()
  return vim.b.gitsigns_status_dict
end

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
      fg = colors.branch,
      bg = 'bg',
      style = 'bold'
    }
    if not is_under_git() then
      val.fg = 'bg'
      val.bg = colors.changed
    end
    return val
  end,
  right_sep = function()
    local val = {
      str = '',
      hl = {
        fg = colors.branch,
        bg = 'bg',
      }
    }
    if is_under_git() then
      val.str = sep.left.triangle_broad
      val.hl.fg = 'bg'
      val.hl.bg = colors.added
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
    enabled = function()
      return is_under_git()
    end,
    provider = function()
      return get_git_stat('added')
    end,
    hl = {
      fg = 'bg',
      bg = colors.added,
      style = 'bold',
    },
    right_sep = {
      str = signs.separator.left.triangle_broad,
      hl = {
        fg = colors.added,
        bg = colors.changed,
      }
    },
  },

  changed = {
    enabled = function()
      return is_under_git()
    end,
    provider = function()
      return get_git_stat('changed')
    end,
    hl = {
      fg = 'bg',
      bg = colors.changed,
      style = 'bold',
    },
    right_sep = {
      str = signs.separator.left.triangle_broad,
      hl = {
        fg = colors.changed,
        bg = colors.removed,
      }
    },
  },

  removed = {
    enabled = function()
      return is_under_git()
    end,
    provider = function()
      return get_git_stat('removed')
    end,
    hl = {
      fg = 'bg',
      bg = colors.removed,
      style = 'bold',
    },
    right_sep = {
      str = signs.separator.left.triangle_broad,
      hl = {
        fg = colors.removed,
        bg = 'bg',
      }
    },
  },
}

return vcs
