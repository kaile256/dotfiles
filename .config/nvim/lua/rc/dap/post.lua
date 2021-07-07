-- TOML: debug.toml
-- Repo: Mfussenegger/nvim-dap

local local_mappings = require"rc.dap.local_mappings"

local filetypes = {
  "go",
  "lua",
}

for _, ft in pairs(filetypes) do
  local path = "rc.dap." .. ft
  require(path)
end

local_mappings.register()
