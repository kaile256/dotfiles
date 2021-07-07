-- TOML: debug.toml
-- Repo: Mfussenegger/nvim-dap

local filetypes = {
  "go",
  "lua",
}

for _, ft in pairs(filetypes) do
  local path = "rc.dap." .. ft
  require(path)
end
