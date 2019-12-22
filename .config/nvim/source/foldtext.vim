" From: myplug.toml
" Repo: kaile256/vim-foldtext
" Ref: vimwiki_dev/ftplugin/vimwiki.vim @195

" Note: better than FoldCCtext(), which isn't a set of autoload-functions
set foldtext=foldtext#text()
" Note: len(v:foldlevel) is a candidate in foldtext
let g:foldtext#text_head = "v:foldlevel > 1 ? v:foldlevel .')' : v:folddashes "
let g:foldtext#text_tail = "' '. v:folddashes .'['. (v:foldend - v:foldstart + 1) .']'"
" Note: the length will be adjusted automatically, that is the maxchar
let g:foldtext#text_maxchars = 78
"let g:foldtext#text_enable_autofdc_adjuster = 1 " Auto set foldcolumn=2

nnoremap <silent> z<c-g> :echo foldtext#info()<cr>

"let s:head = {-> v:folddashes}
"let s:tail = {-> ' '. v:folddashes .'['. (v:foldend - v:foldstart + 1) .']'}
"exe 'set foldtext='. s:head . substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g') . s:tail
