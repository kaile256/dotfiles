-- TOML: appearance.toml
-- Repo: famiu/feline.nvim

local utils = require('rc.feline.providers.utils')
local buffer = require('rc.feline.providers.buffer')
local path = require('rc.feline.providers.path')
local mode = require('rc.feline.providers.mode')
local diagnostics = require('rc.feline.providers.diagnostics')
local vcs = require('rc.feline.providers.vcs')
local lsp = require('rc.feline.providers.lsp')

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
  path.left.fullpath,
  buffer.left.modified,
  buffer.left.file_size,

  utils.reset,
}

active.mid = {
  utils.reset,

  lsp.loading,

  utils.reset,
}

active.right = {
  utils.reset,

  diagnostics.right.error,
  diagnostics.right.warning,
  diagnostics.right.hint,
  diagnostics.right.info,

  buffer.right.foldmethod,
  buffer.right.cursor_position,
  buffer.right.line_percentage,
  buffer.scrollbar,
}

return active
