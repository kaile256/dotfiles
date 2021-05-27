local config = {
  cmd = {
    "$HOME/.yarn/bin/vim-language-server",
    "--stdio",
  },

  settings = {
    vim = {
      init_options = {
        isNeovim = vim.fn.has("nvim") == 1,
        suggest = {
          fromVimruntime = true,
          fromRuntimepath = false,
        }
      },
    },
  },
}

return config
