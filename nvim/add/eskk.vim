scriptencoding utf-8
" From: japanese.toml
" Repo: tyru/eskk.vim

" TODO: Tell current mode of skk on airline/lightline
set imdisable " no use on neovim or nvim-qt.
" Path of Dictionaries {{{1
" if Server is yaskkserv,
" TODO: auto-start on i3.
let g:eskk#server = {'host': 'localhost', 'port': 1178}
let g:eskk#directory = g:data_home . '/eskk'
if filereadable('/usr/share/skk/SKK-JISYO.L')
  let g:eskk#large_dictionary = '/usr/share/skk/SKK-JISYO.L'
endif
let g:eskk#backup_dictionary = g:data_home . '/eskk/backup'
if !isdirectory(g:eskk#backup_dictionary)
  exe '!mkdir -p' shellescape(expand(g:eskk#backup_dictionary))
endif
" Henkan; Activate {{{1
let g:eskk#no_default_mappings = 1
"let g:eskk#mapped_keys = "\<c-space>"  " no use
" Remind: <a-space> for <esc>l.
" lmap for Insert, Command-line, Lang-Arg
inoremap <expr> <c-space> eskk#enable()
cnoremap <expr> <c-space> eskk#enable()
" Henkan; Completion {{{1
let g:eskk#keep_state = 1
let g:eskk#show_annotation = 1
let g:eskk#select_cand_keys = 'abcdefgijklmnopqrstuvwxyz'
" if unique, confirm the candidate auto.
let g:eskk#kakutei_when_unique_candidate = 1
"let g:eskk#initial_mode = 'ascii'
let g:eskk#start_completion_length = 2
" <TAB> to next selection
let g:eskk#tab_select_completion = 1
let g:eskk#egg_like_newline = 1 " ignore <CR> on 'kakutei'
let g:eskk#egg_like_newline_completion = 1
" Henkan; Marker {{{1
let g:eskk#marker_henkan = '@'
let g:eskk#marker_henkan_select = '>>'
let g:eskk#marker_okuri = '*'
let g:eskk#marker_jisyo_touroku = '?'

function! s:eskk_special_maps() "{{{1
  " A user can do something heavy process here.
  let t = eskk#table#new('rom_to_hira*', 'rom_to_hira')
  call t.add_map('z~', '～')
  call t.add_map('zc', '©')
  call t.add_map('zr', '®')
  call t.add_map('tm', '™')
  call t.add_map('z ', '　')
  " Input the dot after a number as-is (e.g. "1.")
  for n in range(10)
    call t.add_map(n . '.', n . '.')
  endfor
  call eskk#register_mode_table('hira', t)
  " http://subtech.g.hatena.ne.jp/motemen/20110527/1306485690
  " NOTE: This config below leaves the last character "z"
  " \ if g:eskk#rom_input_style is not "skk".
  for [orgtable, mode] in [['rom_to_hira', 'hira'], ['rom_to_kata', 'kata']]
    let t = eskk#table#new(orgtable.'*', orgtable)
    call t.add_map('zw', 'w', 'z')
    call eskk#register_mode_table(mode, t)
  endfor
endfunction "}}}
augroup EskkCallMyFunc
  au!
  au User eskk-initialize-pre call <SID>eskk_special_maps()
  "au ColorScheme * ++nested hi CursorIM guibg=purple guibg=yellow
augroup END

" Note: useless
" default values is below:
"   ascii: ivory4:#8b8b83, gray:#bebebe
"   hira: coral4:#8b3e2f, pink:#ffc0cb
"   kata: forestgreen:#228b22, green:#00ff00
"   abbrev: royalblue:#4169e1
"   zenei: gold:#ffd700
let g:eskk#cursor_color = {
      \   'ascii': ['#8b8b83', '#bebebe'],
      \   'hira': ['#8b3e2f', '#ffc0cb'],
      \   'kata': ['#228b22', '#00ff00'],
      \   'abbrev': '#4169e1',
      \   'zenei': '#ffd700',
      \}
