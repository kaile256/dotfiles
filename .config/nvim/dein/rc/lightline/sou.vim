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
      \   ['mode', 'preview', 'coc_errors', 'coc_warnings'],
      \   ['git_branch', 'git_diff'],
      \   ['readonly', 'paste', 'spell'],
      \   ['vista'],
      \ ],
      \
      \ 'right': [
      \   ['cur_col'],
      \   ['pos_bar_with_lineinfo'],
      \   ['indent', 'fileformat', 'fileencoding', 'filetype'],
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

" Define Separator {{{1
" let g:lightline.separator    = { 'left': '', 'right': '' }
" let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.separator    = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

" Define Functions for Tabline {{{1
function! LL_tab_path(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufnr = buflist[winnr - 1]

  if getbufvar(bufnr, '&ft') ==# 'defx'
    let path = matchstr(getline(1), ':\zs\f\+')
    let path = 'defx://'. path
    let path = s:modify_path(path)
    return path
  endif

  let bufname = expand('#'. bufnr)
  if getbufvar(bufnr, '&bt') ==# 'terminal'
    if bufname =~# 'FZF'
      return 'FZF running...'
    endif
    if has('nvim')
      return getbufvar(bufnr, 'terminal_job_pid', 'terminal')
    endif
    return matchstr(term_getjob(bufnr), '\d\+')
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

" Define Functions for Statusline {{{2
function! s:hold_length(text, max) abort
  return repeat(' ', a:max - len(a:text)) . a:text
endfunction
function! s:hold_length_inverse(text, max) abort
  return a:text . repeat(' ', a:max - len(a:text))
endfunction

function! LL_percent() abort
  return line('$') > 100
        \ ? s:hold_length(line('.') * 100 / line('$'), 2) .'%'
        \ : ''
endfunction

function! s:cur_col() abort
  return s:hold_length(col('.'), 2) . (&colorcolumn > 0 ? '.'. (&cc - 1) : '')
endfunction
function! s:cur_lnum() abort
  return s:hold_length(line('.'), min([3, line('$')])) .'.'. line('$')
endfunction

function! LL_lineinfo() abort
  return s:cur_col() .':'. s:cur_lnum()
endfunction

function! LL_tab_indicator() abort
  return tabpagenr('$') == 1 ? 'tab' : '['. tabpagenr() .'/'. tabpagenr('$') .']' " it doesn't work on 'component_expand'
endfunction

function! LL_vista() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

function! LL_cur_col() abort
  return s:cur_col() .'c'
endfunction

function! LL_pos_bar() abort
  " Ref: https://raw.githubusercontent.com/gcavallanti/dotfiles/master/.vimrc
  " -- GitHub: Sample of args for noscrollbar#statusline
  " Excerpt: unicode chars
  " box: '□', '■', '▭',
  " rectangle: '▬'
  " hyphen: '―', '⁃', '╍',
  " vertical: '┇',

  let track_symbol = '―'
  let gripper_symbol = '■'
  let bar = noscrollbar#statusline(20, track_symbol, gripper_symbol)
  return bar =~# '^'. gripper_symbol .'\+$' ? '' : bar
endfunction

function! LL_pos_bar_with_lineinfo() abort
  let bar = LL_pos_bar()

  return s:cur_lnum() .'L' . (empty(bar) ? '' : ' '. bar )
endfunction

function! LL_indent() abort
  " Both &l:sw and &l:sts is possibly always different from their global value.
  let options = ['tw', 'et', 'ts']
  let cur_options = ''

  for opt in options
    exe 'let lval = &l:'. opt
    exe 'let gval = &g:'. opt
    if lval == gval | continue | endif

    let cur_options .= opt .'='. lval .' '
  endfor

  if &g:sw != 0 && &ts != &sw
    let cur_options .= 'sw='. &sw .' '
  endif

  if &g:sts > 0 && &sts != &sw
    let cur_options .= 'sts='. &sts .' '
  endif

  return cur_options
endfunction

function! LL_opt_fold() abort "{{{3
  const fdm = &fdm

  return fdm ==# 'expr'
        \ ? 'fde='. &fde
        \ : 'fdm='. fdm
endfunction

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

" function! LL_notification() abort "{{{3
"   let msg = ''
"   for msg in ['gutentags#statusline()', 'LL_coc_notice()']
"     if exists('*'. msg)
"       let msg = eval(msg)
"     else
"       let msg = ''
"     endif

"     if !empty(msg)
"       return msg
"     endif
"   endfor

"   if empty(msg)
"     let msg =  LL_errmsg()
"   endif

"   if winwidth(0) < 50 | return '' | endif

"   while len(msg) > (winwidth(0) * 4 / 10)
"     let msg = matchstr(msg, '^.\{'. (len(msg) * 2 / 3) .'}')
"   endwhile

"   return msg
" endfunction

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

function! LL_mode_with_snippets() abort
  let mode = LL_mode()
  if get(s:, 'in_snippets')
    return '>'. mode .'<'
  endif
  return mode
endfunction

function! LL_mode() abort "{{{3
  let m = mode(1)
  if m =~# 'o'
    const mode = 'OPERATOR'
    return mode
  endif

  let mode = exists('*submode#current()') ? submode#current() : ''
  if mode !=# ''
    return mode
  endif

  let mode = s:specific_buffer()
  if mode ==# ''
    let mode = get(g:lightline.mode_map, m[0], '')
  endif

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
  if &bt =~# 'terminal\|quickfix'
    return ''
  elseif empty(&ft)
    return '[no ft]'
  endif

  let fdm = LL_opt_fold()
  let fdm = substitute(fdm, '^fd[me]=', '', '')
  let fdm = substitute(fdm, '(.*)$', '', '')
  return 'ft='. &ft .','. fdm
endfunction

function! s:specific_buffer() abort "{{{3
  if &bt ==# 'terminal'
    return 'TERM'
  endif

  if &ft =~# 'help\|man'
    " Return the title.
    " Use substitute() since matchstr() leaves no string for 'man'.
    const fname = substitute(expand('%:p:r'), '.*/doc/', '', '')
    return toupper(&ft) .'['. fname .']'
  endif

  let fullpath = expand('%:p')
  if fullpath =~# '^fugitive:\/\/'
    const hash = matchstr(fullpath, '\.git/.\{-}\zs[^/]\{8}\ze.\{-}/')
    return hash
  elseif fullpath =~? 'vimspector'
    return 'VIMSPECTOR'
  elseif &bt !=# '' && &bt !=# 'terminal'
    return toupper(&ft)
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

augroup myLightlineSo
  au User UltiSnipsExitLastSnippet   let s:in_snippets = 0 | call lightline#update()
  au User UltiSnipsEnterFirstSnippet let s:in_snippets = 1 | call lightline#update()
augroup END

" Define Components of Statusline/Tabline {{{1
" Note: Priority: (High)component_expand > component_function > component(Low)

" Note: Use 'component_expand' instead if 'tabpagenr' involves no component.
let g:lightline.tab_component_function = {
      \ 'tab_filepath': 'LL_tab_path',
      \ 'tab_modified': 'LL_tab_modified',
      \ }

" Note: Available types are raw, or tabsel, left, middle and right and so on,
" which g:lightline#colorscheme#one#palette[key] has.
" let g:lightline.component_type = {
"      \ 'git_branch': 'right',
"      \ }

let g:lightline.component = {
      \ 'fullpath': '%F',
      \ }

let g:lightline.component_function = {
      \ 'mode': 'LL_mode_with_snippets',
      \ 'percent': 'LL_percent',
      \ 'lineinfo': 'LL_lineinfo',
      \ 'cur_col': 'LL_cur_col',
      \
      \ 'pos_bar': 'LL_pos_bar',
      \ 'pos_bar_with_lineinfo': 'LL_pos_bar_with_lineinfo',
      \
      \ 'git_branch': 'LL_git_branch',
      \
      \ 'filetype': 'LL_filetype',
      \ 'indent': 'LL_indent',
      \ 'opt_fold': 'LL_opt_fold',
      \
      \ 'cwd': 'LL_getcwd',
      \
      \ 'filepath': 'LL_filepath',
      \
      \ 'git_diff': 'LL_git_diff',
      \
      \ 'tabpage_indicator': 'LL_tab_indicator',
      \
      \ 'vista': 'LL_vista',
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

