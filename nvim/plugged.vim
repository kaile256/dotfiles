" From: init.vim
" Help: https://github.com/junegunn/vim-plug

" plug#begin: Indentify the path that plugins are installed
call plug#begin('~/.local/share/nvim/plugged')

" Make sure to surround 'single quotes'

" On-demand loading
Plug 'vimwiki/vimwiki', { 'on': 'runtime vimwiki.vimrc'}

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
      \ | Plug 'https://github.com/junegunn/fzf.vim', { 'runtime fzf.vimrc' }

call plug#end()
