" TOML: default.toml
" Repo: tyru/vim-altercmd

CAlterCommand ch checkhealth <bar> setl bt=nofile

CAlterCommand dof exe len(tabpagebuflist()) == 2 ? 'windo diffoff!' : 'diffoff!'
CAlterCommand dth exe len(tabpagebuflist()) == 2 ? 'windo diffthis' : 'diffthis'

CAlterCommand man   Man
CAlterCommand hg    helpgrep
CAlterCommand hgrep helpgrep

CAlterCommand we exe (&modified ? 'up' : 'checktime') '<bar> e'

CAlterCommand g keeppatterns g
CAlterCommand v keeppatterns v

CAlterCommand mv Rename

