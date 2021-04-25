-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local active = require('rc.feline.components.active')
local inactive = require('rc.feline.components.inactive')

local components = {
  left = {
    active = {},
    inactive = {}
  },
  mid = {
    active = {},
    inactive = {},
  },
  right = {
    active = {},
    inactive = {}
  }
}

components.left.active  = active.left
components.mid.active   = active.mid
components.right.active = active.right

components.left.inactive  = inactive.left
components.mid.inactive   = inactive.mid
components.right.inactive = inactive.right

return components
