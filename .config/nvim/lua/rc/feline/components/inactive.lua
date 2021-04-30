-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local buffer = require('rc.feline.providers.buffer')
local path = require('rc.feline.providers.path')

local inactive = {
  left = {},
  mid = {},
  right = {},
}

inactive.left = {
  buffer.left.file_type,
  path.left.special_path,
}

return inactive
