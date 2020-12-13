" From: insert.toml
" Repo: rhysd/vim-grammarous

" Operator mappings
" <Plug>(operator-grammarous)

" Specify filetype at first; * is for every filetypes.
let g:grammarous#disabled_categories = {
           \ '*' : ['PUNCTUATION'],
           \ 'help' : ['PUNCTUATION', 'TYPOGRAPHY'],
           \ }

" If 0, check on all the lines in the filetype buffer.
let g:grammarous#default_comments_only_filetypes = {
      \ '*': 1,
      \ 'help': 0,
      \ 'markdown': 0,
      \ }

let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
endfunction
function! g:grammarous#hooks.on_reset(errs) abort
endfunction
