-- Ref: lspconfig/vimls.lua

local config = {
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
