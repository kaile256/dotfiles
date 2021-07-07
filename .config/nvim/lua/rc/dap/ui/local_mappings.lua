-- TOML: debug.toml
-- Repo: Mfussenegger/nvim-dap

local dap = require"dap"
local ui_widgets = require"dap.ui.widgets"

local M = {}

local prefix = "z"
local local_mappings = {}
local_mappings.widgets = {
  i = dap.step_into,
  I = dap.step_over,
  o = dap.step_out,
  ["<C-o>"] = dap.step_back,

  r = dap.repl.open,
  c = dap.continue,
}

local_mappings.target = {
  ["<C-]>"] = ui_widgets.hover
}

local enable_local_mappings_to_widgets = function()
  for key, cmd in pairs(local_mappings.widgets) do
    key = prefix .. key
    U.nnoremap({ "buffer", "nowait" }, key, cmd)
  end
end

local disable_local_mappings_to_widgets = function()
  for key, _ in pairs(local_mappings.widgets) do
    key = prefix .. key
    vim.cmd("silent! nunmap <buffer> " .. key)
  end
end

local toggle_local_mappings_to_widgets = function()
  enable_local_mappings_to_widgets()
  U.augroup { DapUI_disable_local_mappings_on_WinLeave = {
    { "BufWinLeave", "<buffer>", disable_local_mappings_to_widgets }
  }}
end


M.register = function()
  U.augroup { DapUI_set_local_mappings_on_launch = {
    { "FileType", "dapui_*", toggle_local_mappings_to_widgets },
  }}
end

return M
