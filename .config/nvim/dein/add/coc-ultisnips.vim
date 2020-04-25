" TOML: insert.toml
" Repo: SirVer/ultisnips
" Help: $COC_DATA_HOME/extensions/node_modules/coc-snippets/Readme.md
" Json: coc-settings.json
" Another: source/coc-ultisnips.vim

" TODO: See doc to Assign the dir where snippets will be saved.
"nmap <a-s><a-p> CocCommand snippets.editSnippets<cr>
"" Trigger Just Snippets; <tab> to General Completion
imap <c-\> <Plug>(coc-snippets-expand)
vmap <c-\> <Plug>(coc-snippets-select)
imap <c-\> <Plug>(coc-snippets-expand-jump)

nnoremap <silent> <M-s><M-p> :<C-u>CocCommand snippets.editSnippets<CR>
