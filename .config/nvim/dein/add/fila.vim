" From: finder.toml
" Repo: lambdalisue/fila.vim
" Another: post/fila.vim

let g:fila#viewer#skip_default_mappings = 1

nnoremap <silent> \E :<C-u>Fila . -drawer -reveal=<C-r>=expand('%')<CR><CR>
nnoremap <silent> \e :<C-u>Fila<CR>
