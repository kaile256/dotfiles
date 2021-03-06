" From: finder.toml

" Let; Disable Netrw {{{
" Note: even 0 exists('foo') = v:true.
"let g:loaded_netrw = 0
let g:loaded_netrwPlugin = 0
"}}}
" Let; vaffle {{{
let g:vaffle_use_default_mappings = 0
let g:vaffle_show_hidden_files = 1
"}}}

" Vaffle; Keymap {{{
function! s:my_vaffle_keymap() abort "{{{

  nmap <buffer> /        <Plug>(vaffle-open-root)
  nmap <buffer> K        <Plug>(vaffle-mkdir)
  nmap <buffer> N        <Plug>(vaffle-new-file)
  nmap <buffer> ~        <Plug>(vaffle-open-home)
  nmap <buffer> h        <Plug>(vaffle-open-parent)
  nmap <buffer> l        <Plug>(vaffle-open-current)
  nmap <buffer> t        <Plug>(vaffle-open-current-tab)
  nmap <buffer> b        <Plug>(vaffle-open-current-tab)

  nmap <buffer> *       <Plug>(vaffle-toggle-all)
  nmap <buffer> .       <Plug>(vaffle-toggle-hidden)
  nmap <buffer> <Space> <Plug>(vaffle-toggle-current)
  vmap <buffer> <Space> <Plug>(vaffle-toggle-current)

  nmap <buffer> <CR> <Plug>(vaffle-open-selected)
  nmap <buffer> m    <Plug>(vaffle-move-selected)
  nmap <buffer> D    <Plug>(vaffle-delete-selected)
  nmap <buffer> R    <Plug>(vaffle-rename-selected)

  nmap <buffer> q <Plug>(vaffle-quit)
  nmap <buffer> d <Plug>(vaffle-mkdir)
  nmap <buffer> r <Plug>(vaffle-refresh)
  nmap <buffer> % <Plug>(vaffle-new-file)
  nmap <buffer> x <Plug>(vaffle-fill-cmdline)

endfunction "}}}

augroup VaffleCallFucntion
  au!
  au FileType vaffle call <SID>my_vaffle_keymap()
  au FileType vaffle setlocal signcolumn=
augroup END
