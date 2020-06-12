" From: filetype.vim
" BuiltIn: runtime/ftplugin/markdown.vim
" Another: syntax/markdown.vim

" setl spell spl=en_us,cjk
setl fdl=1
"setl nowrap conceallevel=2 concealcursor=nc
setl tabstop=4 softtabstop=4 shiftwidth=4

" Note: (MAYBE WRONG)
"   leave `*`, instead of `-`, for unorder list style at first. Though all
"   the `*` for list shall be replaced with `-` by prettier, the lint will say
"   nothing after the replacement.
"   Ref: markdownlint MD004 ul-style

"inoremap <expr><buffer> *
"      \ (getline('.')[:col('.')] !~# '[^* \t]')
"      \ ? '- [ ] '
"      \ : '*'
"
"" FIXME: if matched, return true
"inoremap <expr><buffer> #
"      \ (getline('.') =~? '^\s*- \[\( \|x\)\]')
"      \ && (getline('.')[col('.') - 4 : col('.')] !=# '()\[]')
"      \ ? "[]()\<Left>"
"      \ : '#'

inoreabbr <expr><buffer> *
      \ (getline('.')[:col('.')] !~# '[^* \t]')
      \ ? '- [ ]'
      \ : '*'

" FIXME: if matched, return true
inoreabbr <expr><buffer> #
      \ (getline('.') =~? '^\s*- \[\( \|x\)\]')
      \ && (getline('.')[col('.') - 4 : col('.')] !=# '()\[]')
      \ ? "[]()\<Left>"
      \ : '#'

nnoremap <expr><silent><buffer> +
      \ (getline('.') =~# '^\s*#\+ \S')
      \ ? ':<c-u>silent! undojoin<cr>I#<esc>'
      \ : '+'

nnoremap <expr><silent><buffer> -
      \ (getline('.') =~# '^\s*#\+\s\S')
      \ ? ':<c-u>silent! undojoin<cr>^"_x'
      \ : (getline('.') =~# '- \[ ]')
      \ ? ':<c-u>silent! undojoin <bar> keeppattern s/\[ ]/\[x]<cr>'
      \ : (getline('.') =~? '- \[\a]')
      \ ? ':<c-u>silent! undojoin <bar> keeppattern s/\[\a]\c/\[ ]<cr>'
      \ : '-'

if get(s:, 'loaded', 0) | finish | endif "{{{1
let s:loaded = 1

"augroup myMarkdownFormat
"  au!
"" TODO: auto order numbers ahead of list
"  au BufWritePre markdown call s:auto_listnum()
"augroup END

function! s:auto_listnum() abort "{{{1
  let index = '\d\+\.'
  if !search(index, 'cnw') | return | endif

  let startline = getline(search(index, 'cw'))
  let col       = matchstrpos(startline, index)[1]

endfunction

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
