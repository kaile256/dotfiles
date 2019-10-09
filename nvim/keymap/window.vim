" From: nvim/init.vim

if execute('map <c-w>q') !=# '' || execute('map <c-w><c-q>') !=# ''
  noremap <c-w>q <Nop>
  noremap <c-w><c-q> <Nop>
endif

nnoremap <c-w>Q :<c-u>q! <cr>
nnoremap <c-w>Z :<c-u>qa  <cr>

nnoremap <c-w>h <c-w>H
nnoremap <c-w>j <c-w>J
nnoremap <c-w>k <c-w>K
nnoremap <c-w>l <c-w>L

nnoremap <silent> <c-w>C :<c-u>tabclose<cr>
nnoremap <silent> <c-w>O :<c-u>tabonly<cr>
nnoremap <c-w><c-t> <c-w>v<c-w>T
nnoremap <c-w><a-t> <c-w>v<c-w>T

" Redraw; No Highlight
inoremap <silent> <c-l>              <Cmd>noh<cr><c-o><c-l>
nnoremap <silent> <c-space><space>   :<c-u>noh      <cr><c-l>
nnoremap <silent> <c-space><c-space> :<c-u>noh      <cr><c-l>
nnoremap <silent> <a-space><space>   :QuickClose<cr>
nnoremap <silent> <a-space><a-space> :QuickClose<cr>
onoremap <expr> q (v:operator ==# 'd')? ':<c-u>call window#weed_out()<cr>': 'q'
nnoremap <expr> <c-w><c-o> (&diff)? ':<c-u>call window#weed_out()<cr><c-w>o': '<c-w>o'
nnoremap <expr> <c-w>o     (&diff)? ':<c-u>call window#weed_out()<cr><c-w>o': '<c-w>o'

" Resize; Neutralize
nnoremap <c-w>0 <c-w>=

augroup OnEditNewNoFixedWindow
  au! BufWinLeave * if &l:winfixwidth || &l:winfixheight | setl nowinfixwidth nowinfixheight
augroup END

" Resize {{{
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>
nnoremap <c-down> <c-w>-
nnoremap <c-up> <c-w>+
"}}}
