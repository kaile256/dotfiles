"""" ADVANCED
"" Dot-Repeat
"" CAUTION: Never careless mapping on <a-hjkl>
"" Window Leap
inoremap <a-c-h> <c-w>h
inoremap <a-c-j> <c-w>j
inoremap <a-c-k> <c-w>k
inoremap <a-c-l> <c-w>l

"" Jump
nnoremap <a-;> ;.
nnoremap <a-n> n.

"" Registor
nnoremap <a-x> "_x
nnoremap <a-d> "_d
nnoremap <a-D> "_D
nnoremap <a-c> "_c
nnoremap <a-C> "_C

"" Checkhealth
noremap <a-c><a-h> :<c-u>checkhealth<cr>
noremap <a-c>h :<c-u>checkhealth<cr>
cnoremap <a-c><a-h> :<c-u>checkhealth<cr>
cnoremap <a-c>h :<c-u>checkhealth<cr>
"" Reload init.vim
noremap <a-s><a-o> :<c-u>so $XDG_CONFIG_HOME/nvim/init.vim<CR>
noremap <a-s>o :<c-u>so $XDG_CONFIG_HOME/nvim/init.vim<CR>
cnoremap <a-s><a-o> :<c-u>so $XDG_CONFIG_HOME/nvim/init.vim<CR>
cnoremap <a-s>o :<c-u>so $XDG_CONFIG_HOME/nvim/init.vim<CR>

"""" Dein
" install plugins
noremap <a-d><a-i> :<c-u>call dein#install()<cr>
noremap <a-d>i :<c-u>call dein#install()<cr>
cnoremap <a-d><a-i> :<c-u>call dein#install()<cr>
cnoremap <a-d>i :<c-u>call dein#install()<cr>

" update plugins
noremap <a-d><a-u> :<c-u>call dein#update()<cr>
noremap <a-d>u :<c-u>call dein#update()<cr>
cnoremap <a-d><a-u> :<c-u>call dein#update()<cr>
cnoremap <a-d>u :<c-u>call dein#update()<cr>

