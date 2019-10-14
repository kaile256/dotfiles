" From: external.toml

let g:quickrun_config = {
      \ 'runner': 'vimproc',
      \ 'runner/vimproc/updatetime': 100,
      \ 'outputter': 'quickfix',
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

xnoremap qr :QuickRun<cr>
xnoremap qR :QuickRun<cr>

nnoremap qR  :<c-u>QuickRun<cr>
nnoremap qrr :<c-u>QuickRun<cr>
nmap qr <Plug>(quickrun-op)


augroup QuickRunAutoConf
  au!
  " TODO: keep ft on quickrun-buffer.
  au FileType quickrun call quickrun#keep_ft()
  function! quickrun#keep_ft() abort
    wincmd p
    let l:ft = &l:ft
    exe 'setl ft='. l:ft
    wincmd p
  endfunction
augroup END
