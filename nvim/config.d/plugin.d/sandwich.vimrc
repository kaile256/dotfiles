" From: tool.toml

let g:sandwich_no_default_key_mappings = 0

" Sandwich; Keymap {{{
" Keymap; Evacuation for 's' {{{0
"noremap S s

" Keymap; Manual Select {{{
"" Manual; Normal Mode
" Mnemonic: 'Change' s for 'Sandwich'

nmap S        <Plug>(operator-sandwich-add)
nmap <space>s <Plug>(operator-sandwich-add)
nmap <space>d <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap <space>c <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)

"" Manual; Visual Mode

xmap S        <Plug>(operator-sandwich-add)
xmap <space>s <Plug>(operator-sandwich-add)
xmap <space>d <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap <space>c <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap d        <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap c        <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
"}}}

" Keymap; Text Object {{{
" Mnemonic; Midst
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

" Keymap; In Case {{{
onoremap i i
xnoremap i i
onoremap i i
xnoremap i i
onoremap i i
onoremap i i

onoremap a a
xnoremap a a
onoremap a a
xnoremap a a
onoremap a a
xnoremap a a
"}}}
