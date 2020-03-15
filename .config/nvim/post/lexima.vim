" TOML: insert.toml
" Repo: cohama/lexima.vim
" Another: add/lexima.vim

" in lexima, <c-h> is unequal to <BS>
imap <c-h> <BS>
cmap <c-h> <BS>

" inoremap <expr> <c-j> lexima#expand('<C-j>', 'i')
" " g:lexima#newline_rules is a list of dict

" call map(g:lexima#newline_rules, {key, val -> s:substitute(key, val, '<CR>', '<C-j>')})

" function! s:substitute(list, before, after) abort "{{{1
"   for dict in a:list
"     let wanted = substitute(dict, a:before, a:after)
"     call extend(a:list, wanted, 'force')
"   endfor
" endfunction

" Available:
"   char: the only required key
"   at: (regex) where the cursor should be.
"   except: (regex) where the rule must *not* be applied.
"   input input_after
"   mode: available values are ['i', ':', '/', '?', 'c']
"   leave: move the cusor to the right as the count
"   delete: useful for dot-repeat
"   filetype: set it or work on any filetypes
"   syntax: like vimString, Constant, NonText
"   priority: the bigger, the higher priority; default is set to 0.
" Note: '\%#' represents the cursor position; see the help.
" Ref: Jump cursor over the provided pairs
"   https://karubabu.hateblo.jp/entry/2017/05/24/190010
call lexima#add_rule({'char': '<TAB>', 'at': '\%#)', 'leave': 1})
call lexima#add_rule({'char': '<TAB>', 'at': '\%#"', 'leave': 1})
call lexima#add_rule({'char': '<TAB>', 'at': '\%#]', 'leave': 1})
call lexima#add_rule({'char': '<TAB>', 'at': '\%#}', 'leave': 1})
" Notice: single quote in double quotes sometimes fails to apply the rule
call lexima#add_rule({'char': '<TAB>', 'at': '\%#''', 'leave': 1})

" Ref: Activate :iabbr through lexima
"   http://pekepekesamurai.hatenablog.com/entry/2015/04/23/223559
call lexima#insmode#map_hook('before', '<Space>', "\<C-]>")
call lexima#insmode#map_hook('before', '<CR>', "\<C-]>")
" call lexima#insmode#map_hook('before', '<C-j>', "\<C-]>")
