" TOML: web.toml
" Repo: romgrk/todoist.nvim
" Another: post/todoist.vim

let g:todoist = {}

let g:todoist['key'] = readfile($MY_API_TOKEN .'/todoist')[0]

" let g:todoist['default'] = 'Inbox' " default: 'Inbox'

let g:todoist['icons'] = {
      \ 'unchecked': '  ',
      \ 'checked':   '  ',
      \ 'loading':   '  ',
      \ 'error':     '  ',
      \ }

