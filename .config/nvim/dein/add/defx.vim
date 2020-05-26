scriptencoding utf-8
" From: browse.toml
" Repo: Shougo/defx.nvim
" Another: post/defx.vim
" Ref: /usr/share/nvim/runtime/autoload/netrw.vim
" Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim

let g:defx_sidebar_width = 30

" Open Defx even on terminal {{{1
function! s:defx(...) abort
  let dict = a:0 > 0 ? map(a:1, {
        \ key, val -> val == 1
        \ ? '-'. key
        \ : '-'. key .'='. val
        \ }) : ''
  let args  = join(values(dict))

  let fname = matchstr(get(b:, 'term_title', expand('%:p')), '/\S.\+')
  let fname = fnameescape(fname)
  " let fname = substitute(fname, '[^\\]\zs ', '\\ ', 'ge')

  call s:mk_p_dir_on_demand(fname)

  " b:term_title won't show filename but shows cwd.
  let cwd = exists('b:term_title') ? fname : expand('%:p:h')
  let cwd = fnameescape(cwd)
  " let cwd = substitute(cwd, '[^\\]\zs ', '\\ ', 'ge')

  let args .= ' -search='. fname
  exe 'Defx' cwd args

  wincmd =
endfunction

function! s:mk_p_dir_on_demand(path) abort
  let dir = fnamemodify(a:path, ':h')
  if isdirectory(dir) | return | endif

  let confirm = input('Defx: Parent directories does NOT exists; create the directories? ([y]es/[n]o) : ')
  if confirm =~? 'y\%[es]'
    call mkdir(dir, 'p')
  endif
endfunction

nnoremap <a-x> <Nop>

" in vertical {{{2
nnoremap <silent> <a-x>v :<c-u>call <SID>defx({
      \ 'direction': 'top',
      \ 'winwidth': expand(g:defx_sidebar_width),
      \ 'split': 'vertical',
      \ 'new': 1,
      \ })<cr>

nnoremap <silent> <a-x><a-v> :<c-u>call <SID>defx({
      \ 'direction': 'top',
      \ 'winwidth': expand(g:defx_sidebar_width),
      \ 'split': 'vertical',
      \ 'new': 1,
      \ })<cr>

" in horizontal {{{2
nnoremap <silent> <a-x><a-s> :<c-u>call <SID>defx({
      \ 'direction': 'bel',
      \ 'split': 'horizontal',
      \ 'new': 1,
      \ })<cr>
nnoremap <silent> <a-x>s :<c-u>call <SID>defx({
      \ 'direction': 'bel',
      \ 'split': 'horizontal',
      \ 'new': 1,
      \ })<cr>

" in current window {{{2
nnoremap <silent> <a-x><a-e> :<c-u>call <SID>defx({
      \ 'split': 'no',
      \ 'new': 1,
      \ })<cr>
nnoremap <silent> <a-x>e :<c-u>call <SID>defx({
      \ 'split': 'no',
      \ 'new': 1,
      \ })<cr>

" in tab page {{{2
nnoremap <silent> <a-x>b :<c-u>call <SID>defx({
      \ 'split': 'tab',
      \ 'new': 1,
      \ })<cr>
nnoremap <silent> <a-x><a-b> :<c-u>call <SID>defx({
      \ 'split': 'tab',
      \ 'new': 1,
      \ })<cr>

" on floating window {{{2
" TODO: Open higher position.
nnoremap <silent> <a-x>f :<c-u>call <SID>defx({
      \ 'split': 'floating',
      \ 'winrelative': 'editor',
      \ 'new': 1,
      \ })<cr>
nnoremap <silent> <a-x><a-f> :<c-u>call <SID>defx({
      \ 'split': 'floating',
      \ 'winrelative': 'editor',
      \ 'new': 1,
      \ })<cr>

" Note: when -new removed, all the defx buffers shows the same

