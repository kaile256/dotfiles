" TOML: insert.toml
" Repo: cohama/lexima.vim
" Another: add/lexima.vim

" in lexima, <c-h> is unequal to <BS>
map! <c-h> <BS>

call lexima#insmode#define_altanative_key('<C-j>', '<CR>')

" TODO: extend g:lexima#newline_rules for <C-j> to work like <CR>, too
" g:lexima#newline_rules is a list of dict

let g:lexima#default_rules = []
" Note: '\%#' represents the cursor position; see the help.
" Notice: single quote in double quotes sometimes fails to apply the rule.
" Notice: in double quotes, backslash requires double to escape
" Excerpt: Available Values for rule {{{1
"   char: the only required key to be mapped
"
"   at: (Regex) where the cursor should be.
"   except: (Regex) where the rule must *not* be applied.
"
"   input: (String) input instead of 'char'.
"   input_after: (String) insert the string after the cursor.
"   delete: (Number/String) delete the number of right characters of the cursor;
"     usually use it for {'char': '<BS>'}. It is dot-repeatable in spite of
"     '<Del>' in 'input'
"   leave: move the cusor to the right as the count; cannot be negative
"
"   mode: available values are ['i', ':', '/', '?', 'c']; default as 'i'
"     'c' stands for ':/?'.
"   filetype: set it or work on any filetypes
"   syntax: like vimString, Constant, NonText
"   priority: the bigger, the higher priority; default as 0.

" Overwrite Rules for Parentheses {{{1
" parentheses to open
let g:lexima#default_rules += [
      \ {'char': '(', 'at': '\\\%#'},
      \ {'char': '[', 'at': '\\\%#'},
      \
      \ {'char': '(', 'input_after': ')', 'except': '\%#\ze[^\]}) \t]'},
      \ {'char': '[', 'input_after': ']', 'except': '\%#\ze[^\]}) \t]'},
      \ {'char': '{', 'input_after': '}', 'except': '\%#\ze[^\]}) \t]'},
      \ ]

" parentheses to close
let g:lexima#default_rules += [
      \ {'char': ')', 'at': '\%#)', 'leave': 1},
      \ {'char': ']', 'at': '\%#]', 'leave': 1},
      \ {'char': '}', 'at': '\%#}', 'leave': 1},
      \ ]

" Overwrite Rules for Quote {{{1
let g:lexima#default_rules += [
      \ {'char': "'", 'at': '\\\%#'},
      \ {'char': "'", 'at': '\w\%#''\@!'},
      \ {'char': '"', 'at': '\\\%#'},
      \
      \ {'char': "'", 'at': '\(^\s*\|\s\|[\[({]\)\%#', 'input_after': "'"},
      \ {'char': '"', 'at': '\(^\s*\|\s\|[\[({]\)\%#', 'input_after': '"'},
      \ {'char': '`', 'at': '\(^\s*\|\s\|[\[({]\)\%#', 'input_after': '`'},
      \
      \ {'char': "'", 'at': '\%#''', 'leave': 1},
      \ {'char': '"', 'at': '\%#"',  'leave': 1},
      \ {'char': '`', 'at': '\%#`',  'leave': 1},
      \
      \ {'char': "'", 'at': "\\%#'''", 'leave': 3},
      \ {'char': '"', 'at': '\%#"""',  'leave': 3},
      \ {'char': '`', 'at': '\%#```',  'leave': 3},
      \ ]

" Overwrite Rules for Backspaces {{{1
let g:lexima#default_rules += [
      \ {'char': '<BS>', 'at': '(\%#)',   'delete': 1},
      \ {'char': '<BS>', 'at': '{\%#}',   'delete': 1},
      \ {'char': '<BS>', 'at': '\[\%#\]', 'delete': 1},
      \
      \ {'char': '<BS>', 'at': "'\\%#'", 'delete': 1},
      \ {'char': '<BS>', 'at': '"\%#"',  'delete': 1},
      \ {'char': '<BS>', 'at': '`\%#`',  'delete': 1},
      \
      \ ]

