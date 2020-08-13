" TOML: operator.toml
" Repo: osyo-manga/vim-operator-exec_command

" Note: the second arg indicate noremap or not.
omap <expr> r '<Esc>'. operator#exec_command#mapexpr_gn(v:operator, 1)
omap <expr> R '<Esc>'. operator#exec_command#mapexpr_gN(v:operator, 1)
