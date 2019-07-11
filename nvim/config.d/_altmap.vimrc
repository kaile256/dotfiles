"""" ADVANCED
"" Dot-Repeat
"" hjkl
nnoremap <a-h> h.
nnoremap <a-j> j.
nnoremap <a-k> k.
nnoremap <a-l> l.
"" Jump
nnoremap <a-;> ;.
nnoremap <a-n> n.

"" Checkhealth
noremap <a-c><a-h> :<c-u>checkhealth<cr>
cnoremap <a-c><a-h> :<c-u>checkhealth<cr>
"" Reload init.vim
noremap <a-s><a-o> :<c-u>so $XDG_CONFIG_HOME/nvim/init.vim<CR>
cnoremap <a-s><a-o> :<c-u>so $XDG_CONFIG_HOME/nvim/init.vim<CR>

"""" Dein
"" Dein function
noremap <a-d><a-i> :<c-u>call dein#install()<cr>
cnoremap <a-d><a-i> :<c-u>call dein#install()<cr>
noremap <a-d><a-u> :<c-u>call dein#update()<cr>
cnoremap <a-d><a-u> :<c-u>call dein#update()<cr>

