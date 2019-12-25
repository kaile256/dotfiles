" From: shell.toml
" Repo: thinca/vim-quickrun
" Ref: source/quickrun-unittest.vim

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

let g:quickrun_config['markdown'] = {
      \ 'type': 'markdown/pandoc',
      \ 'outputter/browser/name': 'qutebrowser'
      \ }

let g:quickrun_config['vim'] = {
      \ 'command': 'w | !vint --enable-neovim',
      \ }

" Ref: https://qiita.com/ssh0/items/2113db858ba5c9fd05df
let g:quickrun_config['texmath'] = {
      \ 'command': 'texmath',
      \ 'outputter': 'error',
      \ 'outputter/error/success': 'null',
      \ 'outputter/error/error': 'quickfix',
      \ 'srcfile': expand("%s"),
      \ 'exec': '%c %s',
      \ }

command! -nargs=* -range=0 -complete=customlist,quickrun#complete
      \ Qu
      \ :call quickrun#command(<q-args>, <count>, <line1>, <line2>)

" Mnemonic: pseudo Source
nmap \s <Plug>(quickrun-op)
"nnoremap <silent> \ss :<c-u>QuickRun<cr>
"nnoremap <silent> \S  :<c-u>QuickRun<cr>
"xnoremap <silent> \s :QuickRun<cr>
"xnoremap <silent> \S :QuickRun<cr>

nnoremap <silent> \ss :<c-u>call <SID>quickrun_holding_ft()<cr>
nnoremap <silent> \S  :<c-u>call <SID>quickrun_holding_ft()<cr>
xnoremap <silent> \s  :<c-u>call <SID>quickrun_holding_ft()<cr>
xnoremap <silent> \S  :<c-u>call <SID>quickrun_holding_ft()<cr>
function! s:quickrun_holding_ft() abort "{{{1
  let bufnr = bufnr('%')
  let ft = getbufvar(bufnr, '&filetype')
  QuickRun
  let bufnr_qr = bufnr('\[quickrun output\]')
  call setbufvar(bufnr_qr, '&filetype', ft)
endfunction

