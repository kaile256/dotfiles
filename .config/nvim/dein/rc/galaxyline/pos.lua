-- TOML: appearance.toml
-- Repo: glepnir/galaxyline.nvim

local vim = vim

vim.o.showmode = false
-- vim.cmd 'set rtp^=$DEIN_RC_DIR/galaxyline'

local gl = require('galaxyline')

gl.short_line_list = {
  'agit',
  'defx',
  'twiggy',
  'vista',
}

local gls = gl.section
local colors = require('rc.galaxyline.colors')

local Mode = require('rc.galaxyline.mode')
local VCS = require('rc.galaxyline.vcs')
local FileInfo = require('rc.galaxyline.fileinfo')

-- To keep the order, set items line by line.
gls.left[0] = Mode.ViMode
gls.left[1] = Mode.ViModeSep

gls.left[11] = VCS.GitIcon
gls.left[12] = VCS.GitBranch
gls.left[13] = VCS.DiffAdd
gls.left[14] = VCS.DiffModified
gls.left[15] = VCS.DiffRemove

gls.left[20] = FileInfo.FileIcon
gls.left[21] = FileInfo.FileName

gls.right[2] = FileInfo.LineInfo

-- Note: Apply the same name both to the key and to hl_group: FooBar to GalaxyFooBar.
gls.short_line_left[0] = FileInfo.FileType

gls.short_line_left[1] = FileInfo.FileIcon
gls.short_line_left[2] = FileInfo.SFileName

-- vim:path^=./module
