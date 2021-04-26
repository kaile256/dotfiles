-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local buffer = require('rc.feline.providers.buffer')

local inactive = {
  left = {},
  mid = {},
  right = {},
}

inactive.left = {
  buffer.left.file_type,
  buffer.left.special_path,
}

return inactive
