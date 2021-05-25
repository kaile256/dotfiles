-- TOML: lsp.toml
-- Repo: neovim/nvim-lspconfig

---@diagnostic disable-next-line Unused function
local set_cmd = function()
  local enabled, lspcontainers = pcall(require, 'lspcontainers')
  return enabled
    and lspcontainers.command('sumneko_lua')
    or { '/usr/bin/lua-language-server' }
end

local config = {
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
