-- TOML: lsp.toml
-- Repo: neovim/nvim-lspconfig

local lspconfig = require"lspconfig"
local common_on_attach = require"rc.lsp.config.on_attach"

vim.cmd([[
  command! -nargs=? ZkNewZettel    :lua require"lspconfig".zk.new(<f-args>)
  command! -nargs=0 ZkRefreshIndex :lua require"lspconfig".zk.index()
  highlight LspDiagnosticsDefaultError ctermfg=red guifg=red
  highlight LspDiagnosticsUnderlineError ctermfg=red guifg=red
  highlight LspDiagnosticsDefaultHint ctermfg=yellow guifg=yellow
  highlight LspDiagnosticsUnderlineHint cterm=none gui=none
]])

--- Run `zk index` to refresh Zenttelkasten index.
---@return nil
local refresh_index = function()
  vim.lsp.buf.execute_command({
    command = "zk.index",
    arguments = { vim.api.nvim_buf_get_name(0) },
  })
end

---@alias zk_location table<'"uri"',string>|table<'"range"',table>[] derives from LSP Location object.
---   (https:--//github.com/mickael-menu/zk/blob/main/docs/editors-integration.md#custom-commands)

--- Run `zk new` to create a new Zettel.
---@param opt table<"title"|"content"|"dir"|"group"|"template"|"date",string>|table<"extra",table>|table<"edit",boolean>|table<"insertLinkAtLocation",zk_location>
local create_zettel = function(opt)
  opt = opt or {}
  local handler_args = {
    command  = "zk.new",
    arguments = { vim.api.nvim_buf_get_name(0), opt },
  }
  local get_new_zettel_path_zettel_path = function(_, _, result)
    if not result or not result.path then return end
    return result.path
  end
  local id, canceler = vim.lsp.buf_request(0,
    "workspace/executeCommand",
    handler_args,
    get_new_zettel_path_zettel_path)
  return id, canceler
end

local zk_mappings = function()
  U.xnoremap({ "buffer", "nowait" }, "<CR>", "<Cmd>lua require('lspconfig').zk.follow_link_or_create({})<cr>")
  U.nnoremap({ "buffer", "nowait" }, "<CR>",
    "<Cmd>lua require('lspconfig').zk.follow_link_or_create({title = vim.fn.expand('<cword>')})<cr>")
  -- U.nnoremap({ "buffer", "nowait" }, "zx", function() refresh_index() end)
  -- U.nnoremap({ "buffer", "nowait" }, "zn", function() create_zettel({ title = vim.fn.input('Title> ') }) end)
end

local config = {
  default_config = {
    cmd = { "zk", "lsp" },
    filetypes = { "markdown" },
    root_dir = function(...)
      local dir = lspconfig.util.root_pattern(".zk/")(...) or lspconfig.util.root_pattern(".git/")(...) or vim.loop.cwd()
      return dir
      end,
    settings = {},
  },

  on_attach = function(on_attach, bufnr)
    common_on_attach(on_attach, bufnr)
    zk_mappings()
    U.augroup { ZkAutoRefresh = {
      { "BufNewFile,BufWritePost", "<buffer>", "call jobstart('zk index')" },
    },
    }
  end,

  new   = create_zettel,
  index = refresh_index,
}

return config
