-- Init: $DEIN_RC_DIR/galaxyline/pos.lua

local colors = require('rc.galaxyline.colors')
local condition = require('galaxyline.condition')
local icons = require('rc.galaxyline.icons')

local git_icon = {
  provider = function() return '  ' end,
  condition = condition.check_git_workspace,
  separator = '',
  separator_highlight = {
    'NONE',
    colors.bg,
  },
  highlight = {
    colors.violet,
    colors.bg,
    'bold'
  },
}

local git_branch = {
  provider = 'GitBranch',
  condition = condition.check_git_workspace,
  highlight = {
    colors.violet,
    colors.bg,
    'bold'
  },
}

local diff_add = {
  provider = 'DiffAdd',
  condition = condition.hide_in_width,
  icon = '',
  highlight = {
    colors.green,
    colors.bg
  },
}

local diff_modified = {
  provider = 'DiffModified',
  condition = condition.hide_in_width,
  icon = 'ﰣ',
  highlight = {
    colors.orange,
    colors.bg
  },
}

local diff_remove = {
  provider = 'DiffRemove',
  condition = condition.hide_in_width,
  icon = '',
  highlight = {
    colors.red,
    colors.bg
  },
}

local VCS = {
  GitIcon = {GitIcon = git_icon},
  GitBranch = {GitBranch = git_branch},

  DiffAdd = {DiffAdd = diff_add},
  DiffModified = {DiffModified = diff_modified},
  DiffRemove = {DiffRemove = diff_remove},
}

return VCS

