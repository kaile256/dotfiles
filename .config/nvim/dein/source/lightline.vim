scriptencoding utf-8
" From: appearance.toml
" Repo: itchyny/lightline.vim

let g:lightline = {}

let g:lightline.colorscheme = 'one'

" Define Separator {{{1
" let g:lightline = {
"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' },
"      \ }

" let g:lightline = {
"    \ 'separator': { 'left': '⮀', 'right': '⮂' },
"    \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
"    \ }

" Define Tabline {{{1
" Note: tabline seems to update fewer times than status line.
" Note: All the indices except 'tabs' should be defined in 'component_function'
" and so on.
let g:lightline.tabline = {
      \ 'left': [
      \   ['tabs'],
      \ ],
      \
      \ 'right': [
      \   ['cwd'],
      \ ],
      \ }

" Note: The 'tab' is only for 'tabline', nested once.
" Note: Components in 'tabs' should be defined in 'tab_component' or
" 'tab_component_function' which takes a winnr as an arg.
let g:lightline.tab = {
      \ 'active': [
      \   'filename',
      \   'modified',
      \ ],
      \
      \ 'inactive': [
      \   'tabnum',
      \   'filename',
      \   'modified',
      \ ],
      \ }


" let g:lightline.tab_component_function = {
"      \ 'bufnr': 'LL_tab_modified',
"      \ }

" Modify lightline#tab#modified(n) directly
" itchyny/lightline.vim/autoload/lightline/tab.vim.
"
" function! LL_tab_modified(n) abort
"   let winnr = tabpagewinnr(a:n)
"   return gettabwinvar(a:n, winnr, '&modified') ? '*'
"        \ : (gettabwinvar(a:n, winnr, '&modifiable') ? '' : '-')
" endfunction

" Define the Order of Statusbar {{{1

let g:lightline.inactive = {
      \ 'left': [
      \   ['filename'],
      \   ['readonly'],
      \ ],
      \
      \ 'right': [
      \   ['percent'],
      \   ['lineinfo'],
      \   ['filetype'],
      \ ],
      \ }

" Note: 'right' fills right to left
let g:lightline.active = {
      \ 'left': [
      \   ['mode'],
      \   ['git_branch', 'git_diff'],
      \   ['readonly', 'paste', 'spell'],
      \ ],
      \
      \ 'right': [
      \   ['percent'],
      \   ['lineinfo'],
      \   ['fileformat', 'fileencoding', 'filetype'],
      \   ['notification'],
      \ ],
      \ }

" Define Components {{{1
" Note: Priority: (High)component_expand > component_function > component(Low)

let g:lightline.component = {
      \ 'lineinfo': '%2v:%-3l'
      \ }

let g:lightline.component_expand = {
      \ 'readonly': '!&modifiable ? "x" : (&ro ? "RO" : "")',
      \
      \ 'fileformat':   '&ff ==# "unix" ? "" : &ff',
      \
      \ 'fileencoding':
      \   'empty(&fenc) ? &enc : (&fenc ==# "utf-8" ? "" : &fenc)',
      \ }

let g:lightline.component_function = {
      \ 'notification': 'LL_notification',
      \
      \ 'filetype': 'LL_filetype',
      \
      \ 'cwd': 'LL_getcwd',
      \ 'filename': 'LL_filename',
      \
      \ 'git_branch': 'LL_git_branch',
      \ 'git_diff': 'LL_git_diff',
      \ }

function! LL_notification() abort "{{{2
  for msg in ['gutentags#statusline()', 'LL_coc_notice()']
    try
      let msg = eval(msg)
    catch
      if !empty(msg)
        return msg
      endif
    endtry
  endfor

  return LL_errmsg()
endfunction

function! LL_errmsg() abort "{{{2
  let msg = get(v:, 'errmsg', '')
  if msg !~# '^E803:'
    " Note: vim-cursorword provides 'E803: ID not found' unlimitedly.
    let s:msg = msg
    return msg
  else
    return get(s:, 'msg', '')
  endif
endfunction

function! LL_coc_notice() abort "{{{2
  let msg = ''

  if !exists('b:coc_diagnostic_info')

  elseif get(b:coc_diagnostic_info, 'warning') != 0
    let msg = 'Warn'
  elseif get(b:coc_diagnostic_info, 'error') != 0
    let msg = 'Error'
  elseif get(b:coc_diagnostic_info, 'information') != 0
    let msg = 'Info'
  elseif get(b:coc_diagnostic_info, 'hint') != 0
    let msg = 'Hint'
  endif

  if empty(msg) | return '' | endif
  return 'Coc: '. b:coc_diagnostic_info['lnums'][0] .' has "'. msg .'"'
endfunction

function! LL_filename() abort "{{{2
  return (filewritable('%:p') ? '?' : '')
        \ . pathshorten(getcwd()) .'/'. expand('%:t')
endfunction

function! LL_getcwd() abort "{{{2
  return pathshorten(getcwd())
endfunction

function! LL_filetype() abort "{{{2
  if &bt =~# 'terminal\|help' || &ft ==# expand('%:e')
    return ''
  elseif empty(&ft)
    return '[no ft]'
  endif

  return &ft
endfunction

function! LL_git_branch() abort "{{{2
  let branch = ''
  try
    let branch = FugitiveHead()
  finally
    if exists('*GitGutterGetHunkSummary()')
          \ && GitGutterGetHunkSummary() != [0, 0, 0]
      let branch .= '!'
    endif
    return !empty(branch) ? branch : '...'
  endtry
endfunction

function! LL_git_diff() abort "{{{2
  if !exists('*GitGutterGetHunkSummary()') | return '' | endif

  let hunks = GitGutterGetHunkSummary()
  if hunks == [0, 0, 0] | return '' | endif

  let added    = '+'
  let modified = '~'
  let removed  = '-'
  let signs = [added, modified, removed]

  let ret = []
  let i = 0
  for sign in signs
    call add(ret, sign . hunks[i])
    let i += 1
  endfor

  return join(ret)
endfunction

augroup myLightlineSo "{{{1
  if exists('#myLightlineSo') | au! myLightlineSo
  endif
  au CmdlineLeave * call lightline#update()
augroup END
