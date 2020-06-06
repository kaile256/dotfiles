" TOML: default.toml
" Repo: AndrewRadev/undoquit.vim

nnoremap <C-w>c :call undoquit#SaveWindowQuitHistory()<CR><C-w>c

nnoremap <silent> <C-w>u :Undoquit<CR>
nnoremap <silent> <C-w>U :UndoquitTab<CR>

" Mnemonic: Eliminate current tabpage
nnoremap <silent> ZE :<C-u>UndoableTabclose <CR>
" Mnemonic: Close tabpage
nnoremap <silent> ZC :<C-u>w <bar> UndoableTabclose <CR>
