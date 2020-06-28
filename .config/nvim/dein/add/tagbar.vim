" From: browse.toml
" Repo: majutsushi/tagbar
" Another: source/tagbar.vim

" {flags} on :TagbarOpen
" 'f': Focus on tagbar on open (as if g:tagbar_autofocus == 1)
" 'j': Jump to tagbar if already open
" 'c': Close tagbar on tag selection (as if g:tagbar_autoclose == 1)
" Mnemonic: get Indexes
nnoremap <silent> <A-x>i     :<c-u>TagbarOpen fjc<cr>
nnoremap <silent> <A-x><A-i> :<c-u>TagbarOpen fjc<cr>
