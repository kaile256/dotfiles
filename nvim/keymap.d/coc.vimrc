inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
"
"" Use <C-space> to trigger completion.
imap <silent><expr> <C-space> coc#refresh()
"
"" use <cr> to confirm complete.
"" \<C-g>u means break undo chain at current position.
"" COC only does snippet and additional edit on confirm.
"inoremap <expr> <cr>
"  \ pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" 

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"" show yank list
noremap <space>by :<c-u>CocList -A --normal yank<cr>

"" makes <cr> select the first completion item and confirm completion when no
"" item have selected.
"inoremap <silent><expr> <cr>
"  \ pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
"" closes preview vindow when completion is done.
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"
