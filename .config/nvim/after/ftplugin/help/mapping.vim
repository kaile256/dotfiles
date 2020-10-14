
if &modifiable || &readonly || @% =~# 'fugitive:\/\/\/' | finish | endif

nnoremap <buffer><nowait> d <c-d>
nnoremap <buffer><nowait> u <c-u>
nnoremap <buffer> D <c-f>
nnoremap <buffer> U <c-b>

nnoremap <silent><buffer> <C-p> :silent! pop<CR>
nnoremap <silent><buffer> <C-n> :silent! tag<CR>

noremap <buffer><silent> <C-]> <C-]>zz
" Note: g<c-]> jumps via ctags,
"       or if <cword> links more than two tags, shows a list of tags.
noremap <buffer><silent> g<C-]> :<C-u>tjump <C-r>=expand('<cword>')<CR> <CR>zz
nmap <buffer> g] g<C-]>
" Note: stjump means split-tag-jump.
noremap <buffer><silent> <C-w><C-]> :<C-u>vert stjump <C-r>=expand('<cword>')<CR> <CR>zz
nmap <buffer> <C-w>] :<C-u>vert stjump <C-r>=expand('<cword>')<CR> <CR>zz
