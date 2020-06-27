" TOML: insert.toml
" Repo: SirVer/ultisnips
" Another: source/ultisnips.vim
" Another: post/ultisnips.vim

nnoremap <A-s> <Nop>

" Mnemonic: Snippet of Ultisnips
nnoremap <silent> <A-s>u :<C-u>UltiSnipsEdit<cr>
" " Note: <A-s><A-u> cannot be mapped!?
" nnoremap <silent> <A-s><M-u> :<C-u>UltiSnipsEdit<cr>

" imap <c-\> <Plug>(ultisnips-expand-or-jump)
" nmap <c-\> <Plug>(ultisnips-expand-or-jump)
" smap <c-\> <Plug>(ultisnips-expand-or-jump)
" xmap <c-\> <Plug>(ultisnips-expand-or-jump)

" inoremap <silent> <Plug>(ultisnips-expand-or-jump) <C-r>=UltiSnips#ExpandSnippetOrJump()<CR>
" snoremap <silent> <Plug>(ultisnips-expand-or-jump) <Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>
" xnoremap <silent> <Plug>(ultisnips-expand-or-jump)  :call UltiSnips#SaveLastVisualSelection()<cr>gvs
" nnoremap <silent> <Plug>(ultisnips-expand-or-jump) <Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>

