" TOML: browse.toml
" Repo: liuchengxu/vista.vim
" Another: add/vista.vim
" Another: source/vista.vim

augroup myVistaKeymaps
  au!
  au FileType vista call s:keymaps()
augroup END

function! s:keymaps() abort
  nmap <buffer> u <C-u>
  nmap <buffer> d <C-d>
  nmap <buffer> f <C-f>
  nmap <buffer> b <C-b>
endfunction
