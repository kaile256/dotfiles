" TOML: default.toml
" Repo: sbdchd/neoformat

nnoremap <silent> == :<C-u>Neoformat<CR>
" Note: Leave `=` for the filetypes formatter's undefined or not installed.
" xnoremap <silent> =  :*Neoformat<CR>
"
" function! s:neoformat(...) abort
"   if a:0
"     '[,'] Neoformat
"   else
"     '<,'> Neoformat
"   endif
" endfunction
" nnoremap <silent> <Plug>(neoformat-operator)
"      \ :<C-u>set operatorfunc=<SID>neoformat<CR>g@
" nmap = <Plug>(neoformat-operator)
