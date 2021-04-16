-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local active = require('rc.feline.components.active')
local inactive = require('rc.feline.components.inactive')

local components = {
  left = {
    active = {},
    inactive = {}
  },
  right = {
    active = {},
    inactive = {}
  }
}

components.left.active = active.left
components.right.active = active.right

components.left.inactive = inactive.left

return components
