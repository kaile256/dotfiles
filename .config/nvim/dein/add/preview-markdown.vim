" From: markdown.toml
" Repo: skanehira/preview-markdown.vim

if exists('#myPreviewMarkdownSkanehiraAdd') | au! myPreviewMarkdownSkanehiraAdd
endif
augroup myPreviewMarkdownSkanehiraAdd
  au FileType markdown command! -bar -buffer InsideVim :PreviewMarkdown
augroup END
