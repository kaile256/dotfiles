"" Checkhealth
nnoremap <a-c><a-h> :Checkhealth<cr>
"" Reload init.vim
nnoremap <a-s><a-o> :So $XDG_CONFIG_HOME/nvim/init.vim<CR>

""" Dein
"" Dein function
nnoremap <a-d><a-i> :call dein#install()<cr>
nnoremap <a-d><a-u> :call dein#update()<cr>
"" Show dein-toml
nnoremap <a-d><a-t> :e /home/kaile256/.config/nvim/dein.d
" main
nnoremap <a-d><a-m> :e /home/kaile256/.config/nvim/dein.d/_dein.toml
" lazy plugins
nnoremap <a-d><a-v> :e /home/kaile256/.config/nvim/dein.d/VimEnter.toml
nnoremap <a-d><a-f> :e /home/kaile256/.config/nvim/dein.d/FileType.toml
