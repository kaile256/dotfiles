-- TOML: lsp.toml
-- Repo: neovim/nvim-lspconfig

-- local lspcontainers = require'lspcontainers'
-- local lspcontainers = pcall(require, 'lspcontainers') or {}

local config = {
  --  cmd = lspcontainers.command'sumneko_lua',
  --  cmd = pcall(lspcontainers.command, 'sumneko_lua') or { '/usr/bin/lua-language-server' },
  cmd = { '/usr/bin/lua-language-server' },

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
      },
    }
  }
}

return config
