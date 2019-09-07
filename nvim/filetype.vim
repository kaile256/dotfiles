" From: init.vim

augroup AppendFileType
  au!
  au BufWinEnter *.txt         setl syn=help
  au BufWinEnter *.vim!        setl ft=vim
  au BufWinEnter *.vimrc!      setl ft=vim
  au BufWinEnter i3/*/config   setl ft=i3
  au BufWinEnter *.snip        setl ft=neosnippet
  au BufWinEnter *.html        setl ft=html
augroup END

augroup MyRuntimesOnFileTypes
  au!
  au FileType vim      runtime! vim.vim
  au FileType toml     runtime! toml.vim
  au FileType markdown runtime! markdown.vim
  au FileType help     runtime! help.vim
  au FileType i3       runtime! i3.vim
  au FileType ruby     runtime! ruby.vim
  au FileType python   runtime! python.vim
  au FileType qf       runtime! qf.vim
  au FileType json     runtime! json.vim
  " Others;
  "au FilterReadPost * runtime lazy/diff.vim
  au BufNew * if &diff | runtime! diff.vim | endif
augroup end

augroup AutoDeleteWhiteSpace
  au!
  au BufWritePre * keeppatterns %s/\s\+$//ge
augroup END

" K Action up to FileType
function! s:my_vim_help_map() abort
  " Note: Those tabs filled with help would fill up tab-line; you can also arrange via winnr() or else.
  "nnoremap <silent><buffer> K <c-u><c-w>T:vert help <c-r><c-w> <cr>
  "xnoremap <silent><buffer> K <c-u><c-w>T:vert help <c-r><c-w> <cr>
  nnoremap <silent><buffer> K :<c-u>vert help <c-r><c-w> <cr>
  xnoremap <silent><buffer> K :<c-u>vert help <c-r><c-w> <cr>
endfunction
augroup HelpOnVertical
  au!
  au FileType vim call s:my_vim_help_map()
  au TabNew,BufWinEnter nvim/*/*.toml call s:my_vim_help_map()
augroup END
