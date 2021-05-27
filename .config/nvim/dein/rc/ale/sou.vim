scriptencoding utf-8
" TOML: appearance.toml
" Repo: dense-analysis/ale

let g:ale_sign_priority = 10

let g:ale_disable_lsp = 1

let g:ale_sign_warning = ''
let g:ale_sign_error = ''

let g:ale_echo_msg_format = '[%linter%] %code: %%s'

let g:ale_linters_ignore = {
      \ 'markdown': [
      \   'languagetool',
      \ ],
      \ }
augroup Ale/Sou/EnableOnlyIfLanguageServerIsInactive
  let g:ale_enabled = 0
  function! s:enable_if_language_server_is_inactive(...) abort
    if v:lua.vim.lsp.buf.server_ready() | return | endif
    ALEEnableBuffer
  endfunction
  au BufRead * call timer_start(3000,
        \ expand('<SID>') .'enable_if_language_server_is_inactive')
augroup END

if dein#tap('repmo-vim')
  map <expr> ]x repmo#Key('<Plug>(ale_next)', '<Plug>(ale_previous)')
  map <expr> [x repmo#Key('<Plug>(ale_previous)', '<Plug>(ale_next)')
else
  map ]x <Plug>(ale_next)
  map [x <Plug>(ale_previous)
endif

hi! link ALEWarningSign Identifier
hi! ALEWarning cterm=undercurl gui=undercurl

hi! link ALEErrorSign WarningMsg
hi! ALEError cterm=bold,undercurl gui=bold,undercurl

