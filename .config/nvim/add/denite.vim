" From: denite.toml
" Repo: Shougo/denite.nvim
" Another: post/denite.vim

" Keymap; Gtags
nnoremap <silent> <space>nd :<C-u>DeniteCursorWord -buffer-name=gtags_def -mode=normal gtags_def<CR>
nnoremap <silent> <space>nr :<C-u>DeniteCursorWord -buffer-name=gtags_ref -mode=normal gtags_ref<CR>
nnoremap <silent> <space>nc :<C-u>DeniteCursorWord -buffer-name=gtags_context -mode=normal gtags_context<CR>

" Mnemonic: Old buffers
nnoremap <silent> <space>no :<C-u>Denite buffer file_mru<CR>
nnoremap <silent> <space>nf :<C-u>DeniteBufferDir file<CR>

nnoremap <silent> <a-/> :<C-u>Denite -buffer-name=search -auto-resizeline<cr>
nnoremap <silent> <a-t> :<C-u>Denite filetype<CR>
nnoremap <silent> <space>no :<C-u>Denite file_mru<CR>
nnoremap <silent> <space>no :<C-u>Denite scriptnames<CR>
nnoremap <silent> <space>n] :<C-u>DeniteCursorWord grep<CR>

nnoremap <silent> <a-o> :<c-u>DenitePrev<cr>
nnoremap <silent> <a-i> :<c-u>DeniteNext<cr>

command! DenitePrev :Denite -resume -cursor-pos=-1 -immediately
command! DeniteNext :Denite -resume -cursor-pos=+1 -immediately
command! DeniteDo   :Denite -resume -do='normal! A;'

