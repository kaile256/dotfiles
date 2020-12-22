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

  " Git mappings {{{1
  let git_maps = {
        \ 'name': '[ Git ]',
        \ }
  if dein#tap('vim-fugitive')
    function! s:is_nothing_staged() abort
      let git_root = shellescape(FindRootDirectory() .'/.git')
      let git_diff_cached = system('git --git-dir='. git_root .' diff --cached')
      let is_nothing_staged = len(git_diff_cached) == 0
      return is_nothing_staged
    endfunction
    function! s:commit_at_bottom(...) abort
      let opts = join(a:000)
      const is_amending = opts =~# '--amend\>'

      if !is_amending && s:is_nothing_staged()
        echo '[fugitive] nothing staged yet'
        return
      elseif is_amending && opts =~# '--no-edit\>'
            \ && input('[fugitive] Amend the staged changes? y[es]/n[o] ')
            \         !~# 'y\%[es]'
        echo "\nabort"
        return
      endif

      exe 'bot 20 Git commit' opts
    endfunction
    nnoremap <silent> <Plug>(try-to-commit)
          \ :<C-u>call <SID>commit_at_bottom()<CR>
    nnoremap <silent> <Plug>(amend-commit-save-message)
          \ :<C-u>call <SID>commit_at_bottom("--amend --no-edit")<CR>

    function! s:Gvstatus() abort
      vert bot Gstatus
      if bufwinnr('\.git/index') == -1 | return | endif

      vert resize 70
      setl winfixwidth
      let Go_to_Staged_section = 'norm gs'
      exe Go_to_Staged_section
      norm! zz
    endfunction

    " Tips: Append a space after `':foo bar()'`; without the trailing space,
    " the command-pattern will be regarded as a function.
    call extend(git_maps, {
          \ 's': [funcref('s:Gvstatus'), 'Show Status'],
          \ 'S': [':tab Gstatus', 'Show Status in another tab'],
          \
          \ 'w': [':Gwrite', ':w | Stage the file'],
          \
          \ 'u': [':silent G reset HEAD %', 'Unstage current buffer'],
          \ 'U': [':silent G reset HEAD',   'Unstage all'],
          \
          \ 'c' : {
          \     'name': 'Commit',
          \     'a': [':Git commit --amend', 'Amend to the last commit'],
          \     'c': ['<Plug>(try-to-commit)', 'Commit'],
          \     'e': ['<Plug>(amend-commit-save-message)', 'Amend witout editing commit'],
          \     },
          \
          \ 'r': {
          \     'name': 'Remote',
          \     'p': [':Git pull', 'Pull'],
          \     'P': [':Git push', 'Push'],
          \
          \     'u': [':exe "Git push -u origin" FugitiveHead() ', 'Set upstream branch to `origin`'],
          \     },
          \ })
  endif
  call which_key#register('Git:', git_maps)

endfunction
call s:register_keys()
delfunction s:register_keys
