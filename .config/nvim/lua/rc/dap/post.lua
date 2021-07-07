-- TOML: debug.toml
-- Repo: Mfussenegger/nvim-dap

local local_mappings = require"rc.dap.local_mappings"

local filetypes = {
  "go",
  "lua",
}

local ft_config_dir = "rc.dap.ft"
for _, ft in pairs(filetypes) do
  local path = ft_config_dir .. "." .. ft
  require(path)
end

local_mappings.register()
