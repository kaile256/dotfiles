" From: shell.toml
" Repo: thinca/vim-quickrun
" Another: source/quickrun.vim
" Ref: source/quickrun-unittest.vim

command! -nargs=* -range=0 -complete=customlist,quickrun#complete
      \ Qu
      \ :call quickrun#command(<q-args>, <count>, <line1>, <line2>)

" Mnemonic: pseudo Source
nmap \r <Plug>(quickrun-op)
nnoremap <silent> <SID>(quickrun-holding-syn)
      \ :<c-u>call <SID>quickrun_holding_syn()<cr>
xnoremap <silent> <SID>(quickrun-holding-syn)
      \ :<c-u>call <SID>quickrun_holding_syn()<cr>

nnoremap <script> \rr <SID>(quickrun-holding-syn)
nnoremap <script> \R  <SID>(quickrun-holding-syn)
xnoremap <script> \r  <SID>(quickrun-holding-syn)

function! s:quickrun_holding_syn() abort
  if filewritable(expand('%:p')) | w | endif

  let bufnr = bufnr('%')
  let syn = getbufvar(bufnr, '&syntax')
  QuickRun
  let bufnr_qr = bufnr('\[quickrun output\]')
  call setbufvar(bufnr_qr, '&syntax', syn)
endfunction

augroup myQuickrunAdd
  au!
  au FileType quickrun call s:quickrun_keymaps()
  au FileType quickrun setl nonumber fdl=99
augroup END

function! s:quickrun_keymaps() abort
  noremap <script><silent><buffer> <SID>(quickrun-holding-syn)
        \ <c-w>p
        \ <SID>(quickrun-holding-syn)
        \ <c-w>p
endfunction

