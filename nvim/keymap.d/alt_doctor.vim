"" Checkhealth
nnoremap <a-c><a-h> :<c-u>Checkhealth<cr>
"" Reload init.vim
nnoremap <a-s><a-o> :<c-u>so $XDG_CONFIG_HOME/nvim/init.vim<CR>

""" Dein
"" Dein function
nnoremap <a-d><a-i> :<c-u>call dein#install()<cr>
nnoremap <a-d><a-u> :<c-u>call dein#update()<cr>
"" Show dein-toml
nnoremap <a-d><a-t> :<c-u>e /home/kaile256/.config/nvim/dein.d
" main
nnoremap <a-d><a-m> :<c-u>e /home/kaile256/.config/nvim/dein.d/_dein.toml
" lazy plugins
nnoremap <a-d><a-v> :<c-u>e /home/kaile256/.config/nvim/dein.d/VimEnter.toml
nnoremap <a-d><a-f> :<c-u>e /home/kaile256/.config/nvim/dein.d/FileType.toml
