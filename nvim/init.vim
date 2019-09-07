set encoding=utf-8
scriptencoding utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,sjis,default,latin1
set ambiwidth=double
hi CursorIM guibg=#fabd1f
" default: tcqj
set formatoptions=jmB1cql
set mouse=a

" WARNING: `!` is required to source all the same named files.
runtime variables.vim  " be careful to comment out; many files depends on it.
runtime dein.vimrc  " this file contains `filetype plugin indent on`
runtime options.vim
runtime filetype.vim
runtime window.vim
runtime buffer.vim
runtime! keymap/*.vim

augroup RuntimesSelection
  au!
  au VimEnter     * ++once runtime once/loaded.vim
  au CmdLineEnter * ++once runtime once/cmdline.vim
  au BufAdd       * ++once runtime once/terminal.vim
  "au BufNew       * ++once runtime once/zenkaku.vim
augroup END

function! s:ready_for_new_buffer() "{{{
  if getline(1) ==# ''
    if line('$') ==# 1
      startinsert
    endif
  endif
endfunction "}}}
augroup ForceConf
  au!
  " &fo-=ro: disturb auto comment out on CR/NL.
  au CursorMovedI * if &l:fo =~# 'ro' | set formatoptions-=ro | endif
  au CursorMovedI * if &l:tw =~# ''   | set textwidth=0       | endif
  "au FileType   * call <SID>ready_for_new_buffer()
  "au FileType   * if line('$') ==# 1 || getline(1) ==# '' | startinsert | endif
augroup END
