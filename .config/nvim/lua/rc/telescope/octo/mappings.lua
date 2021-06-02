local mappings = {
  issue = {
    close_issue = "<space>ic",           -- close issue
    reopen_issue = "<space>io",          -- reopen issue
    list_issues = "<space>il",           -- list open issues on same repo
    reload = "<C-r>",                    -- reload issue
    open_in_browser = "<C-o>",           -- open issue in browser
    add_assignee = "<space>aa",          -- add assignee
    remove_assignee = "<space>ad",       -- remove assignee
    add_label = "<space>la",             -- add label
    remove_label = "<space>ld",          -- remove label
    goto_issue = "<space>gi",            -- navigate to a local repo issue
    add_comment = "<space>ca",           -- add comment
    delete_comment = "<space>cd",        -- delete comment
    next_comment = "]c",                 -- go to next comment
    prev_comment = "[c",                 -- go to previous comment
  },
  pull_request = {
    checkout_pr = "<space>po",           -- checkout PR
    merge_pr = "<space>pm",              -- merge PR
    list_commits = "<space>pc",          -- list PR commits
    list_changed_files = "<space>pf",    -- list PR changed files
    show_pr_diff = "<space>pd",          -- show PR diff
    add_reviewer = "<space>va",          -- add reviewer
    remove_reviewer = "<space>vd",       -- remove reviewer request
    close_issue = "<space>ic",           -- close PR
    reopen_issue = "<space>io",          -- reopen PR
    list_issues = "<space>il",           -- list open issues on same repo
    reload = "<C-r>",                    -- reload PR
    open_in_browser = "<C-o>",           -- open PR in browser
    add_assignee = "<space>aa",          -- add assignee
    remove_assignee = "<space>ad",       -- remove assignee
    add_label = "<space>la",             -- add label
    remove_label = "<space>ld",          -- remove label
    goto_issue = "<space>gi",            -- navigate to a local repo issue
    add_comment = "<space>ca",           -- add comment
    delete_comment = "<space>cd",        -- delete comment
    next_comment = "]c",                 -- go to next comment
    prev_comment = "[c",                 -- go to previous comment
  },
  review_thread = {
    goto_issue = "<space>gi",            -- navigate to a local repo issue
    add_comment = "<space>ca",           -- add comment
    add_suggestion = "<space>sa",        -- add suggestion
    delete_comment = "<space>cd",        -- delete comment
    next_comment = "]c",                 -- go to next comment
    prev_comment = "[c",                 -- go to previous comment
    select_next_entry = "]q",            -- move to previous changed file
    select_prev_entry = "[q",            -- move to next changed file
    close_review_tab = "<C-c>",          -- close review tab
  },
  submit_win = {
    approve_review = "<C-a>",            -- approve review
    comment_review = "<C-m>",            -- comment review
    request_changes = "<C-r>",           -- request changes review
    close_review_tab = "<C-c>",          -- close review tab
  },
  review_diff = {
    add_review_comment = "<space>ca",    -- add a new review comment
    add_review_suggestion = "<space>sa", -- add a new review suggestion
    focus_files = "<leader>e",           -- move focus to changed file panel
    toggle_files = "<leader>b",          -- hide/show changed files panel
    next_thread = "]t",                  -- move to next thread
    prev_thread = "[t",                  -- move to previous thread
    select_next_entry = "]q",            -- move to previous changed file
    select_prev_entry = "[q",            -- move to next changed file
    close_review_tab = "<C-c>",          -- close review tab
    toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
  },
  file_panel = {
    next_entry = "j",                    -- move to next changed file
    prev_entry = "k",                    -- move to previous changed file
    select_entry = "<cr>",               -- show selected changed file diffs
    refresh_files = "R",                 -- refresh changed files panel
    focus_files = "<leader>e",           -- move focus to changed file panel
    toggle_files = "<leader>b",          -- hide/show changed files panel
    select_next_entry = "]q",            -- move to previous changed file
    select_prev_entry = "[q",            -- move to next changed file
    close_review_tab = "<C-c>",          -- close review tab
    toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
  }
}

local reactions = {
  react_hooray      = "<space>rp", -- toggle 🎉 reaction
  react_heart       = "<space>rh", -- toggle ❤️  reaction
  react_eyes        = "<space>re", -- toggle 👀 reaction
  react_thumbs_up   = "<space>r+", -- toggle 👍 reaction
  react_thumbs_down = "<space>r-", -- toggle 👎 reaction
  react_rocket      = "<space>rr", -- toggle 🚀 reaction
  react_laugh       = "<space>rl", -- toggle 😄 reaction
  react_confused    = "<space>rc", -- toggle 😕 reaction
}

for _, mode in pairs({ "issue", "pull_request", "review_thread" }) do
  for k, v in pairs(reactions) do
    mappings[mode][k] = v
  end
end

return mappings
