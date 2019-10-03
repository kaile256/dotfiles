" From: nvim/init.vim

if execute('map <c-w>q') != '' || execute('map <c-w><c-q>') != ''
  noremap <c-w>q <Nop>
  noremap <c-w><c-q> <Nop>
endif

nnoremap <c-w>Q :<c-u>q! <cr>
nnoremap <c-w>Z :<c-u>qa  <cr>

" Redraw; No Highlight
inoremap <silent> <c-l>              <Cmd>noh<cr><c-o><c-l>
nnoremap <silent> <c-space><space>   :<c-u>noh      <cr><c-l>
nnoremap <silent> <c-space><c-space> :<c-u>noh      <cr><c-l>
nnoremap <silent> <a-space><space>   :QuickClose<cr>
nnoremap <silent> <a-space><a-space> :QuickClose<cr>
command! QuickClose :call <SID>quick_close()
function! s:quick_close() abort "{{{1
  " Note: it's almost the same as smart_diffoff()
  let l:current = bufwinnr('%')
  windo
        \ if &bt ==# 'nofile'
        \ || &bt ==# 'nowrite'
        \ || &bt ==# 'quickfix'
        \ || bufname('%') =~# 'fugitive:\/\/'
        \ |  quit
        \ | endif
  " Note: why, no range allowed on :wincmd in spite of :help.
  "exe l:current .'wincmd w'
  exe 'norm! '. l:current .'w'
endfunction "}}}1

" Close; Tab-page
noremap <silent> <c-w>C :<c-u>tabclose<cr>

" Move Window
nnoremap <c-w>h <c-w>H
nnoremap <c-w>j <c-w>J
nnoremap <c-w>k <c-w>K
nnoremap <c-w>l <c-w>L

" Resize
nnoremap <C-left>  <c-w>>
nnoremap <C-down>  <c-w>-
nnoremap <C-up>    <c-w>+
nnoremap <C-right> <c-w><
nnoremap <A-left>  <c-w>>
nnoremap <A-down>  <c-w>-
nnoremap <A-up>    <c-w>+
nnoremap <A-right> <c-w><

" Resize; Neutralize
nnoremap <c-w>0 <c-w>=

augroup OnEditNewNoFixedWindow
  au! BufWinLeave * if &l:winfixwidth || &l:winfixheight | setl nowinfixwidth nowinfixheight
augroup END
