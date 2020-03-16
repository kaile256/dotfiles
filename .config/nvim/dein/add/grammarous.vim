" From: insert.toml
" Repo: rhysd/vim-grammarous

" <Plug>(grammarous-move-to-info-window)
" <Plug>(grammarous-open-info-window) Open the info window for the error under the cursor
" <Plug>(grammarous-reset)  Reset the current check
" <Plug>(grammarous-fixit)  Fix the error under the cursor automatically
" <Plug>(grammarous-fixall) Fix all the errors in a current buffer automatically
" <Plug>(grammarous-close-info-window)  Close the info window from checked buffer
" <Plug>(grammarous-remove-error) Remove the error under the cursor
" <Plug>(grammarous-disable-rule) Disable the grammar rule under the cursor
" <Plug>(grammarous-move-to-next-error) Move cursor to the next error
" <Plug>(grammarous-move-to-previous-error) Move cursor to the previous error

" Operator mappings
" <Plug>(operator-grammarous)

"" Specify filetype at first; * is for every filetypes.
"let g:grammarous#disabled_categories = {
"            \ '*' : ['PUNCTUATION'],
"            \ 'help' : ['PUNCTUATION', 'TYPOGRAPHY'],
"            \ }

let g:grammarous#hooks = {}

cnoreabbr <expr> gch  (getcmdtype() == ':' && getcmdline() =~ '^gch$')?  "GrammarousCheck" : 'gch'
cnoreabbr <expr> chg  (getcmdtype() == ':' && getcmdline() =~ '^chg$')?  "GrammarousCheck" : 'chg'

cnoreabbr <expr> endg (getcmdtype() == ':' && getcmdline() =~ '^endg$')? "GrammarousReset" : 'endg'
cnoreabbr <expr> gend (getcmdtype() == ':' && getcmdline() =~ '^gend$')? "GrammarousReset" : 'gend'
cnoreabbr <expr> gfin (getcmdtype() == ':' && getcmdline() =~ '^gfin$')? "GrammarousReset" : 'gfin'
cnoreabbr <expr> fing (getcmdtype() == ':' && getcmdline() =~ '^fing$')? "GrammarousReset" : 'fing'

function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
endfunction
