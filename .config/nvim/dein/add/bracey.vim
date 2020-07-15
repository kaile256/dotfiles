" TOML: xampp.toml
" Repo: turbio/bracey.vim
" Another: source/bracey.vim

if exists('#myBraceyAdd') | au! myBraceyAdd
endif
augroup myBraceyAdd
  au FileType html,php command! -bar PreviewHtml :Bracey
augroup end
