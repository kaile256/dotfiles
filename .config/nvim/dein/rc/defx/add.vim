scriptencoding utf-8
" From: browse.toml
" Repo: Shougo/defx.nvim
" Another: ftplugin/defx/
" Ref: /usr/share/nvim/runtime/autoload/netrw.vim
" Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim

let g:defx_sidebar_width = 35

" `git` provided by kristijanhusak/defx-git.
" `icons`: provided by kristijanhusak/defx-icons.
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
      \ 'winwidth': g:defx_sidebar_width,
      \ 'columns': g:defx_format_delimited,
      \ 'split': 'vertical',
      \ 'new': 1,
      \ })
      \ <bar> setlocal wfw
      \ <CR>

" in vertical {{{2
nmap <A-x><A-v> <A-x>v
nmap <silent> <A-x>v <C-w>v:<C-u>call <SID>defx({
      \ 'split': 'no',
      \ 'new': 1,
      \ })
      \ <CR>

" in horizontal {{{2
nmap <A-x><A-s> <A-x>s
nmap <silent> <A-x>s <C-w>s:<C-u>call <SID>defx({
      \ 'split': 'no',
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
  if &bt ==# 'terminal'
    exe 'Defx' expand(a:path)
          \ '-split=no'
          \ '-new'
  else
    exe 'Defx' expand(a:path)
          \ '-direction=botright'
          \ '-winwidth='. g:defx_sidebar_width
          \ '-split=vertical'
          \ '-new'
  endif

  setlocal wfw
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
  " Ref: https://github.com/Shougo/defx.nvim/issues/121
  " Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim
  let g:loaded_netrwPlugin = 1 " necessary to read via https

  " Ref: *netrw-activate*
  au VimEnter * if expand('%') ==# '' | e. | endif
  " TODO: inherit jumplist after gf
  au VimEnter * silent! au! FileExplorer *
  au BufEnter * call s:defx_or_netrw(expand('<amatch>'))

  au BufWriteCmd  {file,ftp,rcp,scp,dav,davs,rsync,sftp,http}://*       call s:reload_netrw('BufWriteCmd')
  au FileWriteCmd {file,ftp,rcp,scp,dav,davs,rsync,sftp,http}://*       call s:reload_netrw('FileWriteCmd')
  au BufReadCmd   {file,ftp,rcp,scp,dav,davs,rsync,sftp,http,https}://* call s:reload_netrw('BufReadCmd')
  au FileReadCmd  {file,ftp,rcp,scp,dav,davs,rsync,sftp,http,https}://* call s:reload_netrw('FileReadCmd')
  " might be caught to SourcePre at /usr/share/nvim/runtime/plugin/netrwPlugin.vim @53
  au SourceCmd    {file,ftp,rcp,scp,dav,davs,rsync,sftp,http,https}://* call s:reload_netrw('SourceCmd')
augroup END

function! s:reload_netrw(event) abort
  if exists(':Nread') | return | endif
  unlet g:loaded_netrwPlugin
  source $VIMRUNTIME/plugin/netrwPlugin.vim
  exe 'silent doau Network' a:event expand('<amatch>')
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


augroup myDefxAdd-PwdOnDefx
  " Ref: https://github.com/Shougo/defx.nvim/issues/290
  function! s:pwd_on_defx() abort
    if &bt !=# '' | return | endif
    const path = expand('%:p')
    if !filereadable(path) | return | endif

    const name = 'cwd'
    const root = fnamemodify(path, ':h:h')

    const winnr = bufwinnr(bufnr(name))

    if winnr > 0 && winnr != winnr('$')
      " Keep the defx-cwd window at the right edge of editor.
      const id = win_getid()
      exe winnr 'windo quit'
      call win_gotoid(id)
    endif

    exe 'Defx' root '-search='. path
          \ '-buffer-name='. name
          \
          \ '-no-focus'
          \ '-no-new'
          \
          \ '-direction=botright'
          \ '-split=vertical'
          \ '-winwidth=40'
  endfunction

  " TODO: Keep the defx-window after `:only`.
  au BufEnter,TabNewEntered * call s:pwd_on_defx()

  " au User defx-preview
  " au User DefxDirChanged
augroup END
