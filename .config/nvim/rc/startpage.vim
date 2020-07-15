" From: init.vim

if exists('#myStartpage') | au! myStartpage
endif
augroup myStartpage
  " FIXME: currently, no syntax/keymaps on defx
  if has('nvim')
    au VimEnter * ++nested silent! call s:startpage('fish')
  endif
augroup END

function! s:startpage(page) abort
  " Ref: mhinz/vim-startify/plugin/startify.vim @ s:on_vimenter()
  if argc() || line2byte('$') != -1 | return | endif

  if executable(a:page)
    if has('nvim')
      call termopen(a:page)
    else
      " FIXME: Disturb to open terminal twice on Vim.
      term ++curwin ++close fish
      call feedkeys("\<C-d>", 'n')
    endif
    setl nonumber signcolumn=no
    call feedkeys("\<C-\>\<C-n>", 'n')
    return
  endif

  exe 'e' a:page
endfunction
