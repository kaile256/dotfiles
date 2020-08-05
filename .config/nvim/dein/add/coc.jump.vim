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

nnoremap <silent> <C-w>d :<C-u>call CocAction('jumpDefinition',     sensible#split())<CR>zz
xnoremap <silent> <C-w>d :call      CocAction('jumpDefinition',     sensible#split())<CR>zz
nnoremap <silent> <C-w>D :<C-u>call CocAction('jumpDeclaration',    sensible#split())<CR>zz
xnoremap <silent> <C-w>D :call      CocAction('jumpDeclaration',    sensible#split())<CR>zz
nnoremap <silent> <C-w>R :<C-u>call CocAction('jumpImplementation', sensible#split())<CR>zz
xnoremap <silent> <C-w>R :call      CocAction('jumpImplementation', sensible#split())<CR>zz
nnoremap <silent> <C-w>y :<C-u>call CocAction('jumpTypeDefinition', sensible#split())<CR>zz
xnoremap <silent> <C-w>y :call      CocAction('jumpTypeDefinition', sensible#split())<CR>zz
nnoremap <silent> <C-w>r :<C-u>call CocAction('jumpReferences',     sensible#split())<CR>zz
xnoremap <silent> <C-w>r :call      CocAction('jumpReferences',     sensible#split())<CR>zz

