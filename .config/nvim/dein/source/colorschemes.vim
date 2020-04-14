" From: appearance.toml
" Repo: flazz/vim-colorschemes
" Another: post/colorschemes.vim

augroup myColorschemesSo
  if exists('#myColorschemesSo') | au! myColorschemesSo
  endif
  au Colorscheme * ++nested call s:my_commons()
  " au Colorscheme * ++nested call s:up_to_environment()
augroup END

function! s:my_commons() abort
  hi! HighlightedyankRegion ctermfg=232 ctermbg=66 guifg=#000000 guibg=#df5f29
  hi! CocErrorHighlight     ctermfg=red guifg=#ff0000

  hi! Search      ctermfg=236 ctermbg=180 guifg=#3e120a guibg=#ebb556
  " NormalFloat: color for winblend, or floating windows
  hi! NormalFloat ctermfg=236 ctermbg=180 guibg=#3a192c guifg=#9f994a

  hi! Comment guifg=#71716e

  hi! CursorIM guibg=#fabd1f
  hi! MatchParen ctermfg=magenta ctermbg=yellow guifg=#e6c50f guibg=#8924ff

  "hi Folded ctermfg=59 ctermbg=236 guifg=#5f5f5f guibg=#303030
endfunction

" function s:up_to_environment() abort
"   " if $ALACRITTY_LOG =~# '\.log$'
"   "   runtime rc/transparent.vim
"   " endif
" endfunction
