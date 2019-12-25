" From: myplug.toml
" Repo: kaile256/vim-foldpeek
" Orig: LeafCage/foldCC
" Ref: source/foldCC.vim
" Ref: vimwiki_dev/ftplugin/vimwiki.vim @195

" Note: better than FoldCCtext(), which isn't a set of autoload-functions
"       because of the author's thought
set foldtext=foldpeek#text()
" Note: len(v:foldlevel) is a candidate in foldtext
let g:foldpeek#head = "v:foldlevel > 1 ? v:foldlevel .')' : v:folddashes "
let g:foldpeek#tail = "' '. v:folddashes .'['. (v:foldend - v:foldstart + 1) .']'"
" Note: the length will be adjusted automatically, that is the maxchar
let g:foldpeek#maxchars = 78

"let g:foldpeek#auto_foldcolumn = 1 " Auto set foldcolumn=2

"nnoremap <silent> z<c-g> :<c-u>echo foldpeek#info()<cr>

let g:foldpeek#blank_head = get(g:, 'foldpeek#blank_head',
      \ "eval(g:foldpeek#head) .' BLANK HEAD: '. s:lines_folded .' is folded'")

