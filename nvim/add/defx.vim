scriptencoding utf-8
" From: finder.toml
" Repo: Shougo/defx.nvim
" Another: post/defx.vim
" Ref: /usr/share/nvim/runtime/autoload/netrw.vim
" Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim

" Call Defx; in vertical "{{{1
nnoremap <silent> <space>xv
      \ :<c-u>above 30 vs <bar> Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -new
      \ <cr>
" Call Defx; in horizontal {{{1
" Note: -search must be applied full path.
" TODO: on Term-Mode, not to get errors; like get path with !pwd.
nnoremap <silent> <space>xs
      \ :<c-u>below sp <bar> Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -new
      \ <cr>
" Call Defx; in the window {{{1
" Note: -search must be applied full path.
" TODO: on Term-Mode, not to get errors; like get path with !pwd.
nnoremap <silent> <space>xe
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=no
      \ -new
      \ <cr>
" Call Defx; in tab page {{{1
nnoremap <silent> <space>xt
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=tab
      \ -new
      \ <cr>
" Call Defx; on floating window {{{1
" TODO: Open higher position.
nnoremap <silent> <space>xf
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=floating
      \ -winrelative=editor
      \ -new
      \ <cr>
