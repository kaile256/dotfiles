-- TOML: debug.toml
-- Repo: Mfussenegger/nvim-dap

local dap = require"dap"

local M = {}

M.register = function()
  local local_mappings = {
    i = dap.step_into,
    o = dap.step_over,
    r = dap.repl.open,
    c = dap.continue,
  }

  dap.listeners.after.event_initialized.enable_local_mappings = function(_, _)
    for key, cmd in pairs(local_mappings) do
      U.nnoremap({ "buffer", "nowait" }, key, cmd)
    end
  end

  local disable_local_mappings = function(_, _)
    for key, _ in pairs(local_mappings) do
      vim.cmd("nunmap <buffer> " .. key)
    end
  end

  dap.listeners.after.event_exited.disable_local_mappings = disable_local_mappings
  dap.listeners.after.event_terminated.disable_local_mappings = disable_local_mappings
end

return M
