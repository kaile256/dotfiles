" From: once/loaded.vim
" autoload: /usr/share/nvim/runtime/autoload/netrw.vim

" where .netrwhist is located.
let g:netrw_home = g:data_home . 'nvim/netrw'
" 0:show all, including hidden files.
let g:netrw_hide = 0
" 'H':show bytes like 5K, 4M, 3G
let g:netrw_sizestyle ='H'
" 'v' opens on right.
let g:netrw_altv = 1
" 'o' opens on below.
let g:netrw_alto = 1
" 2: always show tree view at first.
"let g:netrw_liststyle = 2
let g:netrw_fastbrowse = 2

augroup NetrwCallMyFunc
  au!
  au FileType netrw call <SID>keymaps_on_netrw()
  " Note: nonumber looks strange, though almost no use in netrw.
  "au FileType netrw setl nonumber
augroup END
function! s:keymaps_on_netrw() abort
  nmap <buffer><silent><nowait> h <Plug>NetrwBrowseUpDir
  nmap <buffer><silent><nowait> l <Plug>NetrwLocalBrowseCheck
  " TODO: yank path of the file under cursor.
endfunction
