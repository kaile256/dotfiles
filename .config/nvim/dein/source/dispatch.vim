" TOML: debug.toml
" Repo: tpope/vim-dispatch
" Another: add/dispatch.vim

let g:dispatch_no_maps = 1

augroup myDispatchSource
  au QuickFixCmdPost Make,Dispatch :copen
augroup END
