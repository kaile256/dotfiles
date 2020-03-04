" From: colorscheme.toml
" Repo: flazz/vim-colorschemes

"augroup AlertOnBuffer
"  " CAUTION: Too many Exceptions!!
"  au! FileChangedRO * colorscheme Monokai
"augroup END

function! s:neodark_diff(...) abort "{{{1
  if exists('s:syn_diff')
    if s:syn_diff ==# 'neodark' | return | endif
  endif
  let s:syn_diff = 'neodark'

  " the removed lines
  hi! DiffRemove cterm=bold gui=bold ctermfg=167 guifg=#fb4934

  " the line which has any differences
  hi! DiffChange cterm=bold gui=bold ctermfg=179 ctermbg=237 guifg=#d7af5f guibg=#3a3a3a

  " character-wise within DiffChange
  hi! DiffAdd    cterm=bold gui=bold ctermfg=108 ctermbg=237 guifg=#87af87 guibg=#3a3a3a
  hi! DiffDelete cterm=bold gui=bold ctermfg=168 ctermbg=237 guifg=#d75f87 guibg=#3a3a3a
  hi! DiffText   cterm=bold gui=bold ctermfg=74  ctermbg=236 guifg=#5fafd7 guibg=#303030

  "hi! DiffAdd    cterm=bold gui=bold ctermfg=74  ctermbg=236 guifg=#5fafd7 guibg=#303030
  "hi! DiffDelete cterm=bold gui=bold ctermfg=168 ctermbg=237 guifg=#d75f87 guibg=#3a3a3a
  "hi! DiffText   cterm=bold gui=bold ctermfg=108 ctermbg=237 guifg=#87af87 guibg=#3a3a3a
endfunction

function! s:gruvbox_diff(...) abort "{{{1
  if exists('s:syn_diff')
    if s:syn_diff ==# 'gruvbox' | return | endif
  endif
  let s:syn_diff = 'gruvbox'

  hi! DiffChange  cterm=bold gui=bold ctermfg=108 guifg=#8ec07c

  hi! DiffAdd     cterm=bold gui=bold ctermfg=142 guifg=#b8bb26
  hi! DiffRemove  cterm=bold gui=bold ctermfg=167 guifg=#fb4934
  hi! DiffText    cterm=bold gui=bold ctermfg=208 guifg=#fe8019

  " for fugitive
  hi! diffFile    cterm=bold gui=bold ctermfg=208 guifg=#fe8019
  hi! diffNewFile cterm=bold gui=bold ctermfg=214 guifg=#fabd2f
  "hi diffLine    cterm=bold gui=bold ctermfg=109 guifg=#83a598
  hi! diffLine    cterm=bold gui=bold ctermfg=109 guifg=#36b383
endfunction

function! s:mixed_diff(...) abort "{{{1
  if exists('s:syn_diff')
    if s:syn_diff ==# 'mixed' | return | endif
  endif
  let s:syn_diff = 'mixed'

  hi! DiffChange cterm=bold gui=bold ctermfg=179 ctermbg=237 guifg=#d7af5f guibg=#3a3a3a

  hi! DiffAdd cterm=bold gui=bold ctermfg=74 ctermbg=236 guifg=#5fafd7 guibg=#303030
  hi! DiffRemove  cterm=bold gui=bold ctermfg=167 guifg=#fb4934
  hi! DiffText    cterm=bold gui=bold ctermfg=208 guifg=#fe8019

  " " for fugitive
  " hi! diffFile    cterm=bold gui=bold ctermfg=208 guifg=#fe8019
  " hi! diffNewFile cterm=bold gui=bold ctermfg=214 guifg=#fabd2f
  " "hi diffLine    cterm=bold gui=bold ctermfg=109 guifg=#83a598
  " hi! diffLine    cterm=bold gui=bold ctermfg=109 guifg=#36b383
endfunction
function! s:my_commons() abort "{{{1

  " coc.nvim supports
  hi! HighlightedyankRegion ctermfg=232 ctermbg=66 guifg=#000000 guibg=#df5f29
  hi! CocErrorHighlight     ctermfg=red guifg=#ff0000

  hi! CursorIM guibg=#fabd1f

  "hi Folded ctermfg=59 ctermbg=236 guifg=#5f5f5f guibg=#303030

  if $ALACRITTY_LOG =~# '\.log$'
    runtime rc/transparent.vim
  endif

  " for fugitive
  hi! link diffAdded   DiffAdd
  hi! link diffRemoved DiffRemove
  hi! link diffChanged DiffChange
endfunction

function! s:my_neodark() abort "{{{1
  let g:neodark#use_256color = 1 " default: 0
  let g:neodark#italic       = 1 " default: 0

  let g:neodark#terminal_transparent      = 1 " default: 0
  let g:neodark#use_custom_terminal_theme = 1 " default: 0

  " Note: should be done after :coloscheme.
  " 'syntax on' overrides syntax; 'enable' keeps already-defined syntax
  syntax on

  hi! Search      ctermfg=236 ctermbg=180 guifg=#3e120a guibg=#ebb556
  " NormalFloat: color for winblend, or floating windows
  hi! NormalFloat ctermfg=236 ctermbg=180 guibg=#3a192c guifg=#9f994a

  call s:mixed_diff()
  "call s:gruvbox_diff()
  " call s:neodark_diff()

  " Note: reverse keeps text color;
  "       ':hi **bg=foo' will white out text's characters.
  " Note: :hi should be done after :syntax.
  " line-wise
  " the line of which only the one has.
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

augroup myColorschemesAdjustment "{{{1
  au!
  au Colorscheme *       call s:my_commons()
  au Colorscheme neodark call s:my_neodark()
augroup END

" augroup myColorschemesAdjustHighlightDiff "{{{1
"   au FileType git if &diff | call s:gruvbox_diff()
"        \ | else | call s:neodark_diff() |
"          \ endif
"   au OptionSet diff if &ft =~# 'git' | call s:neodark_diff()
"        \ | else | call s:gruvbox_diff() |
"          \ endif
" augroup END

" :colorscheme up to os/gui {{{1
try
  if !executable('xinput')
    "colorscheme molokai_dark
    colorscheme gruvbox

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

catch
  colorscheme murphy
endtry

" Note: have to call here to activate the config
call s:my_commons()
