" From: tool.toml

let g:sandwich_no_default_key_mappings = 1

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
"" Mnemonic; Midst
"omap m <Plug>(textobj-sandwich-query-i)
"xmap m <Plug>(textobj-sandwich-query-i)
"omap m <plug>(textobj-sandwich-query-i)
"xmap m <plug>(textobj-sandwich-query-i)
"omap m <Plug>(textobj-sandwich-query-i)
"omap m <Plug>(textobj-sandwich-query-i)
"
"omap M <Plug>(textobj-sandwich-query-a)
"xmap M <Plug>(textobj-sandwich-query-a)
"omap M <Plug>(textobj-sandwich-query-a)
"xmap M <Plug>(textobj-sandwich-query-a)
"omap M <Plug>(textobj-sandwich-query-a)
"xmap M <Plug>(textobj-sandwich-query-a)
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
