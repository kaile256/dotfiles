" TOML: default.toml
" Repo: tyru/vim-altercmd
" Fork: kaile256/vim-altercmd

CAlterCommand ch checkhealth <bar> setlocal bt=nofile

CAlterCommand cmd command

CAlterCommand <expr> dof len(tabpagebuflist()) == 2
      \ ? 'windo diffoff!'
      \ : 'diffoff!'
CAlterCommand <expr> dth len(tabpagebuflist()) == 2
      \ ? 'windo diffthis'
      \ : 'diffthis'

CAlterCommand man   Man
CAlterCommand hg    helpgrep
CAlterCommand hgrep helpgrep

CAlterCommand we exe (&modified ? 'up' : 'checktime') '<bar> e'

CAlterCommand g keeppatterns g
CAlterCommand v keeppatterns v

CAlterCommand pro profile
CAlterCommand prof profile

if dein#tap('vim-eunuch')
  " Move: Type `./` for relative path.
  CAlterCommand <expr> mv exists('b:git_dir') ? 'GMove' : 'Move'
endif

if dein#tap('vim-scriptease')
  CAlterCommand scriptnames Scriptnames
endif

