-- TOML: debug.toml
-- Repo: mfussenegger/nvim-dap

local filetypes = {
  "lua",
}

for _, ft in pairs(filetypes) do
  local path = "rc.dap." .. ft
  require(path)
end
