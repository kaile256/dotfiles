" From: init.vim
" Another: tmaps.vim
" Another: lazy/terminal.vim

function! s:term_open(mods, path) abort
  let path = a:path
  if path ==# ''
    let path = substitute(expand('%:p:h'), '\S\+://', '', '')
  endif
  if &ft ==# 'defx'
    let path = matchstr(getline(1), ':\zs\f\+')
  endif

  try
    exe 'cd' path
  catch /^Vim\%((\a\+)\)\=:E\(472\|499\)/
    cd ~
  endtry

  let shell = 'fish -C "cd '. path .'"'

  if has('nvim')
    let term_open = 'term '. shell
  else
    let opt = '++close'
    for arg in a:000
      if arg =~# '^++'
        let opt .= ' '. arg
      endif
    endfor
    let term_open = a:mods .' term '. opt .' '. shell
  endif

  exe term_open
  startinsert
endfunction

command! -bar -nargs=* TermOpen :call s:term_open(<q-mods>, <q-args>)

" Note: <Space>t would be mapped by some easymotion like plugins.
if has('nvim')
  nnoremap <silent> <A-t>e :<C-u>TermOpen<CR>
  nnoremap <silent> <A-t>v :<C-u>vs   <bar>   TermOpen<CR>
  nnoremap <silent> <A-t>s :<C-u>sp   <bar>   TermOpen<CR>
  nnoremap <silent> <A-t>t :<C-u>tabe <bar>   TermOpen<CR>
  nnoremap <silent> <A-t>b :<C-u>bot  sp<bar> TermOpen<CR>

  nnoremap <silent> <A-t>E :<C-u>TermOpen $HOME<CR>
  nnoremap <silent> <A-t>V :<C-u>vs   <bar>   TermOpen $HOME<CR>
  nnoremap <silent> <A-t>S :<C-u>sp   <bar>   TermOpen $HOME<CR>
  nnoremap <silent> <A-t>T :<C-u>tabe <bar>   TermOpen $HOME<CR>
  nnoremap <silent> <A-t>B :<C-u>bot  sp<bar> TermOpen $HOME<CR>
else
  nnoremap <silent> <A-t>e :<C-u>TermOpen fish ++curwin<CR>
  nnoremap <silent> <A-t>v :<C-u>vert TermOpen<CR>
  nnoremap <silent> <A-t>s :<C-u>bel  TermOpen<CR>
  nnoremap <silent> <A-t>t :<C-u>tab  TermOpen<CR>
  nnoremap <silent> <A-t>b :<C-u>bot  TermOpen<CR>
endif

nmap <A-t><A-t> <A-t>t
nmap <A-t><A-e> <A-t>e
nmap <A-t><A-v> <A-t>v
nmap <A-t><A-s> <A-t>s
nmap <A-t><A-b> <A-t>b
