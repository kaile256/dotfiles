" From: tool.toml
" Repo: wsdjeg/dein-ui.vim

cnoreabbrev <expr> du (getcmdtype() == ':' && getcmdline() =~ '^du$')? 'DeinUpdate' : 'du'

augroup myDeinUiAdd
  au FileType SpaceVimPlugManager setl signcolumn=
augroup END

