" From: shell.toml
" Repo: thinca/vim-quickrun
" Another: source/quickrun.vim
" Ref: source/quickrun-unittest.vim

command! -nargs=* -range=0 -complete=customlist,quickrun#complete
      \ Qu
      \ :call quickrun#command(<q-args>, <count>, <line1>, <line2>)

" Mnemonic: pseudo Source
nmap \r <Plug>(quickrun-op)
noremap <silent> <SID>(quickrun-with-input)
      \ :<c-u>call <SID>quickrun_holding_syn(input('QuickRun: '))<cr>
noremap <silent> <SID>(quickrun-holding-syn)
      \ :<c-u>call <SID>quickrun_holding_syn()<cr>

nnoremap <script> \<CR> <SID>(quickrun-with-input)
xnoremap <script> \<CR> <SID>(quickrun-with-input)
nnoremap <script> \\ <SID>(quickrun-holding-syn)
xnoremap <script> \\ <SID>(quickrun-holding-syn)
nnoremap <script> \rr <SID>(quickrun-holding-syn)
nnoremap <script> \R  <SID>(quickrun-holding-syn)
xnoremap <script> \r  <SID>(quickrun-holding-syn)

function! s:quickrun_holding_syn(...) abort
  if &readonly || !&modifiable
    echohl WarningMsg
    echo 'This buffer is *not* for QuickRun'
    echohl Normal
    return
  elseif filewritable(expand('%:p'))
    silent w
  endif

  let bufnr = bufnr('%')
  let syn = getbufvar(bufnr, '&syntax')

  let input = a:0 > 0 ? a:1 : ''
  exe 'QuickRun <='. input

  let bufnr_qr = bufnr('\[quickrun output\]')
  call setbufvar(bufnr_qr, '&syntax', syn)
endfunction

augroup myQuickrunAdd
  if exists('#myQuickrunAdd')
    au! myQuickrunAdd
  endif
  au FileType quickrun call s:quickrun_keymaps()
augroup END

function! s:quickrun_keymaps() abort
  noremap <script><silent><buffer> <SID>(quickrun-holding-syn)
        \ <c-w>p
        \ <SID>(quickrun-holding-syn)
        \ <c-w>p
endfunction

