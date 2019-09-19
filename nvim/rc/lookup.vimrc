" From: ftplugin.toml

augroup LookupMyConf
  au!
  "au FileType vim nnoremap <silent><buffer> gd :<c-u>call lookup#lookup()<cr>
  "au FileType vim xnoremap <silent><buffer> gd :call lookup#lookup()<cr>
  au FileType vim nnoremap <silent><buffer> <c-]> :<c-u>call lookup#lookup()<cr>
  au FileType vim xnoremap <silent><buffer> <c-]> :call lookup#lookup()<cr>
  au FileType vim nnoremap <silent><buffer> <c-t> :<c-u>call lookup#pop()<cr>
  au FileType vim xnoremap <silent><buffer> <c-t> :call lookup#pop()<cr>
  "au FileType vim nnoremap <silent><buffer> gr :<c-u>call lookup#pop()<cr>
  "au FileType vim xnoremap <silent><buffer> gr :call lookup#pop()<cr>
augroup END
"nnoremap l l
