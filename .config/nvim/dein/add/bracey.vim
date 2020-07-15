" TOML: xampp.toml
" Repo: turbio/bracey.vim
" Another: source/bracey.vim

augroup myBraceyAdd
  au FileType html,php command! -bar PreviewHtml :Bracey
augroup end
