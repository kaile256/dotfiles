" From: init.vim

augroup myStartpage
  " FIXME: currently, no syntax/keymaps on defx
  if has('nvim')
    au VimEnter * ++nested silent! call s:start_on_terminal()
  endif
augroup END

function! s:start_on_terminal() abort
  " Ref: mhinz/vim-startify/plugin/startify.vim @ s:on_vimenter()
  if argc() || line2byte('$') != -1 | return | endif

  let term_args = executable('fish') ? 'fish'
        \ : executable('bash') ? 'bash'
        \ : 'sh'

  if executable('fastfetch')
    const sh_args = 'fastfetch'
    const sh_flag_c = term_args ==# 'fish' ? '-C' : '-c'
    let term_args .= ' '. sh_flag_c .' '. string(sh_args)
  endif

  if has('nvim')
    call termopen(term_args)
  else
    " FIXME: Disturb to open terminal twice on Vim.
    exe 'term ++curwin ++close' term_args
    call feedkeys("\<C-d>", 'n')
  endif

  setlocal nonumber signcolumn=no
  call feedkeys("\<C-\>\<C-n>", 'n')
endfunction
