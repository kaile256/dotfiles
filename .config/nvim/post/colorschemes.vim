" From: appearance.toml
" Repo: flazz/vim-colorschemes

" TODO: find colorscheme for floating window's cool, transpaent color.
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#e73131'
let g:terminal_color_2  = '#67c60c'
let g:terminal_color_3  = '#ddb812'
let g:terminal_color_4  = '#4383d5'
let g:terminal_color_5  = '#b859c8'
let g:terminal_color_6  = '#43c4cc'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#fc6868'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'

"augroup AlertOnBuffer
"  " CAUTION: Too many Exceptions!!
"  au! FileChangedRO * colorscheme Monokai
"augroup END

" functions in highlight-group {{{1
function! s:neodark_diff(...) abort "{{{2
  hi DiffAdd cterm=reverse gui=reverse ctermfg=108 ctermbg=237 guifg=#87af87 guibg=#3a3a3a
  hi DiffRemove  cterm=reverse gui=reverse ctermfg=167 guifg=#fb4934
  hi DiffDelete cterm=reverse gui=reverse ctermfg=168 ctermbg=237 guifg=#d75f87 guibg=#3a3a3a
  " the line which has difference between the one and the other.
  hi DiffChange cterm=reverse gui=reverse ctermfg=179 ctermbg=237 guifg=#d7af5f guibg=#3a3a3a
  " the differed characters within DiffChange
  hi DiffText cterm=reverse gui=reverse ctermfg=74 ctermbg=236 guifg=#5fafd7 guibg=#303030

  " for fugitive
  hi diffAdded cterm=reverse gui=reverse ctermfg=108 guifg=#87af87
  hi diffRemoved cterm=reverse gui=reverse ctermfg=168 guifg=#d75f87
endfunction
function! s:gruvbox_diff(...) abort "{{{2
  hi DiffAdd     cterm=reverse gui=reverse ctermfg=142 guifg=#b8bb26
  " the line of which only the other has.
  hi DiffRemove  cterm=reverse gui=reverse ctermfg=167 guifg=#fb4934
  " the line which has difference between the one and the other.
  hi DiffChange  cterm=reverse gui=reverse ctermfg=108 guifg=#8ec07c
  " the differed characters within DiffChange
  hi DiffText    cterm=reverse gui=reverse ctermfg=208 guifg=#fe8019

  " for fugitive
  hi diffAdded   cterm=reverse gui=reverse ctermfg=142 guifg=#b8bb26
  hi diffRemoved cterm=reverse gui=reverse ctermfg=167 guifg=#fb4934
  hi diffChanged cterm=reverse gui=reverse ctermfg=108 guifg=#8ec07c

  hi diffFile    cterm=reverse gui=reverse ctermfg=208 guifg=#fe8019
  hi diffNewFile cterm=reverse gui=reverse ctermfg=214 guifg=#fabd2f
  "hi diffLine    cterm=reverse gui=reverse ctermfg=109 guifg=#83a598
  hi diffLine    cterm=reverse gui=reverse ctermfg=109 guifg=#36b383
endfunction

"hi Folded ctermfg=59 ctermbg=236 guifg=#5f5f5f guibg=#303030

function! s:transparent() abort "{{{1
  hi Normal      ctermbg=none guibg=none
  hi NonText     ctermbg=none guibg=none
  hi LineNr      ctermbg=none guibg=none
  hi Folded      ctermbg=none guibg=none
  hi EndOfBuffer ctermbg=none guibg=none
  hi CursorLine  ctermbg=none guibg=none
  hi SignColumn  ctermbg=none guibg=none

  hi Comment ctermfg=245 guifg=#8a8a8a

  " Note: other apps out of nvim is still invisible
  "hi NormalFloat ctermbg=none guibg=none
endfunction

function! s:my_commons() abort "{{{1

  " coc.nvim supports
  hi HighlightedyankRegion ctermfg=232 ctermbg=66 guifg=#000000 guibg=#df5f29
  hi CocErrorHighlight ctermfg=red  guifg=#ff0000

  hi CursorIM guibg=#fabd1f

  if $ALACRITTY_LOG =~# '\.log$'
    call s:transparent()
  endif
endfunction

function! s:my_neodark() abort "{{{1
  let g:neodark#use_256color = 1 " default: 0
  let g:neodark#italic       = 1 " default: 0

  let g:neodark#terminal_transparent      = 1 " default: 0
  let g:neodark#use_custom_terminal_theme = 1 " default: 0

  " Note: should be done after :coloscheme.
  " 'syntax on' overrides syntax; 'enable' keeps already-defined syntax
  syntax on

  hi Search      ctermfg=236 ctermbg=180 guifg=#3e120a guibg=#ebb556
  hi NormalFloat ctermfg=236 ctermbg=180 guibg=#1a0210 guifg=#957474

  " Note: reverse keeps text color;
  "       ':hi **bg=foo' will white out text's characters.
  " Note: :hi should be done after :syntax.
  " line-wise
  " the line of which only the one has.
  call s:gruvbox_diff()
  "hi DiffAdd     cterm=reverse gui=reverse ctermfg=142 guifg=#b8bb26
  "" the line of which only the other has.
  "hi DiffRemove  cterm=reverse gui=reverse ctermfg=167 guifg=#fb4934
  "" the line which has difference between the one and the other.
  "hi DiffChange  cterm=reverse gui=reverse ctermfg=108 guifg=#8ec07c
  "" the differed characters within DiffChange
  "hi DiffText    cterm=reverse gui=reverse ctermfg=208 guifg=#fe8019

  "" for fugitive
  "hi diffAdded   cterm=reverse gui=reverse ctermfg=142 guifg=#b8bb26
  "hi diffRemoved cterm=reverse gui=reverse ctermfg=167 guifg=#fb4934
  "hi diffChanged cterm=reverse gui=reverse ctermfg=108 guifg=#8ec07c

  "hi diffFile    cterm=reverse gui=reverse ctermfg=208 guifg=#fe8019
  "hi diffNewFile cterm=reverse gui=reverse ctermfg=214 guifg=#fabd2f
  ""hi diffLine    cterm=reverse gui=reverse ctermfg=109 guifg=#83a598
  "hi diffLine    cterm=reverse gui=reverse ctermfg=109 guifg=#36b383
endfunction

augroup myColorschemes "{{{1
  au!
  au Colorscheme *       call s:my_commons()
  au Colorscheme neodark call s:my_neodark()
augroup END

" :colorscheme up to os/gui {{{1
if execute('!uname -o') ==? 'Android'
  colorscheme molokai_dark
elseif exists('g:nyaovim_version')
  colorscheme solarized8_light_flat
  "elseif !exists("g:GuiLoaded")
  "  " on CUI
  "  let g:solarized_termcolors=256
  "  colorscheme solarized8_light_flat
  "  "colorscheme solarized8_dark_flat
else
  colorscheme neodark
  call s:my_neodark()
endif

" Note: have to call here to activate the config
call s:my_commons()

finish "{{{1

let histring = [ 'hi', a:group,
      \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
      \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
      \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
      \ ]

" special
if a:0 >= 3
  call add(histring, 'guisp=' . a:3[0])
endif

execute join(histring, ' ')
" Arguments: group, guifg, guibg, gui, guisp
" i.e., guisp = s:inverse
call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)
