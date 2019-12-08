scriptencoding utf-8
" From: finder.toml
" Repo: Shougo/defx.nvim
" Another: post/defx.vim
" Ref: /usr/share/nvim/runtime/autoload/netrw.vim
" Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim

let g:defx_sidebar_width = 30

nnoremap <a-x> <Nop>

" Call Defx; in vertical "{{{1
nnoremap <silent> <a-x>v
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -direction=topleft
      \ -winwidth=`expand(g:defx_sidebar_width)`
      \ -split=vertical
      \ -new
      \ <cr>
nnoremap <silent> <a-x><a-v>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -direction=topleft
      \ -winwidth=`expand(g:defx_sidebar_width)`
      \ -split=vertical
      \ -new
      \ <cr>
" Call Defx; in horizontal {{{1
" Note: -search must be applied full path.
" TODO: on Term-Mode, not to get errors; like get path with !pwd.
nnoremap <silent> <a-x><a-s>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -direction=belowright
      \ -split=horizontal
      \ -new
      \ <cr>
nnoremap <silent> <a-x>s
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -direction=belowright
      \ -split=horizontal
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

augroup DefxInsteadOfNetrw "{{{1
  au!
  au FileType defx exe 'setl path='. getbufvar('#', '&path')
  au FileType defx wincmd =
  au FileType defx if line('.') == 1 | norm! j | endif
  " Ref: https://github.com/Shougo/defx.nvim/issues/121
  " Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim
  "let g:loaded_netrw = 1 " necessary to read via https
  "let g:loaded_netrwPlugin = 1 " necessary to read via https
  let g:loaded_netrwSettings = 1
  let g:loaded_netrwFileHandlers = 1
  " TODO: inherit jumplist after gf
  au VimEnter * silent! au! FileExplorer *
  au BufEnter * if s:isdir(expand('<amatch>'))
        \ | Defx `expand('<amatch>')` -search=`expand('<amatch>')` -new
        \ | endif
  let s:isdir = {dir ->
        \ !empty(dir) && (isdirectory(dir) ||
        \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir))
        \ )}
augroup END
