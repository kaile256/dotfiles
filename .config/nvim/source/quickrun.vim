" From: shell.toml
" Repo: thinca/vim-quickrun
" Another: add/quickrun.vim
" Ref: source/quickrun-unittest.vim

let g:quickrun_no_default_key_mappings = 1

let g:quickrun_config = {
      \ 'runner': 'remote',
      \ 'runner/vimproc/updatetime': 100,
      \ 'outputter': 'loclist',
      \ 'outputter/buffer/append': 1,
      \ 'outputter/buffer/into': 1,
      \ 'outputter/buffer/close_on_empty': 1,
      \ 'hook/time/enable': 1,
      \ }

let g:quickrun_config['markdown'] = {
      \ 'type': 'markdown/pandoc',
      \ 'outputter': 'browser',
      \ 'outputter/browser/name': 'qutebrowser',
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

augroup myQuickrunSource
  au!
  au FileType quickrun setl nonumber fdl=99
augroup END
