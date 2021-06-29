-- TOML: memo.toml
-- Repo: megalithic/zk.nvim
-- Fork: kaile256/zk.nvim

require"zk".setup {
  debug = false,
  log = false,

  default_keymaps = false,
  default_notebook_path = vim.env.MY_MEMO .. "/neuron",
  fuzzy_finder = "telescope",
  link_format = "markdown",
}
