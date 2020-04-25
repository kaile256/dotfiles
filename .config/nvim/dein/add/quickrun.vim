" From: shell.toml
" Repo: thinca/vim-quickrun
" Another: source/quickrun.vim
" Ref: source/quickrun-unittest.vim

command! -nargs=* -range=0 -complete=customlist,quickrun#complete
      \ Qu
      \ :call quickrun#command(<q-args>, <count>, <line1>, <line2>)

" Mnemonic: pseudo Source
nmap \ <Plug>(quickrun-op)
noremap <silent> <SID>(quickrun-with-input)
      \ :<c-u>call <SID>quickrun_holding_syn(input('QuickRun: '))<cr>
noremap <silent> <SID>(quickrun-holding-syn)
      \ :<c-u>call <SID>quickrun_holding_syn()<cr>

nnoremap <script> \<CR> <SID>(quickrun-with-input)
xnoremap <script> \<CR> <SID>(quickrun-with-input)
nnoremap <script> \\ <SID>(quickrun-holding-syn)
xnoremap <script> \\ <SID>(quickrun-holding-syn)

function! s:quickrun_holding_syn(...) abort
  if &modifiable && !&readonly
    silent w
  endif

  let bufnr = bufnr('%')
  let syn = getbufvar(bufnr, '&syntax')

  let input = a:0 > 0 ? join(a:000) : ''
  exe 'QuickRun -args' string(input)

  let buflist = tabpagebuflist()
  " Note: some outputter is named unrelated to quickrun
  let bufnr_qr = buflist[len(buflist) - 1]

  if getbufvar(bufnr_qr, '&buftype') ==# 'terminal'
    if bufnr('%') == bufnr_qr
      " leave term-job mode
      call feedkeys("\<C-\>\<C-N>", 'n')
    else
      stopinsert
    endif
  endif

  "" at the time, line('$') probably returns 0.
  " if line('$') < 80
  "   " of cource, syntax will be done synchronously.
  "   call setbufvar(bufnr_qr, '&syntax', syn)
  " endif
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

