-- TOML: git.toml
-- Repo: sindrets/diffview.nvim

local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  file_panel = {
    width = 35,
    use_icons = true        -- Requires nvim-web-devicons
  },
  key_bindings = {
    -- The `view` bindings are active in the diff buffers, only when the current tabpage is a Diffview.
    view = {
      ["<C-x><C-x>"]   = cb("toggle_files"),  -- Open/Close <panel>.

      ["<C-n>"] = cb("select_next_entry"),  -- Open the diff for the next file
      ["<C-p>"] = cb("select_prev_entry"),  -- Open the diff for the previous file

      ["<CR>"] = cb("focus_files"),   -- Bring focus to the files <panel>
    },

    file_panel = {
      ["<C-x><C-x>"] = cb("toggle_files"), -- Open/Close <panel>.

      ["j"] = cb("next_entry"), -- Just bring the cursor to the next file entry
      ["k"] = cb("prev_entry"), -- Just bring the cursor to the previous file entry.
      -- ["<down>"] = cb("next_entry"),
      -- ["<up>"]   = cb("prev_entry"),

      ["o"]     = cb("select_entry"),
      ["<CR>"]  = cb("select_entry"),       -- Open the diff for the selected entry.
      ["<C-n>"] = cb("select_next_entry"),
      ["<C-p>"] = cb("select_prev_entry"),

      ["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
    }
  }
}
