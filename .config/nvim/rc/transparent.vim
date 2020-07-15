" Ref: post/colorschemes.vim

function! s:transparent() abort
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

if exists('#myTransparent') | au! myTransparent
endif
augroup myTransparent
  au Colorscheme * call s:transparent()
augroup END

call s:transparent()
