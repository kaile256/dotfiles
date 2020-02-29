" From: shell.toml
" Repo: thinca/vim-quickrun
" Another: source/quickrun.vim
" Ref: source/quickrun-unittest.vim

command! -nargs=* -range=0 -complete=customlist,quickrun#complete
      \ Qu
      \ :call quickrun#command(<q-args>, <count>, <line1>, <line2>)

" Mnemonic: pseudo Source
nmap \r <Plug>(quickrun-op)
nnoremap <silent> <SID>(quickrun-holding-ft)
      \ :<c-u>call <SID>quickrun_holding_ft()<cr>
xnoremap <silent> <SID>(quickrun-holding-ft)
      \ :<c-u>call <SID>quickrun_holding_ft()<cr>

nnoremap <script> \rr <SID>(quickrun-holding-ft)
nnoremap <script> \R  <SID>(quickrun-holding-ft)
xnoremap <script> \r  <SID>(quickrun-holding-ft)

function! s:quickrun_holding_ft() abort
  let bufnr = bufnr('%')
  let ft = getbufvar(bufnr, '&filetype')
  QuickRun
  let bufnr_qr = bufnr('\[quickrun output\]')
  call setbufvar(bufnr_qr, '&filetype', ft)
endfunction

augroup myQuickrunAdd
  au!
  au BufWinEnter * call s:quickrun_keymaps()
augroup END

function! s:quickrun_keymaps() abort
  if expand('%') !~# '\[quickrun output]$' | return | endif

  noremap <script><silent><buffer> <SID>(quickrun-holding-ft)
        \ <c-w>p
        \ <SID>(quickrun-holding-ft)
        \ <c-w>p
endfunction

