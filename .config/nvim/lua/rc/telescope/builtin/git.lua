local actions = require('telescope.actions')

local action_prefix = [[<C-\>]]

local config = {}

config.git_branches = {
  -- Ref: telescope/builtin/git.lua
  attach_mappings = function (_, map)
    actions.select_default:replace(actions.git_checkout)

    map('i', action_prefix .. 'd', actions.git_delete_branch)
    map('n', 'dd', actions.git_delete_branch)

    map('i', action_prefix .. 't', actions.git_track_branch)
    map('n', action_prefix .. 't', actions.git_track_branch)

    map('i', action_prefix .. 'r', actions.git_rebase_branch)
    map('n', 'ri', actions.git_rebase_branch)

    map('i', action_prefix .. 'a', actions.git_create_branch)
    map('n', 'gc', actions.git_create_branch)

    return true
  end
}

return config
