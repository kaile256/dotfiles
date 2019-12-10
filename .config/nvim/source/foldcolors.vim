" From: myplug.toml
" Repo: kaile256/vim-foldcolors
" Ref: vimwiki_dev/ftplugin/vimwiki.vim @195

" Note: better than FoldCCtext(), which isn't a set of autoload-functions
set foldtext=foldcolors#text()
" Note: len(v:foldlevel) is a candidate in foldtext
let g:foldcolors#text_head = 'v:folddashes'
let g:foldcolors#text_tail = "' '. v:folddashes .'['. (v:foldend - v:foldstart + 1) .']'"
" Note: the length will be adjusted automatically, that is the maxchar
let g:foldcolors#text_maxchars = 78
"let g:foldcolors#text_enable_autofdc_adjuster = 1 " Auto set foldcolumn=2

nnoremap <silent> z<c-g> :echo foldcolors#info()<cr>
