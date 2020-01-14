" From: markdown.toml
" Repo: skanehira/preview-markdown.vim

augroup myPreviewMarkdownSkanehiraAdd
  au!
  au FileType markdown command! -bar -buffer InsideVim :PreviewMarkdown
augroup END
