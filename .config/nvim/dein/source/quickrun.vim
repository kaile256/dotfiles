" From: shell.toml
" Repo: thinca/vim-quickrun
" Another: add/quickrun.vim
" Ref: source/quickrun-unittest.vim

let g:quickrun_no_default_key_mappings = 1

nnoremap <expr><silent> <C-c>
      \ quickrun#is_running()
      \ ? quickrun#sweep_sessions()
      \ : "\<C-c>"

let g:quickrun_config = {}
" Note: runners remarks; either 'system' or 'shell' works on neovim.
"   'system' is default but too slow.
"   'shell' is fast but only returns in lee.
"   'vimproc' returns too late; freezes in 20 sec before showing result.
"   'python' returns error.
"   'remote' demands has('clientserver') is true.
"   'concurrent_process' returns nothing but expended time.
"   both 'job' and 'terminal' is, of cource, only available on Vim.
"   'vimscript' returns 'E78: Unknown mark'.
"
" Note: Non Official Plugins for neovim; they all don't work on 'develop'
"   'neovim_job' is fast to compile; too slow to show the result.
"   'neovim_terminal' is quick but returns no time-recoding
"   'nvimterm' works more synchronously than 'neovim_terminal'.

let g:quickrun_config['_'] = {
      \ 'runner': 'neovim_terminal',
      \ 'outputter': 'loclist',
      \ 'runner/neovim_terminal/into': 0,
      \ 'outputter/buffer/append': 1,
      \ 'outputter/buffer/close_on_empty': 1,
      \ 'hook/time/enable': 1,
      \ }

let g:quickrun_config.markdown = {
      \ 'type': 'markdown/pandoc',
      \ 'outputter': 'browser',
      \ 'outputter/browser/name': 'qutebrowser',
      \ }

" Ref: https://qiita.com/ssh0/items/2113db858ba5c9fd05df
let g:quickrun_config.texmath = {
      \ 'command': 'texmath',
      \ 'outputter': 'error',
      \ 'outputter/error/success': 'null',
      \ 'outputter/error/error': 'quickfix',
      \ 'srcfile': expand("%s"),
      \ 'exec': '%c %s',
      \ }

augroup myQuickrunSource
  if exists('#myQuickrunSource') | au! myQuickrunSource
  endif
  au FileType quickrun setl nonumber fdl=99 bt=nofile
augroup END
