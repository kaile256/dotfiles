-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local buffer = require('rc.feline.providers.buffer')

local inactive = {
  left = {},
  mid = {},
  right = {},
}

inactive.left = {
  buffer.file_type,
  buffer.special_path,
}

return inactive