" TODO: Remove closing parentheses after the cursor on <C-w> and <C-u>.
let g:lexima#default_rules += [
      \ {'char': '<C-w>', 'at': '(\%#)',   'delete': 1},
      \ {'char': '<C-w>', 'at': '{\%#}',   'delete': 1},
      \ {'char': '<C-w>', 'at': '\[\%#\]', 'delete': 1},
      \
      \ {'char': '<C-w>', 'at': "'\\%#'", 'delete': 1},
      \ {'char': '<C-w>', 'at': '"\%#"',  'delete': 1},
      \ {'char': '<C-w>', 'at': '`\%#`',  'delete': 1},
      \ ]

let g:lexima#default_rules += [
      \ {'char': '<C-u>', 'at': '(\%#)',   'delete': 1},
      \ {'char': '<C-u>', 'at': '{\%#}',   'delete': 1},
      \ {'char': '<C-u>', 'at': '\[\%#\]', 'delete': 1},
      \
      \ {'char': '<C-u>', 'at': "'\\%#'", 'delete': 1},
      \ {'char': '<C-u>', 'at': '"\%#"',  'delete': 1},
      \ {'char': '<C-u>', 'at': '`\%#`',  'delete': 1},
      \ ]

" Overwrite Triple quotes {{{1
" Produce triple quoted block
let g:lexima#default_rules += [
      \ {'char': "'", 'at': "''\\%#", 'input': "'<CR>", 'input_after': "<CR>'''"},
      \ {'char': '"', 'at': '""\%#',  'input': '"<CR>', 'input_after': '<CR>"""'},
      \ {'char': '`', 'at': '``\%#',  'input': '`<CR>', 'input_after': '<CR>```'},
      \ ]

" Note: it would, of course, remove the text inside
" " Reduce into a pair of quotes
" let g:lexima#default_rules += [
"      \ {'char': '<BS>', 'at': "'''\\%#", 'input': '<BS><BS>', 'delete': 3},
"      \ {'char': '<BS>', 'at': '"""\%#',  'input': '<BS><BS>', 'delete': 3},
"      \ {'char': '<BS>', 'at': '```\%#',  'input': '<BS><BS>', 'delete': 3},
"      \
"      \ {'char': '<C-w>', 'at': "'''\\%#", 'input': '<BS><BS>', 'delete': 3},
"      \ {'char': '<C-w>', 'at': '"""\%#',  'input': '<BS><BS>', 'delete': 3},
"      \ {'char': '<C-w>', 'at': '```\%#',  'input': '<BS><BS>', 'delete': 3},
"      \
"      \ {'char': '<C-u>', 'at': "'''\\%#", 'input': '<BS><BS>', 'delete': 3},
"      \ {'char': '<C-u>', 'at': '"""\%#',  'input': '<BS><BS>', 'delete': 3},
"      \ {'char': '<C-u>', 'at': '```\%#',  'input': '<BS><BS>', 'delete': 3},
"      \ ]

" " Remove triple quote block
" let g:lexima#default_rules += [
"      \ {'char': '<BS>', 'at': "'''\\%#", 'input': '<BS><BS><BS>', 'delete': 4},
"      \ {'char': '<BS>', 'at': '"""\%#',  'input': '<BS><BS><BS>', 'delete': 4},
"      \ {'char': '<BS>', 'at': '```\%#',  'input': '<BS><BS><BS>', 'delete': 4},
"      \
"      \ {'char': '<C-w>', 'at': "'''\\%#", 'input': '<C-w>', 'delete': 4},
"      \ {'char': '<C-w>', 'at': '"""\%#',  'input': '<C-w>', 'delete': 4},
"      \ {'char': '<C-w>', 'at': '```\%#',  'input': '<C-w>', 'delete': 4},
"      \
"      \ {'char': '<C-u>', 'at': "'''\\%#", 'input': '<C-u>', 'delete': 4},
"      \ {'char': '<C-u>', 'at': '"""\%#',  'input': '<C-u>', 'delete': 4},
"      \ {'char': '<C-u>', 'at': '```\%#',  'input': '<C-u>', 'delete': 4},
"      \ ]


" Note: In the first place, 'sandwich' doen't treat the quotes over lines.
" let s:triple2single = {char ->
"      \ '<C-o>'
"      \ .'<Plug>(operator-sandwich-delete)'. char
"      \ .'<C-o>'
"      \ .'<Plug>(operator-sandwich-delete)'. char
"      \ }

