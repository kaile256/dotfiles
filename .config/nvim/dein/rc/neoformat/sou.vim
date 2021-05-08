" TOML: default.toml
" Repo: sbdchd/neoformat

let g:neoformat_try_formatprg = 1 " Useless?

" basic format: failsafe config when a filetype formatter is not found.
let g:neoformat_basic_format_trim = 1

" g:neoformat_enabled_{filetype}
let g:neoformat_enabled_haskell = [
      \ 'brittany',
      \ 'stylishhaskell',
      \ 'ormolu',
      \ 'floskell',
      \ 'hindent',
      \ 'sortimports'
      \ ]
