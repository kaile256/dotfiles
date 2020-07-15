" From: external.toml
" Repo: HiPhish/info.vim

if exists('#myInfoAdd') | au! myInfoAdd
endif
augroup myInfoAdd
  exe 'au' TermOpen '* setl keywordprg=:Info'
augroup END