" let g:lexima#default_rules += [
"     \ {'char': '<script> <BS>', 'at': "'''\\%#", 'input': '<SID>triple2single("''")'},
"     \ {'char': '<script> <BS>', 'at': '"""\%#',  'input': '<SID>triple2single("\"")'},
"     \ {'char': '<script> <BS>', 'at': '```\%#',  'input': '<SID>triple2single("`")'},
"     \
"     \ {'char': '<script> <C-w>', 'at': "'''\\%#", 'input': '<SID>triple2single("''")'},
"     \ {'char': '<script> <C-w>', 'at': '"""\%#',  'input': '<SID>triple2single("\"")'},
"     \ {'char': '<script> <C-w>', 'at': '```\%#',  'input': '<SID>triple2single("`")'},
"     \
"     \ {'char': '<script> <C-u>', 'at': "'''\\%#", 'input': '<SID>triple2single("''")'},
"     \ {'char': '<script> <C-u>', 'at': '"""\%#',  'input': '<SID>triple2single("\"")'},
"     \ {'char': '<script> <C-u>', 'at': '```\%#',  'input': '<SID>triple2single("`")'},
"     \ ]

"" Overwrite Rules for Spaces {{{1
"" cohama/lexima.vim/autoload/lexima.vim @ 84
"" modify g:lexima#space_rules into default_rule because of
"" g:lexima_enable_space_rules
"let g:lexima#default_rules += [
"      \ {'char': '<Space>', 'at': '\(["]\)\%#\1', 'delete': 1},
"      \ ]

" Addtional Rules to Skip Out {{{1
let s:before_close = '\%#[\])}''"]'
let s:before_paren = '\%#[\])}]'
let s:before_quote = '\%#[`''"]'

" Ref: Jump cursor over the provided pairs
"   https://karubabu.hateblo.jp/entry/2017/05/24/190010
let g:lexima#default_rules += [
     \ {'char': '<TAB>', 'at': '\%#)',  'leave': 1},
     \ {'char': '<TAB>', 'at': '\%#"',  'leave': 1},
     \ {'char': '<TAB>', 'at': '\%#]',  'leave': 1},
     \ {'char': '<TAB>', 'at': '\%#}',  'leave': 1},
     \ {'char': '<TAB>', 'at': "\\%#'", 'leave': 1},
     \ ]

let g:lexima#default_rules += [
      \ {'char': '<c-space>', 'input': '<space>'},
      \ {'char': '<c-space>', 'at': '\%#)',  'input': ')<space>', 'delete': 1},
      \ {'char': '<c-space>', 'at': '\%#]',  'input': ']<space>', 'delete': 1},
      \ {'char': '<c-space>', 'at': '\%#}',  'input': '}<space>', 'delete': 1},
      \ {'char': '<c-space>', 'at': '\%#`',  'input': '`<space>', 'delete': 1},
      \ {'char': '<c-space>', 'at': '\%#"',  'input': '"<space>', 'delete': 1},
      \ {'char': '<c-space>', 'at': "\\%#'", 'input': "'<space>", 'delete': 1},
      \ ]

" Note: Both 'input' and 'input_after' seems to fail with 'leave'.
let g:lexima#default_rules += [
      \ {'char': '<c-,>', 'input': ',<Space>'},
      \ {'char': '<c-,>', 'at': '\%#)',  'input': '),<Space>', 'delete': 1},
      \ {'char': '<c-,>', 'at': '\%#]',  'input': '],<Space>', 'delete': 1},
      \ {'char': '<c-,>', 'at': '\%#}',  'input': '},<Space>', 'delete': 1},
      \ {'char': '<c-,>', 'at': '\%#`',  'input': '`,<Space>', 'delete': 1},
      \ {'char': '<c-,>', 'at': '\%#"',  'input': '",<Space>', 'delete': 1},
      \ {'char': '<c-,>', 'at': "\\%#'", 'input': "',<Space>", 'delete': 1},
      \ ]

let g:lexima#default_rules += [
      \ {'char': '<c-:>', 'input': ':<Space>'},
      \ {'char': '<c-:>', 'at': '\%#)',  'input': '):<Space>', 'delete': 1},
      \ {'char': '<c-:>', 'at': '\%#]',  'input': ']:<Space>', 'delete': 1},
      \ {'char': '<c-:>', 'at': '\%#}',  'input': '}:<Space>', 'delete': 1},
      \ {'char': '<c-:>', 'at': '\%#`',  'input': '`:<Space>', 'delete': 1},
      \ {'char': '<c-:>', 'at': '\%#"',  'input': '":<Space>', 'delete': 1},
      \ {'char': '<c-:>', 'at': "\\%#'", 'input': "':<Space>", 'delete': 1},
      \ ]
