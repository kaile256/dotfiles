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

"" NoHighlight
nnoremap <silent> <a-n><a-h> :noh<cr>
"" Checkhealth
nnoremap <a-c><a-h> :<c-u>checkhealth<cr>
"" Reload init.vim
nnoremap <a-s><a-o> :<c-u>so $XDG_CONFIG_HOME/nvim/init.vim<CR>

"""" Dein
"" Dein function
nnoremap <a-d><a-i> :<c-u>call dein#install()<cr>
nnoremap <a-d><a-u> :<c-u>call dein#update()<cr>

