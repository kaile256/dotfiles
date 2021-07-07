local dap = require"dap"

--- Ref: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#go-using-delve-directly
---@diagnostic disable-next-line: unused-local
local direct_delve_dap = function(callback, _)
  local handle
  local port = 38697
  handle, _ = vim.loop.spawn(
    "dlv",
    {
      args = { "dap", "-l", "127.0.0.1:" .. port },
      detached = true
    },
    function(exit_code)
      handle:close()
      error("`delve` exited with exit code: " .. exit_code)
    end)
  vim.defer_fn(function()
    callback({type = "server", host = "127.0.0.1", port = port})
  end, 100)
end

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
---@diagnostic disable-next-line: unused-local
local adapter_on_vscode_go = {
  type = "executable";
  command = "node";
  args = { os.getenv("HOME") .. "/dev/golang/vscode-go/dist/debugAdapter.js" };
}


dap.adapters.go = direct_delve_dap

dap.configurations.go = {
  {
    type = "go";
    name = "Debug";
    request = "launch";
    showLog = false;
    program = "${file}";
    dlvToolPath = vim.fn.exepath("dlv")  -- Adjust to where delve is installed
  },
}
