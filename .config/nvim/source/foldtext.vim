" From: myplug.toml
" Repo: kaile256/vim-foldtext
" Orig: LeafCage/foldCC
" Ref: source/foldCC.vim
" Ref: vimwiki_dev/ftplugin/vimwiki.vim @195

" Note: better than FoldCCtext(), which isn't a set of autoload-functions
"       because of the author's thought
set foldtext=foldtext#text()
" Note: len(v:foldlevel) is a candidate in foldtext
let g:foldtext#head = "v:foldlevel > 1 ? v:foldlevel .')' : v:folddashes "
let g:foldtext#tail = "' '. v:folddashes .'['. (v:foldend - v:foldstart + 1) .']'"
" Note: the length will be adjusted automatically, that is the maxchar
let g:foldtext#maxchars = 78

"let g:foldtext#auto_foldcolumn = 1 " Auto set foldcolumn=2

"nnoremap <silent> z<c-g> :<c-u>echo foldtext#info()<cr>

let g:foldtext#blank_head = get(g:, 'foldtext#blank_head',
      \ "eval(g:foldtext#head) .' BLANK HEAD: '. s:lines_folded .' is folded'")

