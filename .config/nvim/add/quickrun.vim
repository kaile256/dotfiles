" From: external.toml
" Repo: thinca/vim-quickrun

let g:quickrun_no_default_key_mappings = 1

let g:quickrun_config = {
      \ 'runner': 'vimproc',
      \ 'runner/vimproc/updatetime': 100,
      \ 'outputter': 'loclist',
      \ 'outputter/buffer/append': 1,
      \ 'outputter/buffer/into': 1,
      \ 'outputter/buffer/close_on_empty': 1,
      \ 'hook/time/enable': 1,
      \ }

let g:quickrun_config.markdown = {
      \ 'type': 'markdown/pandoc',
      \ 'outputter/browser/name': 'qutebrowser'
      \ }

xnoremap <silent> qr :QuickRun<cr>
xnoremap <silent> qR :QuickRun<cr>

nnoremap <silent> qR  :<c-u>QuickRun<cr>
nnoremap <silent> qrr :<c-u>QuickRun<cr>
nmap qr <Plug>(quickrun-op)

nnoremap <silent> qR  :<c-u>call <SID>quickrun_holding_ft()<cr>
nnoremap <silent> qrr :<c-u>call <SID>quickrun_holding_ft()<cr>
function! s:quickrun_holding_ft() abort
  let l:ft = &ft
  QuickRun
  let l:id = bufwinid('\[quickrun output\]')
  call win_gotoid(l:id)
  exe 'setl ft='. l:ft
  wincmd p
endfunction
