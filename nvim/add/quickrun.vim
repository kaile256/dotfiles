" From: external.toml

let g:quickrun_config = {
      \ 'runner': 'vimproc',
      \ 'runner/vimproc/updatetime': 100,
      \ 'outputter': 'loclist',
      \ 'outputter/buffer/append': 1,
      \ 'outputter/buffer/filetype': '&ft',
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


augroup QuickRunAutoConf
  au!
  " TODO: keep ft on quickrun-buffer.
  "au FileType quickrun call quickrun#keep_ft()
  "au BufWinEnter [quickrun\ output] call quickrun#keep_ft()
  "au BufWinEnter *output] call quickrun#keep_ft()
  au BufWinEnter *output] call quickrun#keep_ft()
  function! quickrun#keep_ft() abort
    wincmd p
    let l:ft = &ft
    exe 'set ft='. l:ft
    wincmd p
  endfunction
augroup END
