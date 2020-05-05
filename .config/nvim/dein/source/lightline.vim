" From: appearance.toml
" Repo: itchyny/lightline.vim

" FAQ: 'g:lightline' is undefined; Define on top itself as a dict.
let g:lightline = {}

let g:lightline.colorscheme = 'wombat'

let g:lightline.active = {
      \ 'left': [
      \   ['mode', 'paste', 'spell'],
      \   ['branch'] ,
      \   ['coc-status', 'fname', 'readonly', 'modifiable'],
      \ ],
      \
      \ 'right': [
      \   ['lineinfo'],
      \   ['percent'],
      \   ['fileformat', 'fileencoding', 'filetype']
      \ ],
      \ }

let g:lightline.component = {
      \ 'readonly': '&ro ? "RO" : ""',
      \ 'modified': '!&modifiable && &ft !~# ''help\|defx'' ? "nomodifiable" : ""',
      \
      \ 'fileformat':   '&ff ==# "unix" ? "" : &ff',
      \ 'fileencoding': '&fenc ==# "utf-8" ? "" : &fenc',
      \ 'filetype': 'empty(&ft) ? "no ft" : (&ft ==# expand("%:e") ? "" : &ft)',
      \
      \ 'filename': 'empty(expand("%:t")) ? "[No Name]" : expand("%:t")',
      \
      \ }

let g:lightline.component_function = {
      \ 'coc-status': 'coc#status',
      \ 'branch': 'LL_branch',
      \ }

function! LL_branch() abort
  let branch = ''
  try
    let branch = FugitiveHead()
  finally
    return !empty(branch) ? branch : '...'
  endtry
endfunction

function! LL_git_status() abort
  let added    = '+'
  let modified = '~'
  let removed  = '-'
  let signs = [added, modified, removed]

  let hunks = GitGutterGetHunkSummary()
  let ret = []

  for sign in signs
    call add(ret, sign . hunks[i])
  endfor

  return join(ret, ' ')
endfunction
