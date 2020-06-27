" TOML: insert.toml
" Repo: SirVer/ultisnips
" Another: source/ultisnips.vim
" Another: post/ultisnips.vim

nnoremap <A-s> <Nop>

" Mnemonic: Snippet of Ultisnips
nnoremap <silent> <A-s>p :<C-u>UltiSnipsEdit<cr>
nmap <A-s><A-p> <A-s>p
" " Note: <A-s><A-u> cannot be mapped!?
" nnoremap <silent> <A-s><M-u> :<C-u>UltiSnipsEdit<cr>

" Note: mappings of coc-snippets won't support some flags, regex and other features.
inoremap <silent> <Plug>UltiSnipExpandOrJump <C-r>=UltiSnips#ExpandSnippetOrJump()<CR>
snoremap <silent> <Plug>UltiSnipExpandOrJump <Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>
xnoremap <silent> <Plug>UltiSnipExpandOrJump  :call UltiSnips#SaveLastVisualSelection()<cr>gvs
nnoremap <silent> <Plug>UltiSnipExpandOrJump <Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>

imap <c-\> <Plug>UltiSnipExpandOrJump
nmap <c-\> <Plug>UltiSnipExpandOrJump
smap <c-\> <Plug>UltiSnipExpandOrJump
xmap <c-\> <Plug>UltiSnipExpandOrJump
