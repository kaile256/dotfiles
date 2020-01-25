" From: tool.toml
" Repo: wsdjeg/dein-ui.vim

cnoreabbrev <expr> du (getcmdtype() == ':' && getcmdline() =~ '^du$')? 'DeinUpdate' : 'du'
augroup MyDeinUiAugroup
  au!
  au FileType SpaceVimPlugManager setl signcolumn=
augroup END

