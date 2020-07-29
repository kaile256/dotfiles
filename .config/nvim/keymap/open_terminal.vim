" From: init.vim
" Another: tmaps.vim
" Another: lazy/terminal.vim

command! -bar -nargs=* -range TermCmd  :call s:term_cmd(<q-range>,  <q-mods>, <f-args>)
command! -bar -nargs=* -range TermOpen :call s:term_open(<q-range>, <q-mods>, <f-args>)

command! -bar -nargs=* -range Vifm
      \ :exe '<mods> <range> TermCmd vifm' (empty(<q-args>)
      \   ? '--select '. s:set_path('%:p:h')
      \   : <q-args>)
      \ '| startinsert'

" Note: <Space>t would be mapped by some easymotion like plugins.
nnoremap <silent> <A-t>e :<C-u>TermOpen fish ++curwin<CR>
nnoremap <silent> <A-t>v :<C-u>vert TermOpen<CR>
nnoremap <silent> <A-t>s :<C-u>bel  TermOpen<CR>
nnoremap <silent> <A-t>t :<C-u>tab  TermOpen<CR>
nnoremap <silent> <A-t>b :<C-u>bot  TermOpen<CR>

nnoremap <silent> <A-t>E :<C-u>     TermOpen $HOME<CR>
nnoremap <silent> <A-t>V :<C-u>vert TermOpen $HOME<CR>
nnoremap <silent> <A-t>S :<C-u>bel  TermOpen $HOME<CR>
nnoremap <silent> <A-t>T :<C-u>tab  TermOpen $HOME<CR>
nnoremap <silent> <A-t>B :<C-u>bot  TermOpen $HOME<CR>

nmap <A-t><A-t> <A-t>t
nmap <A-t><A-e> <A-t>e
nmap <A-t><A-v> <A-t>v
nmap <A-t><A-s> <A-t>s
nmap <A-t><A-b> <A-t>b

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

function! s:term_cmd(range, mods, ...) abort
  let shell = a:0 > 0 ? join(a:000) : ''
  if has('nvim')
    let mods = s:set_mods(a:mods)
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

function! s:term_open(range, mods, ...) abort
  let path = ''
  if a:0 > 0
    let path = a:1 =~# '^++' ? a:000[len(a:000) - 1] : a:1
  endif
  let path = s:set_path(path)
  let shell = 'fish -C "cd '. path .'"'

  exe s:term_cmd(a:range, a:mods, shell)
  startinsert
endfunction

