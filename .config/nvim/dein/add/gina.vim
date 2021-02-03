" TOML: git.toml
" Repo: lambdalisue/gina.vim
" Another: post/gina.vim

if dein#tap('indentLine')
  " Note: It seems too late to apply these autocmds on `hook_source`.
  augroup Gina/Sou-MakeshiftConcealOptions
    au FileType gina,gina-* let b:indentLine_original_conceallevel = 3
    au FileType gina,gina-* let b:indentLine_original_concealcursor = 'nci'
  augroup END
endif

