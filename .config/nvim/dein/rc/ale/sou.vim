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

function! s:disable_some_lints(linters) abort
  const pat_my_repo = $USER .'/[^/]\+/\.git'
  if get(b:, 'git_dir', '') !~# pat_my_repo | return | endif
  let b:ale_linters_ignore = a:linters
endfunction
function! s:disable_lints_on_localvimrc(linters) abort
  if expand('%:t') ==# '.local.vimrc'
    let b:ale_linters_ignore = a:linters
  endif
endfunction
augroup Ale/Sou-DisableLocalLint
  au FileType vim call s:disable_some_lints(['vint'])
  if dein#tap('vim-localvimrc') || dein#tap('vim-localrc')
    au FileTYpe vim call s:disable_lints_on_localvimrc(['vint'])
  endif
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
hi! ALEError cterm=bold,reverse,undercurl gui=bold,reverse,undercurl

