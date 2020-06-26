" From: init.vim
" Another: tmaps.vim
" Another: lazy/terminal.vim

function! s:term_open(mods, ...) abort
  try
    cd %:h
  catch /E472: Command failed/
    cd ~
  endtry

  if has('nvim')
    exe 'term fish'
    startinsert
    return
  endif

  let opt = '++close'
  for arg in a:000
    if arg =~# '^++'
      let opt .= ' '. arg
    endif
  endfor
  exe a:mods 'term' opt 'fish'
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
