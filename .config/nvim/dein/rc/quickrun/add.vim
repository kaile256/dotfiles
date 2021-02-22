" From: shell.toml
" Repo: thinca/vim-quickrun
" Another: source/quickrun.vim
" Ref: source/quickrun-unittest.vim

nmap \S <Plug>(quickrun-op) | " Mnemonic: Source the buffer

nnoremap <silent> <space>qq :QuickRun -mode n -input =@+<CR>
xnoremap <silent> <space>qq :QuickRun -mode v -input =@+<CR>

augroup myQuickrunAdd
  au FileType quickrun call s:quickrun_keymaps()
augroup END

function! s:quickrun_keymaps() abort
  noremap <script><silent><buffer> <SID>(quickrun-holding-syn)
        \ <c-w>p
        \ <SID>(quickrun-holding-syn)
        \ <c-w>p
endfunction
