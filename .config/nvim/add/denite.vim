" From: denite.toml
" Repo: Shougo/denite.nvim
" Another: post/denite.vim

" Gtags
nnoremap <silent> <space>nd
      \ :<C-u>DeniteCursorWord
      \ -buffer-name=gtags_def
      \ -mode=normal gtags_def<cr>
nnoremap <silent> <space>nr
      \ :<C-u>DeniteCursorWord
      \ -buffer-name=gtags_ref
      \ -mode=normal gtags_ref<cr>
nnoremap <silent> <space>nc
      \ :<C-u>DeniteCursorWord
      \ -buffer-name=gtags_context
      \ -mode=normal gtags_context<cr>
nnoremap <silent> <space>n]
      \ :<C-u>DeniteCursorWord grep<CR>
"nnoremap <silent> <space>np
"      \ :<C-u>DeniteBufferDir file<CR>
nnoremap <silent> <space>np
      \ :<C-u>DeniteProjectDir file<CR>

nnoremap <silent> <space>nn
      \ :<C-u>Denite source
      \ -split=topleft
      \ -winwidth=30<cr>
nnoremap <silent> <space>nb
      \ :<C-u>Denite buffer<cr>
" Mnemonic: Old buffers
nnoremap <silent> <space>nO
      \ :<C-u>Denite file/old<cr>
nnoremap <silent> <space>nm
      \ :<C-u>Denite mark<cr>
nnoremap <silent> <space>nr
      \ :<C-u>Denite register<cr>

nnoremap <silent> <space>no
      \ :<C-u>Denite file_mru<cr>
nnoremap <silent> <space>ny
      \ :<C-u>Denite neoyank<cr>
nnoremap <silent> <space>nv
      \ :<C-u>Denite scriptnames<cr>

nnoremap <silent> <space>no :<C-u>Denite scriptnames<CR>

nnoremap <silent> <a-o> :<c-u>keepj DenitePrev<cr>
nnoremap <silent> <a-i> :<c-u>keepj DeniteNext<cr>

command! DenitePrev :Denite -resume -cursor-pos=-1 -immediately
command! DeniteNext :Denite -resume -cursor-pos=+1 -immediately
command! DeniteDo   :Denite -resume -do='normal! A;'

command! DGbranch :Denite branch
command! DGbranch :Denite branch
command! DGbranch :Denite branch
command! DGbranch :Denite branch
