set encoding=utf-8
scriptencoding utf-8

" set verbosefile=/tmp/vim.log

" sjis: Shift-JIS
set fileencodings=ucs-bom,utf-8,euc-jp,sjis,cp932,default,latin1

" or strftime() returns in Japanese like 1月 23
language time en_US.UTF-8

let mapleader = '<Ignore>'
nmap <space> "_
xmap <space> "_

nmap <expr> <CR> &bt ==# '' ? '\' : '<CR>'
xmap <expr> <CR> &bt ==# '' ? '\' : '<CR>'

let g:isWin = has('win32') || has('win64')
let g:TermOpen = has('nvim') ? 'TermOpen' :
      \ (exists('##TerminalWinOpen') ? 'TerminalWinOpen' : 'TerminalOpen')

runtime rc/variables.vim  " CAUTION: don't comment out; many files depends on it.
runtime rc/os.vim
runtime dein/dein.vim  " contains `filetype plugin indent on`
" runtime rc/vifm.vim " explore by vifm instead of defx
runtime rc/backupfiles.vim
runtime rc/options.vim
runtime rc/augroups.vim
runtime rc/findpath.vim
runtime rc/loaded.vim " disturbs to :source vimscripts under $VIMRUNTIME
" Note: `!` is required to source all the same named files.
runtime! keymap/*.vim
runtime rc/lazy.vim
runtime rc/once.vim
runtime rc/startpage.vim

