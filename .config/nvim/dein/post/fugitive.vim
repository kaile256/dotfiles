" From: fugitive.toml
" Repo: tpope/vim-fugitive
" Another: add/fugitive.vim
" Another: source/fugitive.vim

" `:norm gu` to set cursor inside a block
command! -bang -bar -range=-1
      \ Gstatus
      \ exe fugitive#Command(<line1>, <count>, +"<range>", <bang>0, "<mods>", <q-args>)
      \ .'| norm gu'

