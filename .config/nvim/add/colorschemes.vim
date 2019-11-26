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

if exists('g:nyaovim_version')
  colorscheme solarized8_light_flat
  "elseif !exists("g:GuiLoaded")
  "  " on CUI
  "  let g:solarized_termcolors=256
  "  colorscheme solarized8_light_flat
  "  "colorscheme solarized8_dark_flat
else
  function! s:colorschemes_neodark() abort "{{{2
    let g:neodark#use_256color    = 1 " default: 0
    let g:neodark#italic          = 1 " default: 0
    "if has('mac')
    "  "let g:neodark#terminal_transparent      = 0 " default: 0
    "  "let g:neodark#use_custom_terminal_theme = 0 " default: 0
    "endif
    colorscheme neodark

    " Note: should be done after :coloscheme.
    " 'syntax on' overrides syntax; 'enable' keeps already-defined syntax
    syntax on

    hi Search ctermfg=236 ctermbg=180 guifg=#3e120a guibg=#ebb556
    hi NormalFloat guibg=#1a0210 guifg=#957474

    " for &diff {{{3
    " Note: reverse keeps text color;
    "       ':hi **bg=foo' will white out text's characters.
    " Note: :hi should be done after :syntax.
    " line-wise
    " the line of which only the one has.
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
  endfunction "}}}2
  call s:colorschemes_neodark()
endif

" coc.nvim supports
hi HighlightedyankRegion ctermfg=232 ctermbg=66 guifg=#000000 guibg=#df5f29
hi CocErrorHighlight ctermfg=Red  guifg=#ff0000

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
