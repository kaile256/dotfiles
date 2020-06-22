" TOML: browse.toml
" Repo: liuchengxu/vista.vim
" Another: source/vista.vim

" :Vista is same as `:Vista ctags`.
" '!' to close vista-buffer
" '!!' to toggle vista-buffer.
" Mnemonic: Outline
nnoremap <silent> <A-x>o     :<C-u>Vista coc<CR>
nnoremap <silent> <A-x><A-o> :<C-u>Vista coc<CR>
