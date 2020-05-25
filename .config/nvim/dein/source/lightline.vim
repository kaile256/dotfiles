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
      \   ['filename']
      \ ],
      \
      \ 'right': [
      \   ['branch'],
      \   ['percent'],
      \   ['lineinfo'],
      \ ],
      \ }

" Note: 'right' fills right to left
let g:lightline.active = {
      \ 'left': [
      \   ['mode'],
      \   ['paste', 'spell'],
      \   ['readonly'],
      \   ['coc'],
      \   ['filename'],
      \ ],
      \
      \ 'right': [
      \   ['percent'],
      \   ['fileformat', 'fileencoding', 'filetype'],
      \   ['lineinfo'],
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
      \ 'fileencoding':
      \   'empty(&fenc) ? &enc : (&fenc ==# "utf-8" ? "" : &fenc)',
      \
      \ 'filename': 'empty(expand("%:t")) ? "No Name" : expand("%:t")',
      \ }

let g:lightline.component_function = {
      \ 'coc': 'coc#status',
      \ 'filetype': 'LL_filetype',
      \ 'branch': 'LL_branch',
      \ 'cwd': 'LL_getcwd',
      \ }

function! LL_getcwd() abort
  return pathshorten(getcwd())
endfunction

function! LL_filetype() abort
  if &bt =~# 'terminal\|help' || &ft ==# expand('%:e')
    return ''
  elseif empty(&ft)
    return 'no ft'
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

augroup myLightlineSo
  if exists('#myLightlineSo') | au! myLightlineSo
  endif
  au CmdlineLeave * call lightline#update()
augroup END
