" From: myplug.toml
" Repo: kaile256/vim-foldcolors

set foldtext=foldcolors#format#text()
"let g:foldcolors_text_head = 'v:folddashes, printf("   %s[%4d lines  Lv%-2d]%s")'
"let g:foldcolors_text_tail = ' v:folddashes, v:foldend-v:foldstart+1, v:foldlevel, v:folddashes'

let g:foldcolors_text_maxchars=50
"let g:foldcolors_text_enable_autofdc_adjuster = 1 " Auto set foldcolumn=2

nnoremap <silent> z<c-g> :echo foldcolors#format#info()<cr>
