" From: fold.toml
" Help: https://github.com/LeafCage/foldCC.vim/blob/master/doc/foldCC.jax
" Repo: LeafCage/foldCC

set foldtext=FoldCCtext()
"let g:foldCCtext_head = 'v:folddashes, printf("   %s[%4d lines  Lv%-2d]%s")'
"let g:foldCCtext_tail = ' v:folddashes, v:foldend-v:foldstart+1, v:foldlevel, v:folddashes'
let g:foldCCtext_head =  "v:foldlevel > 1 ? v:foldlevel .')' : v:folddashes "
let g:foldCCtext_tail = "' '. v:folddashes .'['. (v:foldend - v:foldstart + 1) .']'"
let g:foldCCtext_maxchars = 77

"let g:foldCCtext_enable_autofdc_adjuster = 1 " Auto set foldcolumn=2

nnoremap <silent> z<c-g> :echo FoldCCnavi()<cr>
