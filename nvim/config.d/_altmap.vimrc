"""" ADVANCED
"" Dot-Repeat
"" CAUTION: Never careless mapping on <a-hjkl>
"" Jump
nnoremap <a-;> ;.
nnoremap <a-n> n.

"" window leap
inoremap <a-c-h> <c-w>h
inoremap <a-c-j> <c-w>j
inoremap <a-c-k> <c-w>k
inoremap <a-c-l> <c-w>l

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

