scriptencoding utf-8
" TOML: appearance.toml
" Repo: dense-analysis/ale

let g:ale_disable_lsp = 1

let g:ale_sign_warning = ''
let g:ale_sign_error = ''

let g:ale_echo_msg_format = '[%linter%] %code: %%s'

let g:ale_linters_ignore = {
      \ 'markdown': [
      \   'languagetool',
      \ ],
      \ }

if dein#tap('repmo-vim')
  map <expr> ]x repmo#Key('<Plug>(ale_next)', '<Plug>(ale_previous)')
  map <expr> [x repmo#Key('<Plug>(ale_previous)', '<Plug>(ale_next)')
else
  map ]x <Plug>(ale_next)
  map [x <Plug>(ale_previous)
endif

hi! link ALEWarningSign Identifier
hi! ALEWarning cterm=bold,reverse gui=bold,reverse

hi! link ALEErrorSign WarningMsg
hi! ALEError cterm=bold,reverse,undercurl gui=bold,reverse,undercurl

