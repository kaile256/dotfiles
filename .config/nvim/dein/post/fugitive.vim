" From: fugitive.toml
" Repo: tpope/vim-fugitive
" Another: add/fugitive.vim
" Another: source/fugitive.vim

" `:norm gu` to set cursor inside a block
command! -bang -bar -range=-1
      \ Gstatus
      \ exe fugitive#Command(<line1>, <count>, +"<range>", <bang>0, "<mods>", <q-args>)
      \ .'| norm gu'

command! -bar -bang -nargs=* -complete=customlist,fugitive#EditComplete
      \ Gdiffsplit
      \ :exe fugitive#Diffsplit(0, <bang>0, "<mods>", <q-args>, ['--function-context', <f-args>])
