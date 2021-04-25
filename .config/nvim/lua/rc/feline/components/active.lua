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

active.right = {
  vcs.git.branch,
  vcs.git.diff.added,
  vcs.git.diff.changed,
  vcs.git.diff.removed,
  buffer.line_percentage,
  buffer.scrollbar,
}

return active
