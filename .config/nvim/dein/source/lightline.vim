scriptencoding utf-8
" From: appearance.toml
" Repo: itchyny/lightline.vim

let g:lightline = {}

let g:lightline.colorscheme = 'one'

" Define the Order {{{1

" Define the order of Tabline {{{2
" Note: The 'tab' is only for 'tabline', nested once.
" Note: Components in 'tabs' should be defined in 'tab_component' or
" 'tab_component_function' which takes a winnr as an arg.
let g:lightline.tab = {
      \ 'active': [
      \   'path',
      \   'modified',
      \ ],
      \
      \ 'inactive': [
      \   'tabnum',
      \   'filename',
      \   'modified',
      \ ],
      \ }

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

" Define the order of Statusline {{{2
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

" Define Components {{{1

" Define Separator {{{2

" let g:lightline = {
"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' },
"      \ }

" let g:lightline = {
"      \ 'separator': { 'left': '⮀', 'right': '⮂' },
"      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
"      \ }

" Define Components Functions {{{2
function! LL_notification() abort "{{{3
  let msg = ''
  for msg in ['gutentags#statusline()', 'LL_coc_notice()']
    if exists('*'. msg)
      let msg = eval(msg)
    else
      let msg = ''
    endif

    if !empty(msg)
      return msg
    endif
  endfor

  if empty(msg)
    let msg =  LL_errmsg()
  endif

  return len(msg) < winwidth(0) ? msg : ''
endfunction

function! LL_errmsg() abort "{{{3
  let msg = get(v:, 'errmsg', '')
  if msg !~# '^E803:'
    " Note: vim-cursorword provides 'E803: ID not found' unlimitedly.
    let s:msg = msg
    return msg
  else
    return get(s:, 'msg', '')
  endif
endfunction

function! LL_coc_notice() abort "{{{3
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

function! LL_path() abort "{{{3
  " TODO: return the window's filename
  let bufname = expand('%')
  return s:modify_path(bufname)
endfunction

function! s:modify_path(bufname) abort "{{{3
  if &bt ==# 'terminal'
    if @% =~# 'FZF'
      return 'FZF running...'
    endif
    " Return 'running shell':'id'
    return substitute(a:bufname, '.\{-}\(\d\+\):\(\S\+\)$', '\2:\1', 'e')
  endif
  if a:bufname =~# '\[.\{-}]'
    return matchstr(a:bufname, '\[.\{-}]')
  elseif a:bufname =~# '__.\{-}__'
    return matchstr(a:bufname, '__.\{-}__')
    " return '['. matchstr(a:bufname, '__\zs.\{-}\ze__') .']'
  endif

  let dir_path  = fnamemodify(a:bufname, ':p:h')
  let short_dir = pathshorten(dir_path)
  let dir = fnamemodify(short_dir, ':h:t') .'/'. fnamemodify(short_dir, ':t')

  let fname = fnamemodify(a:bufname, ':t')
  let path = dir .'/'. fname
  return fname !=# '' ? path : '[No Name]'
endfunction

function! LL_getcwd() abort "{{{3
  return pathshorten(getcwd())
endfunction

function! LL_filetype() abort "{{{3
  if &bt =~# 'terminal\|help' || &ft ==# expand('%:e')
    return ''
  elseif empty(&ft)
    return '[no ft]'
  endif

  return &ft
endfunction

function! LL_git_branch() abort "{{{3
  if &bt ==# 'terminal'
    return 'TERM'
  endif

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

function! LL_git_diff() abort "{{{3
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

" Define Components for Statusline {{{2
" Note: Priority: (High)component_expand > component_function > component(Low)

" Note: Available types are raw, or tabsel, left, middle and right and so on,
" which g:lightline#colorscheme#one#palette[key] has.
" let g:lightline.component_type = {
"      \ 'git_branch': 'right',
"      \ }

let g:lightline.component = {
      \ 'lineinfo': '%2v:%-3l'
      \ }

let g:lightline.component_expand = {
      \ 'readonly': '!&modifiable ? "x" : (&ro ? "RO" : "")',
      \
      \ 'fileformat':   '&ff ==# "unix" ? "" : &ff',
      \
      \ 'fileencoding': 'empty(&fenc)
      \   ? (&enc  ==# "utf-8" ? "" : &enc)
      \   : (&fenc ==# "utf-8" ? "" : &fenc)',
      \
      \ 'git_branch': 'LL_git_branch',
      \
      \ 'notification': 'LL_notification',
      \
      \ 'filetype': 'LL_filetype',
      \
      \ 'cwd': 'LL_getcwd',
      \
      \ 'filename': 'LL_filename',
      \
      \ 'git_diff': 'LL_git_diff',
      \ }

" Define Components for Tabline {{{2

" Note: Use 'component_expand' instead if 'tabpagenr' involves no component.
let g:lightline.tab_component_function = {
      \ 'path': 'LL_tab_path',
      \ 'modified': 'LL_tab_modified',
      \ }

function! LL_tab_path(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufname = expand('#'. buflist[winnr - 1])

  return s:modify_path(bufname)
endfunction


" Modify lightline#tab#modified(n) directly
" itchyny/lightline.vim/autoload/lightline/tab.vim.

function! LL_tab_modified(n) abort
  let winnr = tabpagewinnr(a:n)

  if !empty(gettabwinvar(a:n, winnr, '&buftype'))
    return ''
  endif

  return gettabwinvar(a:n, winnr, '&modified') ? '*'
        \ : (gettabwinvar(a:n, winnr, '&modifiable') ? '' : '-')
endfunction

augroup myLightlineSo "{{{1
  if exists('#myLightlineSo') | au! myLightlineSo
  endif
  au CmdlineLeave * call lightline#update()
augroup END
