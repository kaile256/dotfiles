" TOML: memo.toml

let g:memolist_path = '~/CloudNote/'

" suffix type (default: markdown)
"let g:memolist_memo_suffix = 'txt'

"" Template
' the filename template is written on should be '"suffix" + .txt"
" default: 'markdown.txt'
"let g:memolist_template_dir_path = 
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 1

nnoremap <leader>mn :MemoNew<cr>
nnoremap <leader>ml :MemoList<cr>
nnoremap <leader>mg :MemoGrep<cr>
