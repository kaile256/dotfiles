" TOML: insert.toml
" Repo: cohama/lexima.vim
" Another: add/lexima.vim

" in lexima, <c-h> is unequal to <BS>
imap <c-h> <BS>
cmap <c-h> <BS>

" inoremap <expr> <c-j> lexima#expand('<C-j>', 'i')
" FIXME: it makes any other keys correctly.
" call lexima#insmode#define_altanative_key('<C-j>', '<CR>')

" TODO: extend g:lexima#newline_rules for <C-j> to work like <CR>, too
" g:lexima#newline_rules is a list of dict

" Note: '\%#' represents the cursor position; see the help.
" Excerpt: Available Values for rule {{{1
"   char: the only required key
"
"   at: (Regex) where the cursor should be.
"   except: (Regex) where the rule must *not* be applied.
"
"   input: (String) input instead of 'char'.
"   input_after: (String) insert the string after the cursor.
"   leave: move the cusor to the right as the count
"
"   delete: (Number/String) delete the number of right characters of the cursor;
"     usually use it for {'char': '<BS>'}. It is dot-repeatable in spite of
"     '<Del>' in 'input'
"
"   mode: available values are ['i', ':', '/', '?', 'c']; default as 'i'
"   filetype: set it or work on any filetypes
"   syntax: like vimString, Constant, NonText
"   priority: the bigger, the higher priority; default as 0.

" Overwrite default rules {{{1

let g:lexima#default_rules = [
      \ {'char': '(', 'at': '\\\%#'},
      \ {'char': '(', 'input_after': ')'},
      \ {'char': ')', 'at': '\%#)', 'leave': 1},
      \ {'char': '[', 'at': '\\\%#'},
      \ {'char': '[', 'input_after': ']'},
      \ {'char': ']', 'at': '\%#]', 'leave': 1},
      \ {'char': '{', 'input_after': '}'},
      \ {'char': '}', 'at': '\%#}', 'leave': 1},
      \ ]

let g:lexima#default_rules += [
      \ {'char': "'", 'at': "''\\%#", 'input_after': "'''"},
      \ {'char': "'", 'at': '\%#''',   'leave': 1},
      \ {'char': "'", 'at': "\\%#'''", 'leave': 3},
      \ {'char': "'", 'at': '\\\%#'},
      \ {'char': "'", 'at': '\w\%#''\@!'},
      \ {'char': "'", 'input_after': "'"},
      \
      \ {'char': '"', 'at': '""\%#', 'input_after': '"""'},
      \ {'char': '"', 'at': '\%#"""', 'leave': 3},
      \ {'char': '"', 'at': '\%#"', 'leave': 1},
      \ {'char': '"', 'at': '\\\%#'},
      \ {'char': '"', 'input_after': '"'},
      \
      \ {'char': '`', 'at': '\%#`', 'leave': 1},
      \ {'char': '`', 'at': '\%#```', 'leave': 3},
      \ {'char': '`', 'at': '``\%#', 'input_after': '```'},
      \ {'char': '`', 'input_after': '`'},
      \ ]

" Overwrite rules of Backspaces {{{1
let g:lexima#default_rules += [
      \ {'char': '<BS>', 'at': '(\%#)',   'delete': 1},
      \ {'char': '<BS>', 'at': '{\%#}',   'delete': 1},
      \ {'char': '<BS>', 'at': '\[\%#\]', 'delete': 1},
      \
      \ {'char': '<BS>', 'at': "'\\%#'", 'delete': 1},
      \ {'char': '<BS>', 'at': '"\%#"',  'delete': 1},
      \ {'char': '<BS>', 'at': '`\%#`',  'delete': 1},
      \
      \ {'char': '<BS>', 'at': "'''\\%#'''", 'input': '<BS><BS><BS>', 'delete': 3},
      \ {'char': '<BS>', 'at': '"""\%#"""',  'input': '<BS><BS><BS>', 'delete': 3},
      \ {'char': '<BS>', 'at': '```\%#```',  'input': '<BS><BS><BS>', 'delete': 3},
      \ ]

" Overwrite rules on FileType {{{1
let g:lexima#default_rules += [
      \ {'char': '"', 'at': '^\s*\%#', 'filetype': 'vim'},
      \ {'char': '"', 'at': '\%#\s*$', 'filetype': 'vim'},
      \ {'char': "'", 'at': '\\\%#', 'leave': 1, 'filetype': ['vim', 'sh', 'csh', 'ruby', 'tcsh', 'zsh']},
      \
      \ {'char': "'", 'at': "^\s\+'''\r\%#\r'''", 'input_after': "''", 'filetype': 'toml'},
      \ ]

" suppress rules
let g:lexima#default_rules += [
      \ {'char': "'", 'filetype': ['haskell', 'lisp', 'clojure', 'ocaml', 'reason', 'scala', 'rust']},
      \ {'char': '`', 'filetype': ['ocaml', 'reason']},
      \ ]

" function! s:substitute(list, before, after) abort "{{{1
"   let ret_dict = {}
"   let s:key_exchange = {arg -> substitute(arg, a:before, a:after, '', 'g')}
"   for dict in deepcopy(a:list)
"     let wanted_val = map(dict, {key, _ -> {s:key_exchange(key)}})
"     let wanted_key = map(dict, {_, val -> {s:key_exchange(val)}})
"     let wanted_dict = {wanted_key : wanted_val}
"     call extend(ret_dict, wanted_dict)
"   endfor
"   unlet s:key_exchange
"   return ret_dict
" endfunction

" Addtional rules {{{1
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
" Addtional Rules in loop {{{1
" let s:rules = {}
" let s:rules.newlines = [
"      \ {'char': '<C-j>', 'at': '(\%#)', 'input_after': '<CR>'},
"      \ {'char': '<C-j>', 'at': '{\%#}', 'input_after': '<CR>'},
"      \ {'char': '<C-j>', 'at': '\[\%#]', 'input_after': '<CR>'},
"      \
"      \ {'char': '<C-j>', 'at': '(\%#$', 'input_after': '<CR>)',
"      \   'except': '\C\v^(\s*)\S.*%#\n%(%(\s*|\1\s.+)\n)*\1\)'},
"      \ {'char': '<C-j>', 'at': '{\%#$', 'input_after': '<CR>' ,
"      \   'except': '\C\v^(\s*)\S.*%#\n%(%(\s*|\1\s.+)\n)*\1\}'},
"      \ {'char': '<C-j>', 'at': '\[\%#$', 'input_after': '<CR>]',
"      \   'except': '\C\v^(\s*)\S.*%#\n%(%(\s*|\1\s.+)\n)*\1\]'},
"      \ ]

" for rules in keys(s:rules)
"   for dict in rules
"     call lexima#add_rule(dict)
"   endfor
" endfor
" unlet s:rules

" Finally: Override the rules though lexima#add_rule() "{{{1
call lexima#set_default_rules()
