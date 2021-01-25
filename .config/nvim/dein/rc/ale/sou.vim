scriptencoding utf-8
" TOML: appearance.toml
" Repo: dense-analysis/ale

let g:ale_disable_lsp = 1

let g:ale_sign_error = ''
let g:ale_sign_warning = ''

if dein#tap('repmo-vim')
  map <expr> ]x repmo#Key('<Plug>(ale_next)', '<Plug>(ale_previous)')
  map <expr> [x repmo#Key('<Plug>(ale_previous)', '<Plug>(ale_next)')
else
  map ]x <Plug>(ale_next)
  map [x <Plug>(ale_previous)
endif

hi! link ALEErrorSign Identifier
hi! ALEError cterm=bold,reverse gui=bold,reverse

hi! link ALEWarningSign WarningMsg
hi! ALEWarning cterm=bold,reverse,undercurl gui=bold,reverse,undercurl

