" From: myplug.toml
" Repo: kaile256/vim-foldcolors
" Ref: vimwiki_dev/ftplugin/vimwiki.vim @195

set foldtext=foldcolors#text()
let g:foldcolors#text_head = 'v:folddashes'
let g:foldcolors#text_tail = "' '. v:folddashes .'['. (v:foldend - v:foldstart + 1) .']'"

let g:foldcolors#text_maxchars = 78
"let g:foldcolors#text_enable_autofdc_adjuster = 1 " Auto set foldcolumn=2

nnoremap <silent> z<c-g> :echo foldcolors#info()<cr>
