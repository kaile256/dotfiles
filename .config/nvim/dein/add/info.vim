" From: external.toml
" Repo: HiPhish/info.vim

augroup myInfoAdd
  if exists('#myInfoAdd') | au! myInfoAdd
  endif
  exe 'au' TermOpen '* setl keywordprg=:Info'
augroup END
