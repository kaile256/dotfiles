-- TOML: lsp.toml
-- Repo: neovim/nvim-lspconfig

local lspconfig = require'lspconfig'
local configs = require'lspconfig.configs'
local on_attach = require'rc.lspconfig.on_attach'

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
  -- diagnosticls = require'rc.lspconfig.diagnostic',
  dockerls = {},
  efm = require"rc.lspconfig.efm",
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
  sumneko_lua = require'rc.lspconfig.lua',
  tsserver = {},
  vimls = require'rc.lspconfig.vim',
  yamlls = {},
  zk = require'rc.lspconfig.zk',
}

for server, config in pairs(servers) do
  local ls = lspconfig[server]
  if ls then
    config.on_attach = config.on_attach or on_attach
    ls.setup(config)
  else
    configs[server] = config
    -- TODO: make it work
    -- lspconfig[server].setup()
  end
end