"" Open Defx standard {{{1
"" Call Defx; in vertical "{{{2
"nnoremap <silent> <a-x>v
"      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
"      \ -direction=topleft
"      \ -winwidth=`expand(g:defx_sidebar_width)`
"      \ -split=vertical
"      \ -new
"      \ <cr>
"nnoremap <silent> <a-x><a-v>
"      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
"      \ -direction=topleft
"      \ -winwidth=`expand(g:defx_sidebar_width)`
"      \ -split=vertical
"      \ -new
"      \ <cr>
"" Call Defx; in horizontal {{{2
"" Note: -search must be applied full path.
"" TODO: on Term-Mode, not to get errors; like get path with !pwd.
"nnoremap <silent> <a-x><a-s>
"      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
"      \ -direction=belowright
"      \ -split=horizontal
"      \ -new
"      \ <cr>
"nnoremap <silent> <a-x>s
"      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
"      \ -direction=belowright
"      \ -split=horizontal
"      \ -new
"      \ <cr>
"" Call Defx; in the window {{{2
"" Note: -search must be applied full path.
"" TODO: on Term-Mode, not to get errors; like get path with !pwd.
"nnoremap <silent> <a-x><a-e>
"      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
"      \ -split=no
"      \ -new
"      \ <cr>
"nnoremap <silent> <a-x>e
"      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
"      \ -split=no
"      \ -new
"      \ <cr>
"" Call Defx; in tab page {{{2
"nnoremap <silent> <a-x>b
"      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
"      \ -split=tab
"      \ -new
"      \ <cr>
"nnoremap <silent> <a-x><a-b>
"      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
"      \ -split=tab
"      \ -new
"      \ <cr>
"" Call Defx; on floating window {{{2
"" TODO: Open higher position.
"nnoremap <silent> <a-x>f
"      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
"      \ -split=floating
"      \ -winrelative=editor
"      \ -new
"      \ <cr>
"nnoremap <silent> <a-x><a-f>
"      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
"      \ -split=floating
"      \ -winrelative=editor
"      \ -new
"      \ <cr>
"
" Open Dev Directory {{{1
nnoremap <silent> <SID>(defx-dev)
      \ :<c-u>Defx `expand($MY_DEV)`
      \ -direction=botright
      \ -winwidth=25
      \ -split=vertical
      \ -new
      \ <cr>
nnoremap <script> <a-x>d     <SID>(defx-dev)
nnoremap <script> <a-x><a-d> <SID>(defx-dev)

" Open Memo Directory {{{1
nnoremap <silent> <SID>(defx-memo)
      \ :<c-u>Defx `expand('$MY_MEMO/note')`
      \ -direction=botright
      \ -winwidth=25
      \ -split=vertical
      \ -new
      \ <cr>
nnoremap <script> <a-x>m     <SID>(defx-memo)
nnoremap <script> <a-x><a-m> <SID>(defx-memo)

augroup myDefxAddInsteadOfNetrw "{{{1
  if exists('#myDefxAddInsteadOfNetrw') | au! myDefxAddInsteadOfNetrw
  endif
  " Ref: https://github.com/Shougo/defx.nvim/issues/121
  " Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim
  "let g:loaded_netrw       = 1 " necessary to read via https
  "let g:loaded_netrwPlugin = 1 " necessary to read via https
  " let g:loaded_netrwSettings     = 1
  " let g:loaded_netrwFileHandlers = 1

  " Ref: *netrw-activate*
  au VimEnter * if expand('%') ==# '' | e. | endif
  " TODO: inherit jumplist after gf
  au VimEnter * silent! au! FileExplorer *
  au BufEnter * call s:defx_or_netrw(expand('<amatch>'))
augroup END

function! s:defx_or_netrw(dirname) abort
  if !s:isdir(a:dirname) | return | endif
  try
    exe 'Defx' a:dirname '-search='. a:dirname '-new'
  catch
    " /usr/share/nvim/runtime/autoload/netrw.vim
    exe 'Explore' a:dirname
  endtry
endfunction

let s:isdir = {dir ->
      \ !empty(dir) && (isdirectory(dir) ||
      \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir))
      \ )}

