" From: denite.toml
" Repo: Shougo/denite.nvim
" Another: post/denite.vim

" function! s:denite(arg, ...) abort
"   let args = a:arg .' '. join(a:000)
"   return ":\<C-u>Denite ". args ."\<CR>"
" endfunction
" " Note: cannot select other actions than toggle
" " nnoremap <silent><expr> <space>cx <SID>denite('coc-extension')

nnoremap <silent> <space>n] :<C-u>DeniteCursorWord grep<CR>
"nnoremap <silent> <space>np :<C-u>DeniteBufferDir file<CR>
nnoremap <silent> <space>np :<C-u>DeniteProjectDir file<CR>

nnoremap <silent> <space>nn :<C-u>Denite source<cr>
nnoremap <silent> <space>nb :<C-u>Denite buffer<cr>
" Mnemonic: Old buffers
nnoremap <silent> <space>nO :<C-u>Denite file/old<cr>
nnoremap <silent> <space>nm :<C-u>Denite mark<cr>
nnoremap <silent> <space>nr :<C-u>Denite register<cr>

nnoremap <silent> <space>no :<C-u>Denite file_mru<cr>
nnoremap <silent> <space>ny :<C-u>Denite neoyank<cr>
nnoremap <silent> <space>nv :<C-u>Denite scriptnames<cr>

command! Dprev :Denite -resume -cursor-pos=-1 -immediately
command! Dnext :Denite -resume -cursor-pos=+1 -immediately
