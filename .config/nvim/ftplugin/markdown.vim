" From: filetype.vim

setl nowrap fdl=1 conceallevel=0
setl tabstop=4 softtabstop=4 shiftwidth=4

hi! link htmlLink Statement
hi! link markdownHeadingDelimiter PreProc

hi! link TrailingSpacesOnce  DiffText
hi! link TrailingSpacesTwice PmenuThumb
hi! link TrailingSpacesMore  DiffText

let b:trailingSpaces = matchadd('TrailingSpacesOnce',  '\S\zs $')
let b:trailingSpaces = matchadd('TrailingSpacesTwice', '\S\zs  $')
let b:trailingSpaces = matchadd('TrailingSpacesMore',  '\S\zs   \+$')

if get(s:, 'loaded', 0) | finish | endif
let s:loaded = 1

" see /usr/share/nvim/runtime/syntax/markdown.vim
" Ref: https://github.com/tpope/vim-markdown (dev ver)
let g:markdown_fenced_languages = [
      \ 'bash=sh',
      \ 'go',
      \ 'help',
      \ 'json',
      \ 'python',
      \ 'toml',
      \ 'vim',
      \ 'yaml',
      \ ]

let g:markdown_syntax_conceal = 0

let g:markdown_minlines = 80
