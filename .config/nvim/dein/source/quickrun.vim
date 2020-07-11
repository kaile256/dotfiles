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
"   'neovim_job' from 'lambdalisue/vim-quickrun-neovim-job':
"       is faster to compile; too slow to show the result.
"       shows result only after all the results are calculated.
"
"   'neovim_terminal' from 'syusui-s/vim-quickrun-neovim-terminal':
"       quick but returns no time-recoding, only leaves a tail of output.
"
"   'nvimterm' from 'statiolake/vim-quickrun-runner-nvimterm':
"       seems to work more asynchronously than 'neovim_terminal'.
"       quick but returns no time-recoding, only leaves a tail of output.
"       It overrides outputter with 'null',
"       which ignore 'outputter/any/config'; the buftype must be 'terminal'.

if exists('*ch_close_in')
  let g:quickrun_config['_'] = {
        \ 'runner': 'job',
        \ }

else
  let g:quickrun_config['_'] = {
        \ 'runner': 'vimproc',
        \ 'runner/vimproc/updatetime': 600,
        \ }
endif

call extend(g:quickrun_config['_'], {
      \ 'outputter': 'loclist',
      \ 'outputter/buffer/append': 1,
      \ 'outputter/buffer/close_on_empty': 1,
      \ 'hook/time/enable': 1,
      \ })

let g:quickrun_config['cpp'] = {
      \ 'type': 'cpp/g++',
      \ 'input': '=@+',
      \ 'cmdopt': '-std=c++14'
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
