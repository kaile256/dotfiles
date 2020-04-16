scriptencoding utf-8
" From: japanese.toml
" Repo: tyru/eskk.vim
" Another: add/eskk.vim
" Another: post/eskk.vim

" Note: EskkMap is a wrapper of eskk#map#_cmd_eskk_map(<q-args>)

" TODO: Tell current mode of skk on airline/lightline

" Path of Dictionaries {{{1
" if Server is yaskkserv,
" TODO: auto-start on i3.
let g:eskk#server = {'host': 'localhost', 'port': 1178}
let g:eskk#directory = $XDG_DATA_HOME .'/eskk'
if filereadable('/usr/share/skk/SKK-JISYO.L')
  let g:eskk#large_dictionary = '/usr/share/skk/SKK-JISYO.L'
endif
let g:eskk#backup_dictionary = $XDG_DATA_HOME .'/eskk/backup'
if !isdirectory(g:eskk#backup_dictionary)
  exe '!mkdir -p' shellescape(expand(g:eskk#backup_dictionary))
endif

" Henkan; Activate {{{1
let g:eskk#no_default_mappings = 1
let g:eskk#keep_state = 1 "  default: 0; eskk is off when insert again
"let g:eskk#keep_state_beyond_buffer = 1

" Henkan; Completion {{{1
" let g:eskk#show_annotation = 1
let g:eskk#select_cand_keys = 'abcdefgijklmnopqrstuvwxyz'
let g:eskk#show_candidates_count = 3
" if unique, confirm the candidate auto.
let g:eskk#kakutei_when_unique_candidate = 1
"let g:eskk#initial_mode = 'ascii'
let g:eskk#start_completion_length = 1
" <TAB> to next selection
let g:eskk#tab_select_completion = 0
let g:eskk#egg_like_newline = 1 " ignore <CR> on 'kakutei'
let g:eskk#egg_like_newline_completion = 1

" Henkan; Marker {{{1
let g:eskk#marker_henkan = '@'
let g:eskk#marker_henkan_select = '%'
let g:eskk#marker_okuri = '*'
let g:eskk#marker_jisyo_touroku = '?'

" Cursor Color {{{1
" Note: useless on nvim
let g:eskk#cursor_color = {
      \ 'ascii':  ['BlueViolet', 'Indigo'],
      \ 'hira':   ['Fuchsia', 'pink'],
      \ 'kata':   ['ForestGreen', 'green'],
      \ 'abbrev': 'RoyalBlue',
      \ 'zenei':  'gold',
      \ }

" let g:eskk#cursor_color = {
"      \ 'ascii':  ['#8b8b83', '#bebebe'],
"      \ 'hira':   ['#8b3e2f', '#ffc0cb'],
"      \ 'kata':   ['#228b22', '#00ff00'],
"      \ 'abbrev': '#4169e1',
"      \ 'zenei':  '#ffd700',
"      \ }
