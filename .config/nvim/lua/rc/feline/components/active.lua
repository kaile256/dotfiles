-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local vim = vim

local utils = require('rc.feline.providers.utils')
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
  buffer.left.file_path,
  buffer.left.modified,
  buffer.left.file_size,

  utils.reset,
}

active.mid = {
  utils.reset,

  diagnostics.mid.error,
  diagnostics.mid.warning,
  diagnostics.mid.hint,
  diagnostics.mid.info,

  utils.reset,
}

active.right = {
  utils.reset,

  buffer.right.foldmethod,
  buffer.right.cursor_position,
  buffer.right.line_percentage,
  buffer.scrollbar,
}

return active
