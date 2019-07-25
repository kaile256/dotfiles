"""" From: 'tool.toml'
"""" Help: 'coc#'
"""" Source: 'neoclide/coc.nvim'

"""" CONFIG
set updatetime=300 " shorter for CursorHold & CursorHoldI
" shorter message
" c-option: not give ins-completion-menu message.
"set shortmess+=c
" signcolumn is the line beside numbers.
set signcolumn=yes

"" Coc-Done
" closes preview vindow when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"""" KEYMAP
nnoremap <space>cd :<Plug>(coc-definition)<cr>
nnoremap <space>cy :<Plug>(coc-type-definition)<cr>
nnoremap <space>ci :<Plug>(coc-implementation)<cr>
nnoremap <space>cr :<Plug>(coc-references)<cr>
"" show yank list
nnoremap <space>cy :<c-u>CocList -A --normal yank<cr>

""" USE <TAB>
" use <tab> for trigger completion and navigate to the next complete item
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1] =~ '\s'
"endfunction

"" Use <TAB> to trigger completion.
"inoremap <silent><expr> <c-p>
"  \ pumvisible() ? '<C-n>' :
"  \ <SID>check_back_space() ? '<c-p>' :
"  \ coc#refresh()

""" USE <CR>
"" use <cr> to confirm complete.
"" \<C-g>u means break undo chain at current position.
"inoremap <expr> <cr>
"  \ pumvisible() ? '<c-y>' : '<c-g>u\<cr>' 
"" makes <cr> select the first completion item and confirm completion when no
"" item have selected.
"inoremap <silent><expr> <cr>
"  \ pumvisible() ? coc#_select_confirm() : '<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>'
