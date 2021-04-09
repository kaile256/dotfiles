" From: shell.toml
" Repo: thinca/vim-quickrun
" Another: source/quickrun.vim
" Ref: source/quickrun-unittest.vim

nmap \R <Plug>(quickrun-op)
nnoremap <silent> \Rr :<C-u> QuickRun -mode n -input =@+<CR>
nnoremap <silent> \RR :<C-u> QuickRun -mode n -input =@+<CR>
xnoremap <silent> \R  :QuickRun -mode v -input =@+<CR>

augroup myQuickrunAdd
  au FileType quickrun call s:quickrun_keymaps()
augroup END

function! s:quickrun_keymaps() abort
  noremap <script><silent><buffer> <SID>(quickrun-holding-syn)
        \ <c-w>p
        \ <SID>(quickrun-holding-syn)
        \ <c-w>p
endfunction

