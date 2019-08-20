" From: tool.toml
let g:sandwich_no_default_key_mappings = 1

" Sandwich; Keymap {{{
" Keymap; Evacuation for 's' {{{0
"noremap S s

" Keymap; Manual Select {{{
" Mnemonic: 'Change' s for 'Sandwich'
nmap S  <Plug>(operator-sandwich-add)
nmap ds <Plug>(operator-sandwich-delete)
nmap cs <Plug>(operator-sandwich-replace)

"" Visual Mode
xmap S  <Plug>(operator-sandwich-add)
xmap ds <Plug>(operator-sandwich-delete)
xmap cs <Plug>(operator-sandwich-replace)
"}}}

" Keymap; Auto Select {{{
omap i[ <Plug>(textobj-sandwich-auto-i)
xmap i[ <Plug>(textobj-sandwich-auto-i)
omap i] <Plug>(textobj-sandwich-auto-i)
xmap i] <Plug>(textobj-sandwich-auto-i)
omap i' <Plug>(textobj-sandwich-auto-i)
omap i' <Plug>(textobj-sandwich-auto-i)

omap a[ <Plug>(textobj-sandwich-auto-a)
xmap a[ <Plug>(textobj-sandwich-auto-a)
omap a] <Plug>(textobj-sandwich-auto-a)
xmap a] <Plug>(textobj-sandwich-auto-a)
omap a' <Plug>(textobj-sandwich-auto-a)
xmap a' <Plug>(textobj-sandwich-auto-a)
"}}}
"}}}
