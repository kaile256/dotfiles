" From: leap.toml
" With: denite.vimrc

" session
let g:session_directory = '~/.local/share/nvim/session'

augroup DeniteExtra
  au!
  au FileType denite nnoremap <buffer> ss :Denite session<cr>
  au FileType denite nnoremap <silent><buffer>
        \ <c-u> :<C-u>Denite file_mru<CR>
augroup END
