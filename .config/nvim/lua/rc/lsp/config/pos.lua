-- TOML: lsp.toml
-- Repo: neovim/nvim-lspconfig

local lspconfig = require'lspconfig'
local configs = require'lspconfig.configs'
local on_attach = require'rc.lsp.config.on_attach'

lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
  autostart = true,
})

-- Note: Both efm-langserver and diagnostic-server is a general purpose languageserver, and provides almost same
-- features. The difference is how to configure linter and formatter: the latter is designed to let users configure as
-- the other languageservers on coc.nvim. (https://github.com/iamcco/diagnostic-languageserver/issues/31)
local servers = {
  bashls = {},
  clangd = {},
  clojure_lsp = {},
  cmake = {},
  codeqlls = {},
  cssls = {},
  dartls = {},
  denols = {},
  -- diagnosticls = require'rc.lsp.config.ls.diagnostic',
  dockerls = {},
  efm = require"rc.lsp.config.ls.efm",
  gopls = {},
  graphql = {},
  hls = {},
  html = {},
  intelephense = {},
  java_language_server = {},
  jdtls = {},
  jsonls = {},
  kotlin_language_server = {},
  pyright = {},
  rust_analyzer = {},
  sqlls = {},
  stylelint_lsp = {},
  sumneko_lua = require"rc.lsp.config.ls.lua",
  tsserver = {},
  vimls = require"rc.lsp.config.ls.vim",
  yamlls = {},
  zk = require"rc.lsp.config.ls.zk",
}

--- TOML: lsp.toml
--- Repo: lspcontainers/lspcontainers.nvim
---@note Some languageserver might demand to sync volume mount on particular container. See lspcontainers.nvim/README.md.
local is_lspcontainers_available, lspcontainers = pcall(require, 'lspcontainers')
local lspcontainer_or_cmd = function(server, cmd)
  if not is_lspcontainers_available then return cmd end
  local enabled, container = pcall(lspcontainers.command, server)
  return enabled and container or cmd
end

for server, config in pairs(servers) do
  local ls = lspconfig[server]
  if ls then
    config.on_attach = config.on_attach or on_attach
    config.cmd = lspcontainer_or_cmd(server, config.cmd)
    ls.setup(config)
  else
    configs[server] = config -- Required to apply default_config.
    lspconfig[server].setup(config) -- Set up autocmd named as `server` to attach on BufRead/FileType.
  end
end
