" From: filetype.vim
" BuiltIn: runtime/ftplugin/markdown.vim
" Another: syntax/markdown.vim

augroup myMarkdownFtplugin-modify_trailing_spaces
  au!
  au BufWritePre <buffer> %s/\s\{3,}$/  /e
  au BufWritePre <buffer> %s/\s\@<!\s$//e
augroup END

setlocal foldlevel=1
setlocal tabstop=4 softtabstop=4 shiftwidth=4

" see /usr/share/nvim/runtime/syntax/markdown.vim
" Ref: https://github.com/tpope/vim-markdown (dev ver)
let g:markdown_fenced_languages = [
      \ 'bash=sh',
      \ 'css',
      \ 'go',
      \ 'help',
      \ 'js=javascript',
      \ 'json',
      \ 'python',
      \ 'toml',
      \ 'ts=typescript',
      \ 'vim',
      \ 'yaml',
      \ ]

let g:markdown_syntax_conceal = 0

let g:markdown_minlines = 80
