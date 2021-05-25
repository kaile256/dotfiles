-- TOML: lsp.toml
-- Repo: neovim/nvim-lspconfig

local lspconfig = require'lspconfig'
local on_attach = require'rc.lspconfig.on_attach'

lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
  autostart = true,
})

local servers = {
  bashls = {},
  clangd = {},
  clojure_lsp = {},
  cmake = {},
  codeqlls = {},
  cssls = {},
  dartls = {},
  denols = {},
  --  diagnosticls = {},
  dockerls = {},
  gopls = {},
  graphql = {},
  hls = {},
  html = {},
  intelephense = {},
  java_language_server = {},
  jdtls = {},
  jsonls = {},
  kotlin_language_server = {},
  lspinfo = {},
  pyright = {},
  rust_analyzer = {},
  sqlls = {},
  stylelint_lsp = {},
  sumneko_lua = require'rc.lspconfig.lua',
  tsserver = {},
  vimls = {},
  yamlls = {},
}

for server, config in pairs(servers) do
  config.on_attach = config.on_attach or on_attach
  lspconfig[server].setup(config)
end