" From: shell.toml
" Repo: thinca/vim-quickrun
" Another: source/quickrun.vim
" Ref: source/quickrun-unittest.vim

command! -nargs=* -range=0 -complete=customlist,quickrun#complete
      \ Qu
      \ :call quickrun#command(<q-args>, <count>, <line1>, <line2>)

" Mnemonic: pseudo Source
nmap \s <Plug>(quickrun-op)
noremap <silent> <Plug>(quickrun-holding-ft)
      \ :<c-u>call <SID>quickrun_holding_ft()<cr>

nmap \ss <Plug>(quickrun-holding-ft)
nmap \S  <Plug>(quickrun-holding-ft)
xmap \s  <Plug>(quickrun-holding-ft)
xmap \S  <Plug>(quickrun-holding-ft)

function! s:quickrun_holding_ft() abort
  let bufnr = bufnr('%')
  let ft = getbufvar(bufnr, '&filetype')
  QuickRun
  let bufnr_qr = bufnr('\[quickrun output]')
  call setbufvar(bufnr_qr, '&filetype', ft)
endfunction

augroup myQuickrunAdd
  au!
  au BufWinEnter * call s:quickrun_keymaps()
augroup END

function! s:quickrun_keymaps() abort
  if expand('%') !~# '\[quickrun output]$' | return | endif

  noremap <silent><buffer> <Plug>(quickrun-holding-ft)
        \ <c-w>p
        \ :<c-u>call <SID>quickrun_holding_ft()<cr>
        \ <c-w>p
endfunction

