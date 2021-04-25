-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim

local buffer = require('rc.feline.providers.buffer')
local mode = require('rc.feline.providers.mode')
local diagnostics = require('rc.feline.providers.diagnostics')
local vcs = require('rc.feline.providers.vcs')

local colors = require('rc.feline.colors')

local active = {
  left = {},
  right = {},
}

active.left[1] = {
  provider = '',
  hl = {
    fg = colors.skyblue,
  }
}

active.left[2] = mode.vi_mode

active.left[3] = buffer.file_name
active.left[4] = buffer.file_size
active.left[5] = buffer.cursor_position

local left_sections = {
  diagnostics.error,
  diagnostics.warning,
  diagnostics.hint,
  diagnostics.info,
}

for _, sec in pairs(left_sections) do
  table.insert(active.left, sec)
end

active.right[1] = vcs.git.branch
active.right[2] = vcs.git.diff.added
active.right[3] = vcs.git.diff.changed
active.right[4] = vcs.git.diff.removed

active.right[5] = {
  provider = 'line_percentage',
  hl = {
    style = 'bold'
  },
  left_sep = '  ',
  right_sep = ' '
}

active.right[6] = buffer.scrollbar

return active
