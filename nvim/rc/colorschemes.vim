" From: appearance.toml
" Repo: flazz/vim-colorschemes

function! s:colorschemes_neodark() abort "{{{1
  let g:neodark#use_256color    = 1 " default: 0
  let g:neodark#italic          = 1 " default: 0
  let g:neodark#terminal_transparent      = 1 " default: 0
  let g:neodark#use_custom_terminal_theme = 1 " default: 0
  colorscheme neodark
  hi DiffAdd ctermfg=142 guifg=#b8bb26
  hi DiffRemove ctermfg=167 guifg=#fb4934
  hi DiffChange ctermfg=108 guifg=#8ec07c
  "hi DiffText 
  hi diffAdded ctermfg=142 guifg=#b8bb26
  hi diffRemoved ctermfg=167 guifg=#fb4934
  hi diffChanged ctermfg=108 guifg=#8ec07c

  hi diffFile ctermfg=208 guifg=#fe8019
  hi diffNewFile ctermfg=214 guifg=#fabd2f

  hi diffLine ctermfg=109 guifg=#83a598
endfunction "}}}

if exists("g:nyaovim_version")
  colorscheme solarized8_light_flat
elseif !exists("g:GuiLoaded")
  " on CUI
  let g:solarized_termcolors=256
  colorscheme solarized8_light_flat
  "colorscheme solarized8_dark_flat
else
  call <SID>colorschemes_neodark()
endif

" Gruvbox's
finish
" Path: colors/gruvbox.vim @651
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
call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)
