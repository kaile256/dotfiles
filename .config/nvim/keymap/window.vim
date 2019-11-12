" From: nvim/init.vim

if execute('nmap <c-w>q') !=# ''
      \ || execute('nmap <c-w><c-q>') !=# ''
  noremap <c-w>q <Nop>
  noremap <c-w><c-q> <Nop>
endif

nnoremap <c-w>Z ZZ
nnoremap <c-w>Q ZQ
nnoremap Zz ZZ
nnoremap Zq ZQ
" Mnemonic: $ yes
nnoremap <silent> Zy :<c-u>qa  <cr>
nnoremap <silent> ZY :<c-u>qa! <cr>

nnoremap <silent> <c-w><space>n :<c-u>vnew<cr>

nnoremap <c-w>h <c-w>H
nnoremap <c-w>j <c-w>J
nnoremap <c-w>k <c-w>K
nnoremap <c-w>l <c-w>L

nnoremap <silent> <c-w>C :<c-u>tabclose<cr>
nnoremap <silent> <c-w>O :<c-u>tabonly<cr>
nnoremap <c-w>gt <c-w>v<c-w>T
nnoremap <c-w>gT <c-w>v<c-w>T

" Redraw; No Highlight
inoremap <silent> <c-l>              <Cmd>noh<cr><c-o><c-l>
nnoremap <silent> <c-space><space>   :<c-u>noh      <cr><c-l>
nnoremap <silent> <c-space><c-space> :<c-u>noh      <cr><c-l>

" Resize; Neutralize
nnoremap <c-w>0 <c-w>=

noremap <silent> <c-w>o     <c-w>o:diffoff!<cr>
noremap <silent> <c-w><c-o> <c-w>o:diffoff!<cr>

" Resize {{{1
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>
nnoremap <c-down> <c-w>-
nnoremap <c-up> <c-w>+
