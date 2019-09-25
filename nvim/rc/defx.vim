scriptencoding utf-8
" From: finder.toml
" Repo: Shougo/defx.nvim
" Alter: unrtp/defx.vim
" Ref: /usr/share/nvim/runtime/autoload/netrw.vim
" Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim

nnoremap <a-x> <Nop>

" Call Defx; on Sidebar
nnoremap <silent> <a-x>x
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=vertical -direction=topleft
      \ -winwidth=30
      \ -toggle
      \ <cr>
nnoremap <silent> <a-x><a-x>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=vertical -direction=topleft
      \ -winwidth=30
      \ -toggle
      \ <cr>
" Call Defx; in vertical "{{{1
nnoremap <silent> <a-x>v
      \ :<c-u>above 30 vs <bar> Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -new
      \ <cr>
nnoremap <silent> <a-x><a-v>
      \ :<c-u>above 30 vs <bar> Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -new
      \ <cr>
" Call Defx; in horizontal {{{1
" Note: -search must be applied full path.
" TODO: on Term-Mode, not to get errors; like get path with !pwd.
nnoremap <silent> <a-x><a-s>
      \ :<c-u>below sp <bar> Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -new
      \ <cr>
nnoremap <silent> <a-x>s
      \ :<c-u>below sp <bar> Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -new
      \ <cr>
" Call Defx; in the window {{{1
" Note: -search must be applied full path.
" TODO: on Term-Mode, not to get errors; like get path with !pwd.
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
" Call Defx; in tab page {{{1
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
" Call Defx; on floating window {{{1
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
