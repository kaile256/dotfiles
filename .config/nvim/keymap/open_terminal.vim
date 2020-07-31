" From: init.vim
" Another: tmaps.vim
" Another: lazy/terminal.vim

command! -bar -nargs=* -count TermCmd  :exe  s:term_cmd('<count>',  <q-mods>, <f-args>)
command! -bar -nargs=* -count TermOpen :call s:term_open('<count>', <q-mods>, <f-args>)

command! -bar -nargs=* -count Vifm
      \ :exe '<mods> <count> TermCmd vifm' (empty(<q-args>)
      \   ? '--select '. s:set_path(expand('%:p:h'))
      \   : <q-args>)
      \ '| startinsert'

" Note: <Space>t would be mapped by some easymotion like plugins.
nnoremap <silent> <A-t>e :<C-u>TermOpen fish ++curwin<CR>
nnoremap <silent> <A-t>v :<C-u>vert TermOpen<CR>
nnoremap <silent> <A-t>s :<C-u>bel  TermOpen<CR>
nnoremap <silent> <A-t>t :<C-u>tab  TermOpen<CR>
nnoremap <silent> <A-t>b :<C-u>bot 8 TermOpen<CR>

nnoremap <silent> <A-t>E :<C-u>     TermOpen $HOME<CR>
nnoremap <silent> <A-t>V :<C-u>vert TermOpen $HOME<CR>
nnoremap <silent> <A-t>S :<C-u>bel  TermOpen $HOME<CR>
nnoremap <silent> <A-t>T :<C-u>tab  TermOpen $HOME<CR>
nnoremap <silent> <A-t>B :<C-u>bot 8 TermOpen $HOME<CR>

nmap <A-t><A-t> <A-t>t
nmap <A-t><A-e> <A-t>e
nmap <A-t><A-v> <A-t>v
nmap <A-t><A-s> <A-t>s
nmap <A-t><A-b> <A-t>b

if has('nvim')
  function! s:_term_cmd(count, mods, shell) abort
    if empty(a:mods)
      let command = 'term '. a:shell
      return command
    endif

    let mods = a:mods
    if a:count
      let mods .= ' '. a:count
    endif
    let command = mods .' sp term://'. a:shell
    return command
  endfunction
else
  function! s:_term_cmd(count, mods, shell) abort
    let opt = ''
    let opt .= ' ++close'
    let opt .= ' ++kill=term'
    if a:0 > 0
      for arg in a:000
        if arg =~# '^++'
          let opt .= ' '. arg
        endif
      endfor
    endif
    let command = a:mods .' term '. opt .' '. a:shell
    return command
  endfunction
endif

function! s:term_cmd(count, mods, ...) abort
  let shell = a:0 > 0 ? join(a:000) : ''
  if shell =~# '^\s*fish'
    " HACK: Double quotes for fish fails to open terminal with status 1, such
    " as `sp term://fish -C "cd /"`.
    let shell = substitute(shell, '"', "'", 'g')
  endif

  return s:_term_cmd(a:count, a:mods, shell)
endfunction

function! s:set_path(path) abort
  let path = a:path
  if path ==# ''
    let path = substitute(expand('%:p:h'), '\S\+://', '', '')
  elseif &ft ==# 'defx'
    let path = matchstr(getline(1), ':\zs\f\+')
  endif
  if !isdirectory(path)
    let path = $HOME
  endif

  return path
endfunction

function! s:term_open(count, mods, ...) abort
  let path = ''
  if a:0 > 0
    let path = a:1 =~# '^++' ? a:000[len(a:000) - 1] : a:1
  endif
  let path = s:set_path(path)
  let shell = 'fish -C "cd '. path .'"'

  exe s:term_cmd(a:count, a:mods, shell)
  startinsert
endfunction

