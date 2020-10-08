" TOML: browse.toml
" Repo: dyng/ctrlsf.vim
" Another: post/ctrlsf.vim
" Another: source/ctrlsf.vim

" Mnemonic: Grep
nmap <space>G <Plug>CtrlSFCCwordExec
xmap <space>G <Plug>CtrlSFVwordExec

command! -nargs=* -range
      \ -complete=customlist,ctrlsf#comp#Completion
      \ Grep
      \ :exe 'CtrlSF' empty(<q-args>) ? CtrlSFGetVisualSelection() : <q-args>
