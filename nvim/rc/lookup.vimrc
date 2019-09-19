" From: ftplugin.toml

nnoremap <Plug>(lookup-jump-to-definition) :<c-u>call lookup#lookup()<cr>
xnoremap <Plug>(lookup-jump-back)          :<c-u>call lookup#lookup()<cr>
augroup LookupMyConf
  au!
  au FileType vim nmap <buffer> <c-]> <Plug>(lookup-jump-to-definition)
  au FileType vim xmap <buffer> <c-]> <Plug>(lookup-jump-to-definition)
  au FileType vim nmap <buffer> <c-w><c-]> :vs<cr><Plug>(lookup-jump-to-definition)
  au FileType vim xmap <buffer> <c-w><c-]> :vs<cr><Plug>(lookup-jump-to-definition)
  au FileType vim nmap <buffer> <c-w>g] :sp<cr><Plug>(lookup-jump-to-definition)
  au FileType vim xmap <buffer> <c-w>g] :sp<cr><Plug>(lookup-jump-to-definition)
  au FileType vim nmap <buffer> <c-w><space>] :tabe<cr><Plug>(lookup-jump-to-definition)
  au FileType vim xmap <buffer> <c-w><space>] :tabe<cr><Plug>(lookup-jump-to-definition)
  au FileType vim nmap <buffer> <c-t> <Plug>(lookup-jump-back)
  au FileType vim xmap <buffer> <c-t> <Plug>(lookup-jump-back)
augroup END
