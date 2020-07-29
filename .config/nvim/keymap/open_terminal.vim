" From: init.vim
" Another: tmaps.vim
" Another: lazy/terminal.vim

command! -bar -nargs=* -count TermCmd  :call s:term_cmd('<count>',  <q-mods>, <f-args>)
command! -bar -nargs=* -count TermOpen :call s:term_open('<count>', <q-mods>, <f-args>)

command! -bar -nargs=* -count Vifm
      \ :exe '<mods> <count> TermCmd vifm' (empty(<q-args>)
      \   ? '--select '. s:set_path('%:p:h')
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

nnoremap <silent> <A-x><space> :<C-u>vert top 35 Vifm<CR>

nnoremap <silent> <A-x><A-e> :<C-u>     Vifm<CR>
nnoremap <silent> <A-x><A-s> :<C-u>bel  Vifm<CR>
nnoremap <silent> <A-x><A-b> :<C-u>bot  Vifm<CR>
nnoremap <silent> <A-x><A-t> :<C-u>tab  Vifm<CR>
nnoremap <silent> <A-x><A-v> :<C-u>vert Vifm<CR>

nmap <A-x>e <A-x><A-e>
nmap <A-x>s <A-x><A-s>
nmap <A-x>b <A-x><A-b>
nmap <A-x>v <A-x><A-v>
nmap <A-x>t <A-x><A-t>

if has('nvim')
  function! s:set_mods(mods) abort
    if a:mods ==# '' | return '' | endif

    " Note: mods in func expands even if they're typed in short externally.
    let mods_dict = {
          \ 'belowright': 'bel sp',
          \ 'botright': 'bot sp',
          \ 'tab': 'tabe',
          \ 'vertical': 'vs',
          \ }

    let mods = a:mods
    for l:key in keys(mods_dict)
      let mods = substitute(mods, l:key, mods_dict[l:key], '')
    endfor
    let mods .= ' | '

    return mods
  endfunction
endif

function! s:insert_count(mods, count) abort
  if a:count == 0
    return a:mods
  endif

  let cnt = a:count .' '
  if empty(a:mods)
    return ''
  endif

  let patterns = [' \zs\ze\(vs\|sp\)', '\v(topleft|botright)\zs ']
  let mods = a:mods
  for pat in patterns
    let mods = substitute(mods, pat, cnt, '')
    if mods !=# mods
      return mods
    endif
  endfor
  let g:foo = mods

  return mods
endfunction

function! s:term_cmd(count, mods, ...) abort
  let shell = a:0 > 0 ? join(a:000) : ''
  if has('nvim')
    let mods = s:set_mods(a:mods)
    let mods = s:insert_count(mods, a:count)
    let command = mods .' term '. shell

  else
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
    let command = a:mods .' term '. opt .' '. shell
  endif

  exe command
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

