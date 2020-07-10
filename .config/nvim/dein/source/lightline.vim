scriptencoding utf-8
" From: appearance.toml
" Repo: itchyny/lightline.vim
" Another: post/lightline.vim

setglobal noshowmode

let g:lightline = {}

let g:lightline.colorscheme = 'one'

" Define the Order {{{1

" Define the order of Tabline {{{2
" Note: The 'tab' is only for 'tabline', nested once.
" Note: Components in 'tabs' should be defined in 'tab_component' or
" 'tab_component_function' which takes a winnr as an arg.
let g:lightline.tab = {
      \ 'active': [
      \   'tab_filepath',
      \   'tab_modified',
      \ ],
      \
      \ 'inactive': [
      \   'tabnum',
      \   'tab_filepath',
      \   'tab_modified',
      \ ],
      \ }

" Note: tabline seems to update fewer times than status line.
" Note: All the indices except 'tabs' should be defined in 'component_function'
" and so on.
let g:lightline.tabline = {
      \ 'left': [
      \   ['tabpage_indicator'],
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
      \   ['mode', 'preview'],
      \   ['specific_buffer', 'git_branch', 'git_diff'],
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
      \   ['preview'],
      \   ['fullpath'],
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

let g:lightline['separator']    = { 'left': '', 'right': '' }
let g:lightline['subseparator'] = { 'left': '', 'right': '' }

" Define Components for Tabline {{{2

" Note: Use 'component_expand' instead if 'tabpagenr' involves no component.
let g:lightline.tab_component_function = {
      \ 'tab_filepath': 'LL_tab_path',
      \ 'tab_modified': 'LL_tab_modified',
      \ }

function! LL_tab_path(n) abort
  if &ft ==# 'defx'
    let defx_cwd = matchstr(getline(1), ':\zs\S*')
    return 'defx://'. defx_cwd
  endif

  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufname = expand('#'. buflist[winnr - 1])

  if getbufvar(bufnr(bufname), '&bt') ==# 'terminal'
    if bufname =~# 'FZF'
      return 'FZF running...'
    endif
    " Return 'running shell':'id'
    return substitute(bufname, '.\{-}\(\d\+\):\(\S\+\)$', '\2:\1', 'e')
  endif

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

" Define Components for Statusline {{{2
" Note: Priority: (High)component_expand > component_function > component(Low)

" Note: Available types are raw, or tabsel, left, middle and right and so on,
" which g:lightline#colorscheme#one#palette[key] has.
" let g:lightline.component_type = {
"      \ 'git_branch': 'right',
"      \ }

let g:lightline.component = {
      \ 'fullpath': '%F',
      \ }

let g:lightline.component_function = {
      \ 'mode': 'LL_mode',
      \ 'percent': 'LL_percent',
      \ 'lineinfo': 'LL_lineinfo',
      \
      \ 'specific_buffer': 'LL_specific_buffer',
      \ 'git_branch': 'LL_git_branch',
      \
      \ 'notification': 'LL_notification',
      \
      \ 'filetype': 'LL_filetype',
      \
      \ 'cwd': 'LL_getcwd',
      \
      \ 'filepath': 'LL_filepath',
      \
      \ 'git_diff': 'LL_git_diff',
      \
      \ 'tabpage_indicator': 'LL_tab_indicator',
      \ }

" Note: Less frequently updated; 'component_expand' is only updated by
" lightline#update().
let g:lightline.component_expand = {
      \ 'preview': '&previewwindow ? "= PREVIEW =" : ""',
      \ 'readonly': 'LL_readonly',
      \
      \ 'fileformat': '&ff ==# "unix" ? "" : &ff',
      \ 'fileencoding': 'empty(&fenc) ? (&enc ==# "utf-8" ? "" : &enc) : (&fenc ==# "utf-8" ? "" : &fenc)',
      \ }

" Define Components Functions {{{2
let s:hold_length = {text, max -> repeat(' ', max - len(text)) . text}
" let s:hold_length_inverse = {text, max -> text . repeat(' ', max - len(text))}
let LL_percent = {-> line('$') > 100 ? s:hold_length(line('.') * 100 / line('$'), 2) .'%' : ''}

let s:cur_col = {-> s:hold_length(col('.'), 2) . (&colorcolumn > 0 ? '.'. (&cc - 1) : '')}
let s:cur_line = {-> s:hold_length(line('.'), 2) .'.'. line('$')}
let LL_lineinfo = {-> s:cur_col() .':'. s:cur_line()}

let LL_tab_indicator = {-> tabpagenr("$") == 1 ? "" : "[". tabpagenr() ."/". tabpagenr("$") ."]"} " it doesn't work on 'component_expand'

function! LL_readonly() abort "{{{3
  if &bt !=# ''
    return ''
  endif

  if !modifiable
    return '[no modifiable]'
  elseif &readonly
    return '[RO]'
  endif

  return ''
endfunction

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

  if winwidth(0) < 50 | return '' | endif

  while len(msg) > (winwidth(0) * 4 / 10)
    let msg = matchstr(msg, '^.\{'. (len(msg) * 2 / 3) .'}')
  endwhile

  return msg
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

function! LL_mode() abort "{{{3
  if &bt !=# '' && &bt !=# 'terminal'
    if @% =~? 'vimspector'
      return @%
    endif
    return toupper(&ft)
  endif

  let mode = get(g:lightline.mode_map, mode(), '')
  if exists('g:loaded_eskk')
    let eskk_mode = substitute(eskk#statusline(), 'eskk:', '', '')
    if eskk_mode !=# ''
      let mode = substitute(mode, '.\{3}\zs.*', eskk_mode, '')
    endif
  endif

  return mode
endfunction

let g:lightline.mode_map = {
      \ 'n':      'NORMAL',
      \ 'i':      'INSERT',
      \ 'R':      'REPLACE',
      \ 'v':      'VISUAL',
      \ 'V':      'V-LINE',
      \ "\<C-v>": 'V-BLOCK',
      \ 'c':      'COMMAND',
      \ 's':      'SELECT',
      \ 'S':      'S-LINE',
      \ "\<C-s>": 'S-BLOCK',
      \ 't':      'TERMINAL'
      \ }

function! LL_filepath() abort "{{{3
  if &bt !=# '' | return '' | endif

  " TODO: return the window's filename
  let bufname = bufname()
  return s:modify_path(bufname)
endfunction

function! s:modify_path(bufname) abort "{{{3
  let scheme = matchstr(a:bufname, '^\S\{-}://')
  let bufname = substitute(a:bufname, '^'. scheme, '', '')

  if bufname =~# '/$' " if is a directory
    let path_end = matchstr(bufname, '.*/\zs.\{-}/$')
    let dir_path = fnamemodify(bufname, ':p:h:h')
    let short_dir = pathshorten(dir_path)
    let dir = fnamemodify(short_dir, ':h') .'/'. fnamemodify(short_dir, ':t')
  else
    let path_end = fnamemodify(bufname, ':t')
    let dir_path = fnamemodify(bufname, ':p:h')
    let short_dir = pathshorten(dir_path)
    let dir = fnamemodify(short_dir, ':h:t') .'/'. fnamemodify(short_dir, ':t')
  endif

  if a:bufname =~# '^\S\{-}://'
    let dir_path = substitute(dir_path, scheme, '', '')
    return scheme .. dir .'/'. path_end
  endif

  let path = dir .'/'. path_end
  return empty(path_end) ? '[No Name]' : path
endfunction

function! LL_getcwd() abort "{{{3
  return pathshorten(getcwd())
endfunction

function! LL_filetype() abort "{{{3
  if !empty(&bt) || &ft ==# expand('%:e')
    return ''
  elseif empty(&ft)
    return '[no ft]'
  endif

  return &ft
endfunction

function! LL_specific_buffer() abort "{{{3
  if &bt ==# 'terminal'
    return 'TERM'
  elseif &ft =~# 'help\|man'
    " Return the title.
    " The substitute() only for 'help'.
    return substitute(matchstr(getline(1), '\S\+'), '\*\|\.txt', '', 'ge')
  elseif @% =~# '^fugitive:\/\/'
    return 'FUGITIVE'
  endif

  return ''
endfunction

function! LL_git_branch() abort "{{{3
  if &bt !=# '' | return '' | endif

  let branch = ''
  try
    let branch = FugitiveHead()

  finally
    if exists('*GitGutterGetHunkSummary()')
          \ && GitGutterGetHunkSummary() != [0, 0, 0]
      let branch .= '!'
    endif

    return branch !=# '' ? ' '. branch : '...'
  endtry
endfunction

function! LL_git_diff() abort "{{{3
  " if exists('b:coc_git_status')
  "   Note: b:coc_git_status often fails to update.
  "   return matchstr(b:coc_git_status, '\s*\zs\S.*\ze\s*')
  " endif

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

  au User UltiSnipsExitLastSnippet   call lightline#update()
  au User UltiSnipsEnterFirstSnippet call lightline#update()
  au User CocStatusChange,CocDiagnosticChange call lightline#update()
augroup END
