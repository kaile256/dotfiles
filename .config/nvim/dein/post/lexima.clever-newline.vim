" TOML: insert.toml
" Repo: cohama/lexima.vim
" TOML: myplug.toml
" Repo: $DEIN_PRIVATE_HOME/vim-clever-newline

" WIP
function! s:SID() abort
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID$')
endfunction

imap <SID>(clever-newline) <Plug>(clever-newline)

" call lexima#add_rule({'char': '<script><CR>', 'input': s:SID .'(clever-newline)'})
" call lexima#add_rule({'char': '<script><NL>', 'input': s:SID .'(clever-newline)'})
call lexima#add_rule({'char': '<script><CR>', 'input': s:SID() .'(clever-newline)'})
call lexima#add_rule({'char': '<script><NL>', 'input': s:SID() .'(clever-newline)'})

