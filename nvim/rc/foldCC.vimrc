" From: tool.toml
" Help: https://github.com/LeafCage/foldCC.vim/blob/master/doc/foldCC.jax

set foldtext=FoldCCtext()
let g:foldCCtext_head = 'v:folddashes, printf("   %s[%4d lines  Lv%-2d]%s")'
let g:foldCCtext_tail = ' v:folddashes, v:foldend-v:foldstart+1, v:foldlevel, v:folddashes'

let g:foldCCtext_maxchars=40
"let g:foldCCtext_enable_autofdc_adjuster = 1 " Auto set foldcolumn=2

au WinEnter * set foldcolumn=0

noremap <silent> <c-g> :echo FoldCCnavi()<cr>
" Uniquely Open Fold; close all the others
noremap zu zMzv
