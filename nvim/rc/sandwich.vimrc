" From: motion.toml

let g:sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1
" the provided var is incomplete.
unmap sa

" Keymap; Fetch back forgotten buns on Insert Mode
imap <a-s>' <c-o><Plug>(operator-sandwich-add)iw'
imap <a-s>" <c-o><Plug>(operator-sandwich-add)iw"
imap <a-s>` <c-o><Plug>(operator-sandwich-add)iw`
imap <a-s>: <c-o><Plug>(operator-sandwich-add)iw:
imap <a-s>( <c-o><Plug>(operator-sandwich-add)iw(
imap <a-s>) <c-o><Plug>(operator-sandwich-add)iw)
imap <a-s>{ <c-o><Plug>(operator-sandwich-add)iw{
imap <a-s>} <c-o><Plug>(operator-sandwich-add)iw}
imap <a-s>[ <c-o><Plug>(operator-sandwich-add)iw[
imap <a-s>] <c-o><Plug>(operator-sandwich-add)iw]
imap <a-s>< <c-o><Plug>(operator-sandwich-add)iw<
imap <a-s>> <c-o><Plug>(operator-sandwich-add)iw>
imap <a-s>~ <c-o><Plug>(operator-sandwich-add)iw~
" TODO: use for-loop
"let s:my_buns_list = ['"`:(){}<>\~\\]
"for buns in s:my_buns_list
"  imap <a-s>bun <c-o><Plug>(operator-sandwich-add)iwbun
"endfor

" Keymap; Manual Select
"" Manual; Normal Mode
nmap <space>s <Plug>(operator-sandwich-add)
nmap <space>d <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
" Mnemonic: Change
nmap <space>c <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)

"" Manual; Visual Mode
xmap <space>s <Plug>(operator-sandwich-add)
xmap <space>d <Plug>(operator-sandwich-delete)
xmap <space>c <Plug>(operator-sandwich-replace)

"" Keymap; Text Object {{{
" default follows 'timeoutlen' (=1000ms).
"let g:operator#sandwich#timeoutlen = 
"let g:sandwich#recipes = [
"      \   {'buns': ['(', ')']}
"      \   {'buns': ['((', '))']}
"      \   {'buns': ['{' '}']}
"      \ ]

"   unlike <Plug>(textobj-sandwich-literal-query-i),
" accords to 'g:sandwich#recipes' and 'g:textobj#sandwich#recipes'.
"   if g:textobj#sandwich#recipes is set, g:textobj#sandwich#default_recipes
" will be ignored.
"onoremap <silent><expr> is textobj#sandwich#query('o', 'i')
"xnoremap <silent><expr> is textobj#sandwich#query('x', 'i')
"onoremap <silent><expr> as textobj#sandwich#query('o', 'a')
"xnoremap <silent><expr> as textobj#sandwich#query('x', 'a')
"}}}

"" Remap; In Case {{{
"onoremap i i
"xnoremap i i
"onoremap i i
"xnoremap i i
"onoremap i i
"onoremap i i
"
"onoremap a a
"xnoremap a a
"onoremap a a
"xnoremap a a
"onoremap a a
"xnoremap a a
""}}}
