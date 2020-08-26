" Else: add/switch.vim
" Else: source/switch.vim

if &ft !~# 'react' | finish | endif

" props: readonly in the component; defined in parent component
" state: defined in the component
let b:switch_custom_definitions = [
      \ ['serviceWorker.register();', 'serviceWorker.unregister();'],
      \ {
      \   '\<props\>': 'state',
      \   '\<state\>': 'props',
      \ },
      \ ['margin-block-start', 'margin-block-end'],
      \ ['margin-inline-start', 'margin-inline-end'],
      \ ]

