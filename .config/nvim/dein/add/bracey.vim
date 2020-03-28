" TOML: xampp.toml
" Repo: turbio/bracey.vim
" Another: source/bracey.vim

augroup myBraceyAdd
  if exists('#myBraceyAdd') | au! myBraceyAdd
  endif
  au FileType html,php command! -bar PreviewHtml :Bracey
augroup end
