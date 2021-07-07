-- TOML: debug.toml
-- Repo: rcarriga/nvim-dap-ui

require"dapui".setup {
  mappings = {
    expand = { "zo", "za" }, -- Toggle showing any children of variable in "Scope".
    open = { "o", "<CR>" },
    remove = { "x", "dd" },
    edit = "<CR>", -- Only in [Watch Expressions].
  };

  floating = {
    -- Assign either integers or floats between 0 and 1.
    max_width = nil,
    max_height = nil,
  },

  -- Layouts (sidebar or tray):
  sidebar = {
    width = 60,
  };
}
