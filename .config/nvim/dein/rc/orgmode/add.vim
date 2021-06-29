" TOML: memo.toml
" Repo: kristijanhusak/orgmode.nvim

" Note: To activate the functions, you have to call `require"orgmode".setup()`
" before.
nnoremap <space>oa <Cmd>lua require"orgmode".action("agenda.prompt")<CR>
nnoremap <space>oc <Cmd>lua require"orgmode".action("capture.prompt")<CR>
