-- Repo: pwntester/octo.nvim
-- Toml: telescope.toml

local config = {
  mappings = require"rc.telescope.octo.mappings",

  date_format    = "%Y %b %d %I:%M %p %Z",
  default_remote = {"upstream", "origin"}, -- order to try remotes

  user_icon = " ",
  reaction_viewer_hint_icon = "",

  timeline_marker = "",
  timeline_indent = "2",

  right_bubble_delimiter = "",
  left_bubble_delimiter  = "",

  github_hostname       = "", -- GitHub Enterprise host
  snippet_context_lines = 4,  -- number or lines around commented lines

  file_panel = {
    size      = 10,   -- changed files panel rows
    use_icons = true, -- use web-devicons in file panel
  },
}

require"octo".setup(config)
