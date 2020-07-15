" TOML: textobj.toml
" Repo: saaguero/vim-textobj-pastedtext

let g:pastedtext_select_key = 'g<space>'

exe 'omap' g:pastedtext_select_key '<Plug>(textobj-pastedtext-text)'
exe 'xmap' g:pastedtext_select_key '<Plug>(textobj-pastedtext-text)'
