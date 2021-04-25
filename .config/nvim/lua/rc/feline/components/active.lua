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
  mid = {},
  right = {},
}

active.left = {
  mode.vi_mode,

  buffer.file_name,
  buffer.file_size,
  buffer.cursor_position,

  diagnostics.error,
  diagnostics.warning,
  diagnostics.hint,
  diagnostics.info,
}

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
