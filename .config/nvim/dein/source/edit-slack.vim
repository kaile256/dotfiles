" From: web.toml
" Repo: yaasita/edit-slack.vim
" Another: add/edit-slack.vim

let s:token_dir = $MY_API_TOKEN .'/slack/vim-edit-slack'
let s:token = {fname -> readfile(s:token_dir .'/'. fname)[0]}

let g:yaasita_slack_workspaces = {
      \ 'private': s:token('private'),
      \ }

let s:default_workspace = s:token('private')
let g:yaasita_slack_token = s:default_workspace

if exists('#myEditSlackSource') | au! myEditSlackSource
endif
augroup myEditSlackSource
  au FileType slack call s:slack_keymaps()
augroup END

function! s:slack_keymaps() abort
  nmap <buffer> <a-x><a-v> SlackSidebar
  nmap <buffer> <a-x>v     SlackSidebar
endfunction
