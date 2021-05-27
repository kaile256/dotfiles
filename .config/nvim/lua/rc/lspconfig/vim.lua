-- Ref: lspconfig/vimls.lua

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
