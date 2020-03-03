" From: init.vim

augroup myStartpage
  " FIXME: syntax/keymaps in defx
  au! VimEnter * nested silent! call s:startpage('fish')
augroup END

function! s:startpage(page) abort
  " Ref: mhinz/vim-startify/plugin/startify.vim @ s:on_vimenter()
  if argc() || line2byte('$') != -1 | return | endif

  if executable(a:page)
    call termopen(a:page)
    setl nonumber signcolumn=no
    return
  endif

  e a:page
endfunction
