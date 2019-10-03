" From: tool.toml

let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'outputter': 'browser'
      \ }

xnoremap qr :QuickRun<cr>
xnoremap qR :QuickRun<cr>

nnoremap qR  :<c-u>QuickRun<cr>
nnoremap qrr :<c-u>QuickRun<cr>
nnoremap <silent> qr
      \ :<c-u>set operatorfunc=quickrun#operator<cr>g@
