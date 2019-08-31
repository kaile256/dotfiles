set encoding=utf-8
scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,sjis,default,latin1
set ambiwidth=double
hi CursorIM guibg=#fabd1f
" default: tcqj
set formatoptions=jmB1cql
set mouse=a

" WARNING: `!` is required to source all the same named files.
runtime general.vim
runtime filetype.vim
runtime window.vim
runtime buffer.vim
runtime! keymap/*.vim
runtime rc/dein.vimrc
"runtime plugged.vimrc

augroup RuntimeSelection
  au!

  au CmdLineEnter * ++once runtime lazy/cmdline.vim
  au BufNew       * ++once runtime lazy/terminal.vim

  au BufRead * if &diff | runtime lazy/diff.vim | endif
  "au FilterReadPost * runtime lazy/diff.vim

  au BufRead * if &ft == 'vim'  | runtime lazy/vim.vim  | endif
  au BufRead * if &ft == 'toml' | runtime lazy/toml.vim | endif
  au BufRead * if &ft == 'help' | runtime lazy/help.vim | endif
  au BufRead * if &ft == 'json' | runtime lazy/json.vim | endif
  au BufRead * if &ft == 'i3'   | runtime lazy/i3.vim   | endif
  au BufRead * if &ft == 'ruby' | runtime lazy/ruby.vim | endif

  au BufRead * if &ft == 'python' | runtime lazy/python.vim | endif

  au BufEnter * if &bt == 'quickfix' | runtime lazy/quickfix.vim | endif

  " Disturb Auto Comment Out on CR/NL.
  au FileType * if &l:fo =~ 'ro' | set formatoptions-=ro

augroup END
