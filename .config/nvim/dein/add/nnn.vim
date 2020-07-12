" TOML: browse.toml
" Repo: mcchrish/nnn.vim

nnoremap <silent> <A-x>n :<C-u> SensibleSplit <bar> call nnn#pick('%:p:h')<CR>

" let g:nnn#replace_netrw = 1
let g:nnn#set_default_mappings = 0 " <Leader>n to :NnnPicker<CR>
