-- TOML: lsp.toml
-- Repo: neovim/nvim-lspconfig

local lspconfig = require'lspconfig'
-- Note: As loaded in 'lspconfig/configs' (not 'lspconfig.configs') in nvim-lspconfig, use `/` instead of `.` because
-- Lua saves loaded packages literally in `package.loaded` to tell the two are different modules.
local configs = require'lspconfig/configs'
local on_attach = require'rc.lsp.config.on_attach'
local containers = require"rc.lsp.containers"
local spinner = require"rc.lsp.spinner"

local capabilities = spinner.enable_work_done_progress()

lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
  autostart = true,
  capabilities = capabilities,
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

for server, config in pairs(servers) do
  local ls = lspconfig[server]
  if ls then
    config.on_attach = config.on_attach or on_attach
    config.cmd = containers.lspcontainer_or_cmd(server, config.cmd)
  else
    --- Trigger `__newindex`; now, you have `default_config` applied and have a method `setup()`. As `__newindex` is
    --- only triggered once, you should restart nvim instance to check `lspconfig` contexts.
    configs[server] = config
    --- Set up autocmd named as `server` to attach on BufRead/FileType. `setup()` requires an argument.
    ls = lspconfig[server]
  end

  local ok, msg = pcall(ls.setup, config)
  if not ok then
    error(msg .. [[

    at "]] .. server .. '" in `servers`')
  end
end
