" TOML: default.toml
" Repo: tyru/vim-altercmd

CAlterCommand ch checkhealth <bar> setl bt=nofile
CAlterCommand man Man
CAlterCommand dof exe len(tabpagebuflist()) == 2 ? 'windo diffoff!' : 'diffoff!'
CAlterCommand dth exe len(tabpagebuflist()) == 2 ? 'windo diffthis' : 'diffthis'
