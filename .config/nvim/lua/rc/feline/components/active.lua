-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim

local buffer = require('rc.feline.providers.buffer')
local mode = require('rc.feline.providers.mode')
local diagnostics = require('rc.feline.providers.diagnostics')
local vcs = require('rc.feline.providers.vcs')

local active = {
  left = {},
  mid = {},
  right = {},
}

active.left = {
  mode.vi_mode,

  vcs.git.branch,
  vcs.git.diff.added,
  vcs.git.diff.changed,
  vcs.git.diff.removed,

  buffer.left.filetype_icon,
  buffer.file_path,
  buffer.modified,
}

active.mid = {
  diagnostics.error,
  diagnostics.warning,
  diagnostics.hint,
  diagnostics.info,
}

active.right = {
  buffer.cursor_position,
  buffer.file_size,
  buffer.line_percentage,
  buffer.scrollbar,
}

return active
