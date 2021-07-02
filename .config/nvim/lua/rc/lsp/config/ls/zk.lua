local lspconfig = require"lspconfig"
local common_on_attach = require"rc.lsp.config.on_attach"

local zk_mappings = function()
  if vim.fn['dein#tap']('zk.nvim') then
    U.xnoremap({ "buffer", "nowait" }, "<CR>", "<Cmd>lua require('zk.command').create_note_link({})<cr>")
    U.nnoremap({ "buffer", "nowait" }, "<CR>",
      "<Cmd>lua require('zk.command').create_note_link({title = vim.fn.expand('<cword>')})<cr>")
  end
end

local config = {
  default_config = {
    cmd = {'zk', 'lsp'},
    filetypes = {'markdown'},
    root_dir = lspconfig.util.root_pattern(".zk"),
    settings = {},
  },

  on_attach = function(on_attach, bufnr)
    common_on_attach(on_attach, bufnr)
    zk_mappings()
  end
}

return config
