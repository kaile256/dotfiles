-- TOML: debug.toml
-- Repo: mfussenegger/nvim-dap

local filetypes = {
  "go",
  "lua",
}

local ft_config_dir = "rc.dap.ft"
for _, ft in pairs(filetypes) do
  local path = ft_config_dir .. "." .. ft
  require(path)
end
