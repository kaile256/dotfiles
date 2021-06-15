-- TOML: memo.toml
-- Repo: oberblastmeister/neuron.nvim

local define_bufmaps = function()
  local maps = {
    n = {
      ["]m"] = [[<Cmd>lua require"neuron".goto_next_extmark()<CR>]],
      ["[m"] = [[<Cmd>lua require"neuron".goto_prev_extmark()<CR>]],
    },
  }

  local opts = { nowait=true }
  for mode, lhs_rhs in pairs(maps) do
    local bufmap = function(...) vim.api.nvim_buf_set_keymap(vim.api.nvim_get_current_buf(), mode, ...) end
    for lhs, rhs in pairs(lhs_rhs) do
      bufmap(lhs, rhs, opts)
    end
  end
end

require"neuron".setup {
  virtual_titles = true,
  mappings = false,
  neuron_dir = vim.env.MY_MEMO .. "/neuron",
  --- Run on attach.
  run = function()
    define_bufmaps()
  end,
  --  leader = "<BSlash>"
}
