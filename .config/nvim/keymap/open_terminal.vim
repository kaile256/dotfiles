" From: init.vim
" Another: tmaps.vim
" Another: lazy/terminal.vim

command! -bar -nargs=? -count TermOpen
      \ :exe s:parse_term_args(<q-mods>, <count>, <q-args>)

" Note: <Space>t would be mapped by some easymotion like plugins.
nnoremap <silent> <A-t>e :<C-u>     TermOpen <bar> startinsert<CR>
nnoremap <silent> <A-t>v :<C-u>vert TermOpen <bar> startinsert<CR>
nnoremap <silent> <A-t>s :<C-u>bel  TermOpen <bar> startinsert<CR>
nnoremap <silent> <A-t>t :<C-u>tab  TermOpen <bar> startinsert<CR>
nnoremap <silent> <A-t>b :<C-u>bot 8 TermOpen<bar> startinsert<CR>

nmap <A-t><A-t> <A-t>t
nmap <A-t><A-e> <A-t>e
nmap <A-t><A-v> <A-t>v
nmap <A-t><A-s> <A-t>s
nmap <A-t><A-b> <A-t>b

function! s:deal_with_win_location(mods, count, shell_args) abort
  if empty(a:mods)
    const shell_args = 'term '. a:shell_args
    return shell_args
  endif

  let mods = a:mods
  if a:count
    let mods .= ' '. a:count
  endif
  const shell_args = mods .' sp term://'. a:shell_args
  return shell_args
endfunction

function! s:get_cwd() abort
  let dir = ''
  const bt = &bt
  const ft = &ft
  if bt ==# 'terminal'
    const last_cwd_line = search('^[~/].*\%(.*\n\)\{-}\%$', 'cnw')
    let dir = matchstr(last_cwd_line, '\f\+') " for vertically split view.
  elseif ft ==# 'defx'
    let dir = matchstr(getline(1), ':\zs\f\+')
  endif
  let dir = substitute(dir, '^\s*\~', $HOME, '') " esp. for Vifm or Defx.

  const safeties = [ expand('%:p:h'), expand('#:p:h'), $HOME ]
  for cand in safeties
    if isdirectory(dir) | break | endif
    let dir = cand
  endfor

  return dir
endfunction

function! s:set_default_shell_args_on_enter() abort
  let dir = s:get_cwd()
  let cmd_args = 'cd '. dir
  const shell_args = 'fish -C '. string(cmd_args)
  return shell_args
endfunction

function! s:parse_term_args(mods, count, shell_args) abort
  let shell_args = empty(a:shell_args)
        \ ? s:set_default_shell_args_on_enter()
        \ : s:parse_shell_args(a:shell_args)
  const term_args = s:deal_with_win_location(a:mods, a:count, shell_args)
  return term_args
endfunction
