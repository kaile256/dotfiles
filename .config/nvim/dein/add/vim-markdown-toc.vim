" From: markdown.toml
" Repo: mzlogin/vim-markdown-toc
" Another: source/markdown-toc.vim

augroup myMarkdownTocAdd
  if exists('#myMarkdownTocAdd') | au! myMarkdownTocAdd
  endif
  au FileType markdown command -bar -buffer TocGenGFM       :GenTocGFM
  au FileType markdown command -bar -buffer TocGenGitlab    :GenTocGitlab
  au FileType markdown command -bar -buffer TocGenMarked    :GenTocMarked
  au FileType markdown command -bar -buffer TocGenRedcarpet :GenTocRedcarpet

  au FileType markdown command -bar -buffer TocUpdate :UpdateToc
  au FileType markdown command -bar -buffer TocRemove :RemoveToc
augroup END
