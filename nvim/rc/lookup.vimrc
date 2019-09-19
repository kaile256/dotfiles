" From: ftplugin.toml

augroup LookupMyConf
  au!
  au FileType vim nnoremap <silent><buffer> gd :<c-u>call lookup#lookup()<cr>
  "au FileType vim nnoremap <silent><buffer> gr :<c-u>call lookup#pop()<cr>
  au FileType vim xnoremap <silent><buffer> gd :call lookup#lookup()<cr>
  "au FileType vim xnoremap <silent><buffer> gr :call lookup#pop()<cr>
augroup END
