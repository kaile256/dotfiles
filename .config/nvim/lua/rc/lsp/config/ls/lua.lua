-- TOML: lsp.toml
-- Repo: neovim/nvim-lspconfig
-- Ref: lspconfig/sumneko_lua.lua

local config = {
  cmd = { "/usr/bin/lua-language-server" },

  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = {
          '?.lua',
          '?/init.lua',
          '/usr/share/luajit-2.0.5/jit/?.lua',
        }
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [ vim.fn.expand('$VIMRUNTIME/lua') ] = true,
          [ vim.fn.expand('$VIMRUNTIME/lua/vim/lsp') ] = true,
          [ vim.fn.expand('$DEIN_GITHUB_DIR/nvim-lua/plenary.nvim/lua/plenary/busted.lua') ] = true,
        },
        preloadFileSize = 500,
      },
    }
  }
}

return config
