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
local BufInfo = require('rc.galaxyline.bufinfo')

-- To keep the order, set items line by line.
gls.left[2] = Mode.ViMode

gls.left[13] = VCS.GitBranch

gls.left[20] = BufInfo.FileIcon
gls.left[21] = BufInfo.FileName

gls.right[57] = BufInfo.ColLine
gls.right[58] = BufInfo.Scrollbar
-- gls.right[99] = BufInfo.ScrollbarSep
gls.right[59] = BufInfo.Encoding

-- Note: Apply the same name both to the key and to hl_group: FooBar to GalaxyFooBar.
gls.short_line_left[2] = BufInfo.FileType
gls.short_line_left[3] = Mode.ViModeSepLeft

gls.short_line_left[4] = BufInfo.FileIcon
gls.short_line_left[5] = BufInfo.SFileName

-- vim:path^=./module
