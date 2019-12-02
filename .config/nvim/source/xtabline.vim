" From: appearance.toml
" Repo: mg979/vim-xtabline

"silent XTabTheme slate

let g:xtabline_settings = {}

let s:xtabline_data_home = $XDG_DATA_HOME .'/nvim/xtabline'
let s:bookmarks_file = s:xtabline_data_home .'/bookmarks'
let s:sessions_data  = s:xtabline_data_home .'/sessions'

if !isdirectory(s:xtabline_data_home)
  exe '!mkdir' shellescape(expand(s:xtabline_data_home))
endif
if !filereadable(s:bookmarks_file)
  exe '!touch' shellescape(expand(s:bookmarks_file))
endif
if !filereadable(s:sessions_data)
  exe '!touch' shellescape(expand(s:sessions_data))
endif

let g:xtabline_settings.bookmarks_file = s:bookmarks_file
let g:xtabline_settings.sessions_data  = s:sessions_data

let g:xtabline_settings.map_prefix = 'gx'

let g:xtabline_settings.recent_buffers = 8

let g:xtabline_settings.tabline_modes = ['tabs', 'buffers', 'arglist']
let g:xtabline_settings.buffer_filtering = 1 " directory-based filter

let g:xtabline_settings.relative_paths = 0
