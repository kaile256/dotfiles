scriptencoding utf-8
" From: finder.toml
" Repo: Shougo/defx.nvim
" Alter: unrtp/defx.vimrc
" Ref: /usr/share/nvim/runtime/autoload/netrw.vim
" Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim

" Call Defx; on Sidebar
nnoremap <silent> <a-x>v
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=vertical -direction=topleft
      \ -winwidth=30
      \ <cr>
nnoremap <silent> <a-x><a-v>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=vertical -direction=topleft
      \ -winwidth=30
      \ <cr>
" Call Defx; on the window {{{1
" Note: -search must be applied full path.
" TODO: on Term-Mode, not to get errors; like get path with !pwd.
nnoremap <a-x> <Nop>
nnoremap <silent> <a-x><a-e>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=no
      \ -new
      \ <cr>
nnoremap <silent> <a-x>e
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=no
      \ -new
      \ <cr>
" Call Defx; on Tab {{{1
nnoremap <silent> <a-x>b
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=tab
      \ -new
      \ <cr>
nnoremap <silent> <a-x><a-b>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=tab
      \ -new
      \ <cr>
" Call Defx; on Floating {{{1
" TODO: Open higher position.
nnoremap <silent> <a-x>f
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=floating
      \ -winrelative=editor
      \ -new
      \ <cr>
nnoremap <silent> <a-x><a-f>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=floating
      \ -winrelative=editor
      \ -new
      \ <cr>
