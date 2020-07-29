" From: once/loaded.vim
" autoload: /usr/share/nvim/runtime/autoload/netrw.vim

let g:netrw_quickhelp = 0
" where .netrwhist is located.
let g:netrw_home = $XDG_DATA_HOME .'/nvim/netrw'
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

function! s:netrw_browse_up() abort "{{{1
  exe "norm \<Plug>NetrwBrowseUpDir"
  call s:netrw_avoid_period()
endfunction

function! s:netrw_browse_check() abort "{{{1
  exe "norm \<Plug>NetrwLocalBrowseCheck"
  call s:netrw_avoid_period()
endfunction

function! s:netrw_avoid_period() abort "{{{1
  while getline('.') =~# '^\s*\.\+\/\s*$'
    norm! gj
  endwhile
endfunction

augroup NetrwCallMyFunc "{{{1
  au!
  au FileType netrw setl bt=nofile
  au FileType netrw call s:keymaps_on_netrw()
  au FileType netrw call s:netrw_avoid_period()
  " Note: nonumber looks strange, though almost no use in netrw.
  "au FileType netrw setl nonumber
augroup END

function! s:keymaps_on_netrw() abort "{{{1
  nmap <buffer><silent><nowait> h <Plug>NetrwBrowseUpDir
  nmap <buffer><silent><nowait> l <Plug>NetrwLocalBrowseCheck
  nmap <Plug>(netrw-browse-up-dir) :<c-u>call <SID>netrw_browse_up()<cr>
  nmap <Plug>(netrw-browse-check)  :<c-u>call <SID>netrw_browse_check()<cr>
  nmap <buffer><silent><nowait> h <Plug>(netrw-browse-up-dir)
  nmap <buffer><silent><nowait> l <Plug>(netrw-browse-check)
  " TODO: yank path of the file under cursor.
endfunction
