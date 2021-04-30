-- Repo: famiu/feline.nvim

local vim = vim
local builtin_git = require('feline.providers.git')
local signs = require('rc.feline.signs')
local sep = signs.separator
local colors = require('rc.feline.colors')
local separators = require('rc.feline.separators')

local theme = {
  branch  = colors.magenta,
  added   = colors.green,
  changed = colors.yellow,
  removed = colors.red,
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
      fg = theme.branch,
      bg = colors.bg,
      style = 'bold'
    }
    if not is_under_git() then
      val.fg = colors.bg
      val.bg = theme.branch
    end
    return val
  end,
  right_sep = function()
    return is_under_git()
      and separators.left.rounded_broad(colors.bg, theme.added)
      -- TODO: Append a space at the end.
      or separators.left.rounded_broad(theme.branch, colors.bg)
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
      fg = colors.bg,
      bg = theme.added,
      style = 'bold',
    },
    right_sep = {
      separators.left.rounded_broad(theme.added, theme.changed),
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
      fg = colors.bg,
      bg = theme.changed,
      style = 'bold',
    },
    right_sep = {
      separators.left.rounded_broad(theme.changed, theme.removed),
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
      fg = colors.bg,
      bg = theme.removed,
      style = 'bold',
    },
    right_sep = {
      separators.left.rounded_broad(theme.removed, colors.bg),
      ' ',
    },
  },
}

return vcs
