" From: insert.toml
" Repo: Shougo/neosnippet.vim
" Another: source/neosnippet.vim
" Else: once/smaps.vim
" Snip: Shougo/neosnippet-snippets/neosnippets

" ':map' for 'noxi' modes fails to remove any place-holder
imap <c-\> <Plug>(neosnippet_jump_or_expand)
smap <c-\> <Plug>(neosnippet_jump_or_expand)
xmap <c-\> <Plug>(neosnippet_jump_or_expand)
nmap <c-\> <Plug>(neosnippet_jump_or_expand)

nmap <a-s><a-p> <sid>

nmap <sid>e     <SID>(neosnipet-edit)
nmap <sid><a-e> <SID>(neosnipet-edit)
nmap <sid>s     <SID>(neosnipet-split)
nmap <sid><a-s> <SID>(neosnipet-split)
nmap <sid>v     <SID>(neosnipet-vsplit)
nmap <sid><a-v> <SID>(neosnipet-vsplit)
nmap <sid>t     <SID>(neosnipet-tabe)
nmap <sid><a-t> <SID>(neosnipet-tabe)

nnoremap <silent> <SID>(neosnipet-edit)
      \ :<c-u>call <SID>neosnipet_edit()<cr>
nnoremap <silent> <SID>(neosnipet-split)
      \ :<c-u>call <SID>neosnipet_edit('sp')<cr>
nnoremap <silent> <SID>(neosnipet-vsplit)
      \ :<c-u>call <SID>neosnipet_edit('vs')<cr>
nnoremap <silent> <SID>(neosnipet-tabe)
      \ :<c-u>call <SID>neosnipet_edit('tab sp')<cr>

function! s:neosnipet_edit(...) abort
  let open = a:0 > 0 ? join(a:000) .'|' : ''
  if &ft == 'toml' && !empty(matchstr(expand('%:p'), '/.vim/'))
    let dein_toml = 'toml_dein'
    exe open 'NeoSnippetEdit' dein_toml
    return
  endif

  exe open 'NeoSnippetEdit'
endfunction

" Note: is_after_space() often conflicts w/ snippet_jump() feature. {{{
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>is_after_space() ? "\<TAB>" :
"      \ neosnippet#mappings#jump_or_expand_impl()
"
"function! s:is_after_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"}}}
" " Wrapper to echo when no snippet {{{1
" " Note: \<c-u>g fails to remove place-holders
" nmap <expr><silent> <SID>(neosnippet-try)
"      \ neosnippet#expandable_or_jumpable()
"      \ ? "\<Plug>(neosnippet_jump_or_expand)"
"      \ : ":<c-u>echo 'no snippet!'<cr>"
" xmap <expr><silent> <SID>(neosnippet-try)
"      \ neosnippet#expandable_or_jumpable()
"      \ ? "\<Plug>(neosnippet_jump_or_expand)"
"      \ : ":<c-u>echo 'no snippet!'<cr>"

" " TODO: make no split for i_CTRL-a
" imap <expr><silent> <SID>(neosnippet-try)
"      \ neosnippet#expandable_or_jumpable()
"      \ ? "\<Plug>(neosnippet_jump_or_expand)"
"      \ : "<c-o>:<c-u>echo 'no snippet!'<cr>"
" smap <expr><silent> <SID>(neosnippet-try)
"      \ neosnippet#expandable_or_jumpable()
"      \ ? "\<Plug>(neosnippet_jump_or_expand)"
"      \ : "<c-o>:<c-u>echo 'no snippet!'<cr>"

" " noremap for 'noxi' modes fails to remove any place-holder
" inoremap <script> <c-\> <SID>(neosnippet-try)
" snoremap <script> <c-\> <SID>(neosnippet-try)
" xnoremap <script> <c-\> <SID>(neosnippet-try)
" nnoremap <script> <c-\> <SID>(neosnippet-try)

" " <TAB> mapping "{{{1
" "" Note: <TAB>/<space> would expand unintentionally
" "   e.g., '" ' or '{ ' for fold, '"{{{'
" "imap <silent><expr> <c-i>
" "      \ neosnippet#expandable_or_jumpable()
" "      \ ? "\<Plug>(neosnippet_jump_or_expand)"
" "      \ : "\<c-i>"
