" From: init.vim
" Repo: junegunn/vim-plug

" plug#begin: Indentify the path that plugins are installed
let s:plugged_cache_dir = g:cache_home . '/plugged'
let s:plugged_repos_dir = s:plugged_cache_dir . '/repos'
let s:plugged_github_dir = s:plugged_repos_dir . '/github.com/'

"call plug#begin('~/.local/share/nvim/plugged')
if !isdirectory(s:plugged_cache_dir)
  cd expand('g:cache_home')
  exe '!mkdir' s:plugged_cache_dir
endif

call plug#begin(s:plugged_cache_dir)

" Make sure to surround 'single quotes'

Plug 'tomasr/molokai'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes <bar> ./install' }
      \ | Plug 'https://github.com/junegunn/fzf.vim'

call plug#end()

runtime molokai.vimrc
runtime vimwiki.vimrc
runtime fzf.vimrc
runtime coc.vimrc

"let s:plugged_plugin_list = [
"      \ 'vimwiki',
"      \ 'fzf',
"      \ 'coc'
"      \ ]
"let s:plugged_rc_list = map('s:plugged_plugin_list, ".vimrc"')
"
"for rc in s:plugged_rc_list
"  runtime rc
"endfor

"set guifont=SF\ Mono:h12
"set guifontset=SF\ Mono:h12
"set guifontwide=SF\ Mono:h12
