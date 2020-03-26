" TOML: debug.toml
" Repo: tpope/vim-dispatch
" Another: add/dispatch.vim

let g:dispatch_no_maps = 1

augroup myDispatchSource
  if exists('#myDispatchSource') | au! myDispatchSource
  endif
  au QuickFixCmdPost Make,Dispatch :copen
augroup END
