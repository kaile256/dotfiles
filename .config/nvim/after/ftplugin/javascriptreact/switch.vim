" Else: add/switch.vim
" Else: source/switch.vim

" props: readonly in the component; defined in parent component
" state: defined in the component
let b:switch_custom_definitions = [
      \ ['serviceWorker.register();', 'serviceWorker.unregister();'],
      \ {
      \   '\<props\>': 'state',
      \   '\<state\>': 'props',
      \ }
      \ ]
