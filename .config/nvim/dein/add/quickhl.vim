" From: appearance.toml
" Repo: t9md/vim-quickhl
" Another: post/quickhl.vim

"let g:quickhl_manual_colors = [
"      \ "gui=bold ctermfg=16  ctermbg=153 guifg=#ffffff guibg=#0a7383",
"      \ "gui=bold ctermfg=7   ctermbg=1   guibg=#a07040 guifg=#ffffff",
"      \ "gui=bold ctermfg=7   ctermbg=2   guibg=#4070a0 guifg=#ffffff",
"      \ "gui=bold ctermfg=7   ctermbg=3   guibg=#40a070 guifg=#ffffff",
"      \ ]

" no highlight on cword on CursorMoved
let g:quickhl_cword_enable_at_startup = 0

nmap m* <Plug>(quickhl-manual-this-whole-word)
xmap m* <Plug>(quickhl-manual-this-whole-word)

nmap mc <Plug>(quickhl-manual-reset)
xmap mc <Plug>(quickhl-manual-reset)
nmap m<c-h> <Plug>(quickhl-manual-reset)
xmap m<c-h> <Plug>(quickhl-manual-reset)
nmap m<BS> <Plug>(quickhl-manual-reset)
xmap m<BS> <Plug>(quickhl-manual-reset)

" nmap m <Plug>(operator-quickhl-manual-this-motion)
nmap <silent> m :call <SID>quickhl_with_mark()<cr>

function! s:quickhl_with_mark() abort
  let char = nr2char(getchar())
  if char =~# '[ia]$'
    " accept textobj, too.
    let char .= nr2char(getchar())
  endif
  " set 'i' or 'a' as a mark anyway if the motion is a textobj.
  exe 'norm! m'. char[0]
  exe "norm \<Plug>(operator-quickhl-manual-this-motion)". char
endfunction
