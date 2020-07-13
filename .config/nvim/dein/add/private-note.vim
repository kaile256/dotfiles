" TOML: private.toml
" Repo: $DEIN_PRIVATE_HOME/vim-private-note
" Another: source/private-note.vim

let s:todo_note = $MY_MEMO .'/.backlog/todo.md'
let s:Open_todo = 'PrivateNote '. s:todo_note .'<CR>'

exe 'nnoremap <silent> <c-w>M        :<c-u>     '. s:Open_todo
exe 'nnoremap <silent> <c-w>m        :<c-u>bel  '. s:Open_todo
exe 'nnoremap <silent> <c-w><space>m :<c-u>vert '. s:Open_todo
exe 'nnoremap <silent> <c-w>gm       :<c-u>tab  '. s:Open_todo

" nnoremap <silent> <c-w>M        :<c-u>PrivateNote<cr>
" nnoremap <silent> <c-w>m        :<c-u>bel  PrivateNote<cr>
" nnoremap <silent> <c-w><space>m :<c-u>vert bel PrivateNote<cr>
" nnoremap <silent> <c-w>gm       :<c-u>tab  PrivateNote<cr>
