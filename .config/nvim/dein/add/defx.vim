scriptencoding utf-8
" From: browse.toml
" Repo: Shougo/defx.nvim
" Another: post/defx.vim
" Ref: /usr/share/nvim/runtime/autoload/netrw.vim
" Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim

let g:defx_sidebar_width = 35

let g:defx_format_delimited = 'mark:indent:git:icons:filename'
let g:defx_format_full      = g:defx_format_delimited .':type:size:time'

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

  call s:mkdir_on_demand(fname)

  " b:term_title won't show filename but shows cwd.
  let cwd = exists('b:term_title') ? fname : expand('%:p:h')
  let cwd = fnameescape(cwd)
  " let cwd = substitute(cwd, '[^\\]\zs ', '\\ ', 'ge')

  let args .= ' -search='. fname
  exe 'Defx' cwd args
endfunction

function! s:mkdir_on_demand(path) abort "{{{1
  " Create directories with confirmation if parent directories don't exist.

  let dir = fnamemodify(a:path, ':h')
  if isdirectory(dir) | return | endif

  let existed = dir
  while !isdirectory(existed)
    let existed = fnamemodify(existed, ':h')
  endwhile
  let existed .= '/'

  let lack = substitute(dir, '^'. existed, '', 'e')
  let lack .= '/'

  let confirmed = input(' Defx: '
        \ .'create dir '
        \ .'"'. lack .'" under "'. existed .'"'
        \ .'? ([y]es/[n]o) : ')

  if confirmed =~? 'y\%[es]'
    call mkdir(dir, 'p')
  endif
endfunction

nnoremap <a-x> <Nop>

" in Sidebar {{{2
nmap <A-x><A-space> <A-x><space>
nnoremap <silent> <A-x><space> :<c-u>call <SID>defx({
      \ 'direction': 'top',
      \ 'winwidth': expand(g:defx_sidebar_width),
      \ 'columns': g:defx_format_delimited,
      \ 'split': 'vertical',
      \ 'new': 1,
      \ })
      \ <bar> setlocal wfw
      \ <CR>

" in vertical {{{2
nmap <A-x><A-v> <A-x>v
nnoremap <silent> <A-x>v :<c-u>call <SID>defx({
      \ 'direction': 'bot',
      \ 'winwidth': &columns / 2,
      \ 'split': 'vertical',
      \ 'new': 1,
      \ })
      \ <CR>

" in horizontal {{{2
nmap <A-x><A-s> <A-x>s
nnoremap <silent> <A-x>s :<c-u>call <SID>defx({
      \ 'direction': 'bel',
      \ 'split': 'horizontal',
      \ 'winheight': &lines / 2,
      \ 'new': 1,
      \ })<cr>

nmap <A-x><A-b> <A-x>b
nnoremap <silent> <A-x>b :<c-u>call <SID>defx({
      \ 'direction': 'bot',
      \ 'split': 'horizontal',
      \ 'winheight': &lines / 2,
      \ 'new': 1,
      \ })<cr>

" in current window {{{2
nmap <A-x><A-e> <A-x>e
nnoremap <silent> <A-x>e :<c-u>call <SID>defx({
      \ 'split': 'no',
      \ 'new': 1,
      \ })<cr>

" in tab page {{{2
nmap <A-x><A-t> <A-x>t
nnoremap <silent> <A-x>t :<c-u>call <SID>defx({
      \ 'split': 'tab',
      \ 'new': 1,
      \ })<cr>

" Open at the End side {{{1
function! s:defx_endbar(path) abort
  exe 'Defx' expand(a:path)
        \ '-direction=botright'
        \ '-winwidth='. g:defx_sidebar_width
        \ '-split=vertical'
        \ '-new'
endfunction

nnoremap <silent> <SID>(defx-dev)
      \ :<C-u>call <SID>defx_endbar($MY_DEV)<CR>
nnoremap <script> <a-x>d     <SID>(defx-dev)
nnoremap <script> <a-x><a-d> <SID>(defx-dev)

nnoremap <silent> <SID>(defx-practice)
      \ :<C-u>call <SID>defx_endbar('$MY_DEV/atcoder')<CR>
nnoremap <script> <a-x>p     <SID>(defx-practice)
nnoremap <script> <a-x><a-p> <SID>(defx-practice)

nnoremap <silent> <SID>(defx-memo)
      \ :<C-u>call <SID>defx_endbar('$MY_MEMO/note')<CR>
nnoremap <script> <a-x>m     <SID>(defx-memo)
nnoremap <script> <a-x><a-m> <SID>(defx-memo)

augroup myDefxAddInsteadOfNetrw "{{{1
  if exists('#myDefxAddInsteadOfNetrw') | au! myDefxAddInsteadOfNetrw
  endif
  " Ref: https://github.com/Shougo/defx.nvim/issues/121
  " Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim
  let g:loaded_netrwPlugin = 1 " necessary to read via https

  " Ref: *netrw-activate*
  au VimEnter * if expand('%') ==# '' | e. | endif
  " TODO: inherit jumplist after gf
  au VimEnter * silent! au! FileExplorer *
  au BufEnter * call s:defx_or_netrw(expand('<amatch>'))

  au FileReadCmd file://* call s:netrw_cmd('Nread')

  au BufReadCmd,FileReadCmd http://*,https://*,rsync://*,sftp://*    call s:netrw_cmd('Nread')
  au BufReadCmd,FileReadCmd ftp://*,rcp://*,scp://*,dav://*,davs://* call s:netrw_cmd('Nread')

  au SourcePre,SourceCmd file://*,http://*,https://*,rsync://*,sftp://* call s:netrw_cmd('Nsource')
  au SourcePre,SourceCmd ftp://*,rcp://*,scp://*,dav://*,davs://*       call s:netrw_cmd('Nsource')
augroup END

function! s:netrw_cmd(cmd) abort
  if !exists(':Nread')
    unlet g:loaded_netrwPlugin
    source $VIMRUNTIME/plugin/netrwPlugin.vim
  endif

  exe a:cmd expand('<amatch>')
endfunction

function! s:defx_or_netrw(dirname) abort
  if !s:isdir(a:dirname) | return | endif
  try
    exe 'Defx' a:dirname '-search='. a:dirname '-new'
  catch
    " /usr/share/nvim/runtime/autoload/netrw.vim
    if !exists(':Explore')
      unlet g:loaded_netrwPlugin
      source $VIMRUNTIME/plugin/netrwPlugin.vim
    endif
    exe 'Explore' a:dirname
  endtry
endfunction

let s:isdir = {dir ->
      \ !empty(dir) && (isdirectory(dir) ||
      \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir))
      \ )}

