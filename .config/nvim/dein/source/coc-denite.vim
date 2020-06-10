" TOML: denite.toml
" Repo: neoclide/coc-denite
" Ref: add/denite.vim

" Mnemonic: Indexed symbols
nnoremap <space>nci :<C-u> Denite -start-filter coc-symbols <CR>
nnoremap <space>ncc :<C-u> Denite -start-filter coc-command <CR>
nnoremap <space>ncd :<C-u> Denite -start-filter coc-extension <CR>
nnoremap <space>ncx :<C-u> Denite -start-filter coc-service <CR>
nnoremap <space>ncs :<C-u> Denite -start-filter coc-workspace <CR>
nnoremap <space>ncl :<C-u> Denite -start-filter coc-link <CR>
nnoremap <space>ncj :<C-u> Denite -start-filter coc-jump-locations <CR>
