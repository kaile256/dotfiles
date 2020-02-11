" From: insert.toml
" Repo: Shougo/neosnippet.vim

nnoremap <silent> <a-s><a-p><a-e> :<c-u>NeoSnippetEdit<cr>
nnoremap <silent> <a-s><a-p><a-s> :<c-u>sp  <bar>NeoSnippetEdit<cr>
nnoremap <silent> <a-s><a-p><a-v> :<c-u>vs  <bar>NeoSnippetEdit<cr>
nnoremap <silent> <a-s><a-p><a-t> :<c-u>tab sp <bar>NeoSnippetEdit<cr>

" Note: is_after_space() often conflicts w/ snippet_jump() feature. {{{
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>is_after_space() ? "\<TAB>" :
"      \ neosnippet#mappings#expand_or_jump_impl()
"
"function! s:is_after_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"}}}

" Note: neosnippet activate only on insert mode or select mode.
nmap <expr><silent> <c-\>
      \ neosnippet#expandable_or_jumpable()
      \ ? "g<c-h>\<Plug>(neosnippet_expand_or_jump)"
      \ : ":<c-u>echo 'no snippet!'<cr>"
imap <expr><silent> <c-\>
      \ neosnippet#expandable_or_jumpable()
      \ ? "\<Plug>(neosnippet_expand_or_jump)"
      \ : "<c-o>:<c-u>echo 'no snippet!'<cr>"
xmap <expr><silent> <c-\>
      \ neosnippet#expandable_or_jumpable()
      \ ? "<c-g>\<Plug>(neosnippet_expand_or_jump)"
      \ : ":<c-u>echo 'no snippet!'<cr>"
smap <expr><silent> <c-\>
      \ neosnippet#expandable_or_jumpable()
      \ ? "\<Plug>(neosnippet_expand_or_jump)"
      \ : "<c-o>:<c-u>echo 'no snippet!'<cr>"

"" Note: <TAB>/<space> would expand unintentionally
"   e.g., '" ' or '{ ' for fold, '"{{{'
"imap <silent><expr> <c-i>
"      \ neosnippet#expandable_or_jumpable()
"      \ ? "\<Plug>(neosnippet_expand_or_jump)"
"      \ : "\<c-i>"
