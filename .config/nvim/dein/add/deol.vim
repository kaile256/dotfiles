scriptencoding utf-8
" From: shell.toml
" Repo: Shougo/deol.nvim

let g:deol#prompt_pattern = '^.\{-}❯❯❯ '
let g:deol#shell_history_path = $XDG_DATA_HOME .'/nvim/deol'

nnoremap <silent> <A-t>e :<C-u>     Deol<CR>
nnoremap <silent> <A-t>s :<C-u>sp   <bar>   Deol<CR>
nnoremap <silent> <A-t>v :<C-u>vs   <bar>   Deol<CR>
nnoremap <silent> <A-t>t :<C-u>tabe <bar>   Deol<CR>
nnoremap <silent> <A-t>b :<C-u>bot  sp<bar> Deol<CR>

nmap <A-t><A-e> <A-t>e
nmap <A-t><A-s> <A-t>s
nmap <A-t><A-v> <A-t>v
nmap <A-t><A-b> <A-t>b