let g:lexima#default_rules += [
      \ {'char': '<c-">', 'input': ':<Space>'},
      \ {'char': '<c-">', 'at': '\%#)',  'input': '):<Space>', 'delete': 1},
      \ {'char': '<c-">', 'at': '\%#]',  'input': ']:<Space>', 'delete': 1},
      \ {'char': '<c-">', 'at': '\%#}',  'input': '}:<Space>', 'delete': 1},
      \ {'char': '<c-">', 'at': '\%#`',  'input': '`:<Space>', 'delete': 1},
      \ {'char': '<c-">', 'at': '\%#"',  'input': '":<Space>', 'delete': 1},
      \ {'char': '<c-">', 'at': "\\%#'", 'input': "':<Space>", 'delete': 1},
      \ ]

" end of the line
let g:lexima#default_rules += [
      \ {'char': '<c-;>', 'input': '<End>;<CR>'},
      \ {'char': '<c-;>', 'at': '\%#)',  'input': ');<CR>', 'delete': 1},
      \ {'char': '<c-;>', 'at': '\%#]',  'input': '];<CR>', 'delete': 1},
      \ {'char': '<c-;>', 'at': '\%#}',  'input': '};<CR>', 'delete': 1},
      \ {'char': '<c-;>', 'at': '\%#`',  'input': '`;<CR>', 'delete': 1},
      \ {'char': '<c-;>', 'at': '\%#"',  'input': '";<CR>', 'delete': 1},
      \ {'char': '<c-;>', 'at': "\\%#'", 'input': "';<CR>", 'delete': 1},
      \ ]
let g:lexima#default_rules += [
      \ {'char': "<c-'>", 'input': '<End>;<CR>'},
      \ {'char': "<c-'>", 'at': '\%#)',  'input': ');<CR>', 'delete': 1},
      \ {'char': "<c-'>", 'at': '\%#]',  'input': '];<CR>', 'delete': 1},
      \ {'char': "<c-'>", 'at': '\%#}',  'input': '};<CR>', 'delete': 1},
      \ {'char': "<c-'>", 'at': '\%#`',  'input': '`;<CR>', 'delete': 1},
      \ {'char': "<c-'>", 'at': '\%#"',  'input': '";<CR>', 'delete': 1},
      \ {'char': "<c-'>", 'at': "\\%#'", 'input': "';<CR>", 'delete': 1},
      \ ]

unlet s:before_close s:before_paren s:before_quote
" Ref: Activate :iabbr through lexima
"   http://pekepekesamurai.hatenablog.com/entry/2015/04/23/223559
" FIXME:
" inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : lexima#expand('<CR>', 'i')
" call lexima#insmode#map_hook('before', '<CR>', "\<ESC>")
" inoremap <expr> <C-j> pumvisible() ? "\<C-Y>" : lexima#expand('<C-j>', 'i')
" call lexima#insmode#map_hook('before', '<C-j>', "\<ESC>")
" inoremap <expr> <space> lexima#expand('<space>', 'i')
" call lexima#insmode#map_hook('before', '<Space>', "\<ESC>")

" Addtional Rules on FileType {{{1
let g:lexima#default_rules += [
      \ {'char': '<Space>', 'at': '"\%#"', 'delete': 1, 'filetype': 'vim'},
      \ {'char': '<TAB>',   'at': '"\%#"', 'delete': 1, 'filetype': 'vim'},
      \
      \ {'char': '<TAB>', 'at': '{\%#}', 'input': '{{', 'delete': 1, 'filetype': 'vim'},
      \
      \ {'char': "'", 'at': '\\\%#', 'leave': 1, 'filetype': ['vim', 'sh', 'csh', 'ruby', 'tcsh', 'zsh']},
      \ ]

" suppress rules on FileType
let g:lexima#default_rules += [
      \ {'char': "'", 'filetype': ['haskell', 'lisp', 'clojure', 'ocaml', 'reason', 'scala', 'rust']},
      \ {'char': '`', 'filetype': ['ocaml', 'reason']},
      \ ]

let g:lexima#default_rules = map(g:lexima#default_rules, extend({'mode': 'i:'}))
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

