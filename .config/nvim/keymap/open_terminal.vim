" From: init.vim
" Another: tmaps.vim
" Another: lazy/terminal.vim

function! s:term_open(mods, ...) abort
  let path = expand('%:p:h')
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

command! -bar -nargs=* TermOpen :call s:term_open(<q-mods>, <f-args>)

if has('nvim')
  nnoremap <silent> <space>te :<C-u>TermOpen<CR>
  nnoremap <silent> <space>tv :<C-u>vs   <bar>   TermOpen<CR>
  nnoremap <silent> <space>ts :<C-u>sp   <bar>   TermOpen<CR>
  nnoremap <silent> <space>tt :<C-u>tabe <bar>   TermOpen<CR>
  nnoremap <silent> <space>tb :<C-u>bot  sp<bar> TermOpen<CR>
else
  nnoremap <silent> <space>te :<C-u>TermOpen fish ++curwin<CR>
  nnoremap <silent> <space>tv :<C-u>vert TermOpen<CR>
  nnoremap <silent> <space>ts :<C-u>bel  TermOpen<CR>
  nnoremap <silent> <space>tt :<C-u>tab  TermOpen<CR>
  nnoremap <silent> <space>tS :<C-u>bot  TermOpen<CR>
endif
