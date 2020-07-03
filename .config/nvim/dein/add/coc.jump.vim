" From: lsp.toml
" Repo: neoclide/coc.nvim
" Branch: neoclide/coc.nvim_release
" XDG: $COC_DATA_HOME/extensions/node_modules/
" Json: coc-settings.json
" Another: source/coc.vim

" Mnemonic: Realize (for Implementation); leave `gI` repeatable
nnoremap <silent> gd :<C-u>call CocActionAsync('jumpDefinition', 'edit')<CR>
xnoremap <silent> gd :call CocActionAsync('jumpDefinition', 'edit')<CR>
nnoremap <silent> gD :<C-u>call CocActionAsync('jumpDeclaration', 'edit')<CR>
xnoremap <silent> gD :call CocActionAsync('jumpDeclaration', 'edit')<CR>
nnoremap <silent> gR :<C-u>call CocActionAsync('jumpImplementation', 'edit')<CR>
xnoremap <silent> gR :call CocActionAsync('jumpImplementation', 'edit')<CR>
nnoremap <silent> gy :<C-u>call CocActionAsync('jumpTypeDefinition', 'edit')<CR>
xnoremap <silent> gy :call CocActionAsync('jumpTypeDefinition', 'edit')<CR>
nnoremap <silent> gr :<C-u>call CocActionAsync('jumpReferences', 'edit')<CR>
xnoremap <silent> gr :call CocActionAsync('jumpReferences', 'edit')<CR>

nnoremap <silent> <C-w>d :<C-u>call CocActionAsync('jumpDefinition', 'split')<CR>
xnoremap <silent> <C-w>d :call CocActionAsync('jumpDefinition', 'split')<CR>
nnoremap <silent> <C-w>D :<C-u>call CocActionAsync('jumpDeclaration', 'split')<CR>
xnoremap <silent> <C-w>D :call CocActionAsync('jumpDeclaration', 'split')<CR>
nnoremap <silent> <C-w>R :<C-u>call CocActionAsync('jumpImplementation', 'split')<CR>
xnoremap <silent> <C-w>R :call CocActionAsync('jumpImplementation', 'split')<CR>
nnoremap <silent> <C-w>y :<C-u>call CocActionAsync('jumpTypeDefinition', 'split')<CR>
xnoremap <silent> <C-w>y :call CocActionAsync('jumpTypeDefinition', 'split')<CR>
nnoremap <silent> <C-w>r :<C-u>call CocActionAsync('jumpReferences', 'split')<CR>
xnoremap <silent> <C-w>r :call CocActionAsync('jumpReferences', 'split')<CR>

nnoremap <silent> <C-w>gd :<C-u>call CocActionAsync('jumpDefinition', 'tabe')<CR>
xnoremap <silent> <C-w>gd :call CocActionAsync('jumpDefinition', 'tabe')<CR>
nnoremap <silent> <C-w>gD :<C-u>call CocActionAsync('jumpDeclaration', 'tabe')<CR>
xnoremap <silent> <C-w>gD :call CocActionAsync('jumpDeclaration', 'tabe')<CR>
nnoremap <silent> <C-w>gR :<C-u>call CocActionAsync('jumpImplementation', 'tabe')<CR>
xnoremap <silent> <C-w>gR :call CocActionAsync('jumpImplementation', 'tabe')<CR>
nnoremap <silent> <C-w>gy :<C-u>call CocActionAsync('jumpTypeDefinition', 'tabe')<CR>
xnoremap <silent> <C-w>gy :call CocActionAsync('jumpTypeDefinition', 'tabe')<CR>
nnoremap <silent> <C-w>gr :<C-u>call CocActionAsync('jumpReferences', 'tabe')<CR>
xnoremap <silent> <C-w>gr :call CocActionAsync('jumpReferences', 'tabe')<CR>

nnoremap <silent> <C-w><space>d :<C-u>call CocActionAsync('jumpDefinition', 'vsplit')<CR>
xnoremap <silent> <C-w><space>d :call CocActionAsync('jumpDefinition', 'vsplit')<CR>
nnoremap <silent> <C-w><space>D :<C-u>call CocActionAsync('jumpDeclaration', 'vsplit')<CR>
xnoremap <silent> <C-w><space>D :call CocActionAsync('jumpDeclaration', 'vsplit')<CR>
nnoremap <silent> <C-w><space>R :<C-u>call CocActionAsync('jumpImplementation', 'vsplit')<CR>
xnoremap <silent> <C-w><space>R :call CocActionAsync('jumpImplementation', 'vsplit')<CR>
nnoremap <silent> <C-w><space>y :<C-u>call CocActionAsync('jumpTypeDefinition', 'vsplit')<CR>
xnoremap <silent> <C-w><space>y :call CocActionAsync('jumpTypeDefinition', 'vsplit')<CR>
nnoremap <silent> <C-w><space>r :<C-u>call CocActionAsync('jumpReferences', 'vsplit')<CR>
xnoremap <silent> <C-w><space>r :call CocActionAsync('jumpReferences', 'vsplit')<CR>

