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
  "au BufNew * if &diff | runtime! diff.vim | endif
  au WinEnter,BufEnter * if &bt ==# 'quickfix' && &write | runtime quickfix.vim
augroup end

augroup AutoDeleteWhiteSpace
  au!
  au BufWritePre * keeppatterns %s/\s\+$//ge
augroup END

" K Action up to FileType
function! s:K_modified()
  if winwidth('.') > 150
    if &ft ==# 'vim'
      vert help <c-r><c-w>
    endif
  else
    norm K
  endif
endfunction
function! s:my_on_help_keymaps() abort
  " Note: Those tabs filled with help would fill up tab-line; you can also arrange via winnr() or else.
  "nnoremap <silent><buffer> K <c-u><c-w>T:vert help <c-r><c-w> <cr>
  "xnoremap <silent><buffer> K <c-u><c-w>T:vert help <c-r><c-w> <cr>
  "nnoremap <silent><buffer> K :call s:K_modified() <cr>
  "xnoremap <silent><buffer> K :call s:K_modified() <cr>
endfunction
augroup HelpOnVertical
  au!
  au FileType vim call s:my_on_help_keymaps()
  au TabNew,BufWinEnter nvim/*/*.toml call s:my_on_help_keymaps()
augroup END
