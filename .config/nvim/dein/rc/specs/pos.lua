-- TOML: appearance.toml
-- Repo: edluffy/specs.nvim

vim.cmd [[
hi! SpecsPopup ctermbg=Magenta guibg=Magenta
]]

local specs = require"specs"

specs.setup {
  show_jumps  = true,
  min_jump = 20,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 10, -- time increments used for fade/resize effects
    blend = 0, -- starting blend, between 0-100 (fully transparent), see :h winblend
    width = 180,
    winhl = "SpecsPopup",
    ---@type function
    fader = specs.pulse_fade,
    ---@type function
    resizer = specs.shrink_resizer
  },
  ignore_filetypes = {},
  ignore_buftypes = {
    -- nofile = true,
  },
}
