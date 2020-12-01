" TOML: default.toml
" Repo: liuchengxu/vim-which-key
" Another: add/which-key.vim

let g:which_key_vertical = 1
let g:which_key_floating_relative_win = 1

function! s:repo() abort
  return fnamemodify(FindRootDirectory(), ':s_.*/\ze[^/]*/[^/]*__')
endfunction
function! s:set_in_reg(target) abort
  const reg = v:register ==# '"' ? '+' : v:register
  call setreg(reg, a:target)
  echo a:target 'in @'. reg
endfunction
nnoremap <silent> <Plug>(yank-repo)  :<C-u>call <SID>set_in_reg(<SID>repo())<CR>
noremap! <expr>   <Plug>(paste-repo) <SID>repo()
nnoremap <silent> <Plug>(yank-fullpath)  :<C-u>call <SID>set_in_reg(expand('%:p'))<CR>
noremap! <expr>   <Plug>(paste-fullpath) expand('%:p')
nnoremap <silent> <Plug>(yank-fname)  :<C-u>call <SID>set_in_reg(expand('%:t'))<CR>
noremap! <expr>   <Plug>(paste-fname) expand('%:t')

nnoremap <silent> <Plug>(yank-dirpath)  :<C-u>call <SID>set_in_reg(expand('%:p:h'))<CR>
noremap! <expr>   <Plug>(paste-dirpath) expand('%:p:h:t')
nnoremap <silent> <Plug>(yank-dirname)  :<C-u>call <SID>set_in_reg(expand('%:p:h'))<CR>
noremap! <expr>   <Plug>(paste-dirname) expand('%:p:h:t')

nnoremap <silent> <Plug>(yank-bufnr)  :<C-u>call <SID>set_in_reg(bufnr())<CR>
noremap! <expr>   <Plug>(paste-bufnr) bufnr('%')

function! s:register_keys() abort
  " Add prefix 'v_' to xmaps

  let l:nmaps = {}

  let l:nmaps['Yank Path '] = {
        \ 'name': '[ local ]',
        \
        \ 'f': ['<Plug>(yank-fname)', 'Get current filename'],
        \ 'F': ['<Plug>(yank-fullpath)',  'Get current full-path'],
        \
        \ 'd': ['<Plug>(yank-dirname)',  'Get name of current directory'],
        \ 'D': ['<Plug>(yank-dirpath)',  'Get full-path of current directory'],
        \
        \ 'b': ['<Plug>(yank-bufnr)', 'Get current bufnr'],
        \ 'r': ['<Plug>(yank-repo)',  'Get current repo'],
        \ }
  let l:nmaps['Paste Path '] = {
        \ 'name': '[ local ]',
        \
        \ 'f': ['<Plug>(paste-fname)', 'Paste current filename'],
        \ 'F': ['<Plug>(paste-fullpath)',  'Paste current full-path'],
        \
        \ 'd': ['<Plug>(yank-dirname)',  'Get name of current directory'],
        \ 'D': ['<Plug>(yank-dirpath)',  'Get full-path of current directory'],
        \
        \ 'b': ['<Plug>(paste-bufnr)', 'Paste current bufnr'],
        \ 'r': ['<Plug>(paste-repo)',  'Paste current repo'],
        \ }

  if dein#tap('vim-caser')
    let l:nmaps['Caser '] = {
          \ 'name': '[arthurxavierx/vim-caser]',
          \
          \ 't': ['<Plug>CaserTitleCase',    'Title Case'],
          \ '(': ['<Plug>CaserSentenceCase', 'Start a sentence'],
          \ ')': ['<Plug>CaserSpaceCase',    'continue a sentence'],
          \
          \ 'p': ['<Plug>CaserMixedCase', 'PascalCase'],
          \ 'c': ['<Plug>CaserCamelCase', 'camelCase'],
          \
          \ '_': ['<Plug>CaserSnakeCase', 'snake_case'],
          \ 'U': ['<Plug>CaserUpperCase', 'UPPER_CASE'],
          \
          \ '-': ['<Plug>CaserKebabCase', 'kebab-case'],
          \ '.': ['<Plug>CaserDotCase',   'dot.separated'],
          \ }

    let l:nmaps['Caser in Visual '] = {
          \ 'name': '[arthurxavierx/vim-caser]',
          \
          \ 't': ['<Plug>CaserVTitleCase',    'Title Case'],
          \ '(': ['<Plug>CaserVSentenceCase', 'Start a sentence'],
          \ ')': ['<Plug>CaserVSpaceCase',    'continue a sentence'],
          \
          \ 'p': ['<Plug>CaserVMixedCase', 'PascalCase'],
          \ 'c': ['<Plug>CaserVCamelCase', 'camelCase'],
          \
          \ '_': ['<Plug>CaserVSnakeCase', 'snake_case'],
          \ 'U': ['<Plug>CaserVUpperCase', 'UPPER_CASE'],
          \
          \ '-': ['<Plug>CaserVKebabCase', 'kebab-case'],
          \ '.': ['<Plug>CaserVDotCase',   'dot.separated'],
          \ }
  endif

  for key in keys(l:nmaps)
    call which_key#register(key, l:nmaps[key])
  endfor
endfunction
call s:register_keys()
delfunction s:register_keys
