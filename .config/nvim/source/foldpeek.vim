" From: myplug.toml
" Repo: kaile256/vim-foldpeek
" Orig: LeafCage/foldCC
" Ref: source/foldCC.vim
" Ref: vimwiki_dev/ftplugin/vimwiki.vim @195

augroup myFoldPeek
  au! BufRead *
        \ if &fdt !=# 'foldpeek#text()'
        \ |  setl fdt=foldpeek#text()
        \ | endif
augroup END


let g:foldpeek#skip_patterns = [
      \ '^[\-=/{!* \t]*$',
      \ '^```.*$',
      \ '[# \t]*\[\[plugins]]',
      \ ]

let g:foldpeek#whiteout_patterns_omit = [
      \ 'repo =',
      \ ]
