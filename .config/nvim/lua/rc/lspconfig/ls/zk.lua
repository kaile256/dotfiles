local common_on_attach = require"rc.lspconfig.on_attach"

local zk_mappings = function()
  if vim.fn['dein#tap']('zk.nvim') then
    local opts = {noremap = true, silent = false, nowait = true}
    vim.api.nvim_set_keymap("x", "<CR>", "<cmd>lua require('zk.command').create_note_link({})<cr>", opts)
    vim.api.nvim_set_keymap("n", "<CR>",
      "<cmd>lua require('zk.command').create_note_link({title = vim.fn.expand('<cword>')})<cr>",
      opts)
  end
end

local config = {
  default_config = {
    cmd = {'zk', 'lsp'},
    filetypes = {'markdown'},
    root_dir = function()
      local cwd = vim.loop.cwd()
      local neuron_root = cwd:match('^.*/neuron/') or cwd
      return neuron_root
    end,
    settings = {},
  },

  on_attach = function()
    common_on_attach()
    zk_mappings()
  end
}

return config
