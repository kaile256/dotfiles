"""" CONFIG
set updatetime=300 " shorter for CursorHold & CursorHoldI
" shorter message
" c-option: not give ins-completion-menu message.
"set shortmess+=c
set signcolumn=yes " always show signcolumns.

"""" KEYMAP
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction
"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? '<C-n>' :
"  \ <SID>check_back_space() ? '<TAB>' :
"  \ coc#refresh()

"" Insert Mode; Use <c-p>/<c-n> to trigger completion.
inoremap <silent><expr> <c-p> coc#refresh()
inoremap <silent><expr> <c-n> coc#refresh()

"" use <cr> to confirm complete.
" \<C-g>u means break undo chain at current position.
inoremap <expr> <cr>
  \ pumvisible() ? '<c-y>' : '<c-g>u\<cr>' 

nnoremap <space>cd :<Plug>(coc-definition)<cr>
nnoremap <space>cy :<Plug>(coc-type-definition)<cr>
nnoremap <space>ci :<Plug>(coc-implementation)<cr>
nnoremap <space>cr :<Plug>(coc-references)<cr>
"" show yank list
nnoremap <space>by :<c-u>CocList -A --normal yank<cr>

"" makes <cr> select the first completion item and confirm completion when no
"" item have selected.
"inoremap <silent><expr> <cr>
"  \ pumvisible() ? coc#_select_confirm() : '<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>'

"" Coc-Done
" closes preview vindow when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
