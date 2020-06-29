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

nnoremap <A-s> <Nop>
nnoremap <silent> <a-s><a-n> :<C-u>call <SID>neosnipet_edit()<CR>

function! s:neosnipet_edit(...) abort
  " let open = a:0 > 0 ? join(a:000) .'|' : ''
  let open = 'sp | wincmd T | vs'
  if winwidth(0) > 2 * (&tw ? &tw : 80)
    let open = 'bot vs'
  elseif winheight(0) > 20
    let open = 'bel sp'
  endif

  if &ft ==# 'toml' && !empty(matchstr(expand('%:p'), '/.vim/'))
    let dein_toml = 'toml_dein'
    exe open $VIM_ANOTHER_HOME .'/neosnippet/'. dein_toml .'.snip'
    return
  endif

  exe open $VIM_ANOTHER_HOME .'/neosnippet/'. &ft .'.snip'
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
