" TOML: textobj.toml
" Repo: saaguero/vim-textobj-pastedtext

" Mnemonic: Get the Last entry.
let g:pastedtext_select_key = 'gl'

" " Mnemonic: Get the Beginer. (`gb` is default)
" let g:pastedtext_select_key = 'gb'

nmap <SID>(select-pastedtext) v<Plug>(textobj-pastedtext-text)
exe 'nmap' g:pastedtext_select_key '<SID>(select-pastedtext)'

exe 'omap' g:pastedtext_select_key '<Plug>(textobj-pastedtext-text)'
exe 'xmap' g:pastedtext_select_key '<Plug>(textobj-pastedtext-text)'
