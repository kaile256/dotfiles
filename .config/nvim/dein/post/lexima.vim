" TOML: insert.toml
" Repo: cohama/lexima.vim
" Another: add/lexima.vim
" Another: source/lexima.vim

" in lexima, <c-h> is unequal to <BS>
map! <c-h> <BS>

call lexima#insmode#define_altanative_key('<C-j>', '<CR>')

" TODO: extend g:lexima#newline_rules for <C-j> to work like <CR>, too
" g:lexima#newline_rules is a list of dict

let g:lexima#default_rules = []
let s:rules_insert  = []
let s:rules_colon   = []
let s:rules_i_colon = []
let s:rules_c_all   = []
let s:rules_ic_all  = []

" Note: both '=' and '+' works unexpectedly either with or without '\'.
let s:delimeter_atom = '[,.;:]'
let s:opareter_atom  = '[\-*/&|!]'
let s:separeter_single =  s:delimeter_atom
let s:separeter_double = '\(\s'. s:opareter_atom .'\)\|\('. s:delimeter_atom .'\s\)'
" for example, regard ' ==' as a triple
let s:separeter_triple = '\s'. s:opareter_atom .'\{2}' .'\|\s=\s'

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

" Overwrite Rules for Newline {{{1
" Copied from cohama/lexima.vim/autoload/lexima.vim @75
let g:lexima#newline_rules = [
      \ {'char': '<CR>', 'at': '(\%#)',  'input_after': '<CR>'},
      \ {'char': '<CR>', 'at': '{\%#}',  'input_after': '<CR>'},
      \ {'char': '<CR>', 'at': '\[\%#]', 'input_after': '<CR>'},
      \ ]

" Insert backslashes when filetype is vim
let g:lexima#newline_rules += [
      \ {'char': '<CR>', 'at': '^\s*\', 'input': '<CR>\ ', 'except': '[]})]\s*$', 'filetype': 'vim'},
      \
      \ {'char': '<CR>', 'at': '(\%#)',  'input': '<CR>\ ', 'input_after': '<CR>\ ', 'filetype': 'vim'},
      \ {'char': '<CR>', 'at': '{\%#}',  'input': '<CR>\ ', 'input_after': '<CR>\ ', 'filetype': 'vim'},
      \ {'char': '<CR>', 'at': '\[\%#]', 'input': '<CR>\ ', 'input_after': '<CR>\ ', 'filetype': 'vim'},
      \ ]

" Overwrite Rules for Parentheses {{{1
" parentheses to open
let g:lexima#default_rules += [
      \ {'char': '(', 'at': '\\\%#'},
      \ {'char': '[', 'at': '\\\%#'},
      \ {'char': '{', 'at': '\\\%#'},
      \
      \ {'char': '(', 'input_after': ')', 'except': '\%#[^\]}) \t]'},
      \ {'char': '[', 'input_after': ']', 'except': '\%#[^\]}) \t]'},
      \ {'char': '{', 'input_after': '}', 'except': '\%#[^\]}) \t]'},
      \ ]

" parentheses to close
" FIXME: ')' in command line works as {'leave': 1} when the cursor is before ')'
let g:lexima#default_rules += [
      \ {'char': ')', 'at': '\%#)', 'leave': 1},
      \ {'char': ']', 'at': '\%#]', 'leave': 1},
      \ {'char': '}', 'at': '\%#}', 'leave': 1},
      \ ]

let s:block_start = '\s*\(if\|while\|for\)\s\+\(.*\%#.*\)\s*'
let s:Insert_paren = '<ESC>:keepjumps keeppatterns s/'. s:block_start .'/\1 (\2)/e<CR>gi<Right><Right>'
let g:lexima#default_rules += [
      \ {'char': ')', 'at': s:block_start, 'except': s:block_start .'(', 'mode': 'i',
      \     'input': s:Insert_paren, 'filetype': ['c', 'cpp', 'php']}
      \ ]
unlet s:block_start s:Insert_paren

" Overwrite Rules for Quote {{{1
" Note: a pattern '[=\[\](){} \t]' for 'Space or Parentheses'
" let s:Let_it_double = '\([=\[\](){} \t]\|^\)' .'\%#'. '\($\|[=\[\](){} \t]\)'
let s:Let_it_double = '\%#'. '\w'

let g:lexima#default_rules += [
      \ {'char': "'", 'except': s:Let_it_double, 'input_after': "'"},
      \ {'char': '"', 'except': s:Let_it_double, 'input_after': '"'},
      \ {'char': '`', 'except': s:Let_it_double, 'input_after': '`'},
      \
      \ {'char': "'", 'at': '\\\%#'},
      \ {'char': "'", 'at': '\w\%#''\@!'},
      \ {'char': '"', 'at': '\\\%#'},
      \
      \ {'char': "'", 'at': '\%#''', 'leave': 1},
      \ {'char': '"', 'at': '\%#"',  'leave': 1},
      \ {'char': '`', 'at': '\%#`',  'leave': 1},
      \
      \ {'char': "'", 'at': "\\%#'''", 'leave': 3},
      \ {'char': '"', 'at': '\%#"""',  'leave': 3},
      \ {'char': '`', 'at': '\%#```',  'leave': 3},
      \ ]
unlet s:Let_it_double

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

" Note: The '.' in `:s/pattern/` is required for <C-u>.
" Note: s:remove_close . '<C-w>' fails to insert again to <C-w>.
let s:remove_close = '<ESC>l:silent! keeppatterns s/\%#\s*[\]})''"`]\+//e<CR>gi'
let g:lexima#default_rules += [
      \ {'char': '<C-w>', 'at': '[[{(''"`]\s*\%#\s*[\]})''"`]', 'mode': 'i',
      \   'input': '<C-w>'. s:remove_close},
      \ {'char': '<C-u>', 'at': '\%#\s*[\]})''"`]', 'mode': 'i',
      \   'input': '<C-u>'. s:remove_close},
      \ ]
unlet s:remove_close

" Overwrite Triple quotes {{{1
" Produce triple quoted block
let g:lexima#default_rules += [
      \ {'char': "'", 'at': "''\\%#", 'except': '\%#\S', 'input': "'<CR>", 'input_after': "<CR>'''"},
      \ {'char': '"', 'at': '""\%#',  'except': '\%#\S', 'input': '"<CR>', 'input_after': '<CR>"""'},
      \ {'char': '`', 'at': '``\%#',  'except': '\%#\S', 'input': '`<CR>', 'input_after': '<CR>```'},
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
let g:lexima#default_rules += [
      \ {'char': '<Space>', 'at': '(\%#)', 'input_after': '<Space>'},
      \ {'char': '<Space>', 'at': '{\%#}', 'input_after': '<Space>'},
      \ {'char': '<Space>', 'at': '\[\%#]', 'input_after': '<Space>'},
      \ ]

" Addtional Rules to Skip Out; break repeat {{{1
" Note: 'leave' seems to make 'input' and 'input_after' fail
" Ref: Jump cursor over the provided pairs
"   https://karubabu.hateblo.jp/entry/2017/05/24/190010
" let s:rules_insert += [
"      \ {'char': '<TAB>', 'at': '\%#[\])}`"'']', 'leave': 1},
"      \ ]

let g:lexima#default_rules += [
      \ {'char': '<C-space>', 'input': ' '},
      \ {'char': '<C-=>',     'input': ' = '},
      \
      \ {'char': '<C-,>', 'input': ', '},
      \ {'char': '<C-.>', 'input': '. '},
      \ {'char': '<C-:>', 'input': ': '},
      \ {'char': '<C-;>', 'input': '; '},
      \ ]

let g:lexima#default_rules += [
      \ {'char': '<C-space>', 'at': '\s\%#', 'input': '<BS>'},
      \ {'char': '<C-=>',     'at': '\s\%#', 'input': '= '},
      \
      \ {'char': '<C-,>', 'at': '\s\%#', 'input': '<BS>, '},
      \ {'char': '<C-.>', 'at': '\s\%#', 'input': '<BS>. '},
      \ {'char': '<C-:>', 'at': '\s\%#', 'input': '<BS>: '},
      \ {'char': '<C-;>', 'except': '\s\+if\s\+(.*\%#.*)', 'input': '<C-g>U<End>;', 'mode': 'i'},
      \ {'char': '<C-;>', 'at': '[.,;:]$', 'input': '', 'mode': 'i'},
      \ ]

let s:close = '[\])}`''",.]'
let s:paren = '[\])}]'
let s:quote = '[`''"]'

let s:before_close = '\%#'. s:close
let s:before_paren = '\%#'. s:paren
let s:before_quote = '\%#'. s:quote

let g:lexima#default_rules += [
      \ {'char': '<C-space>', 'at': s:before_close,  'input': '<C-g>U<Right><space>'},
      \
      \ {'char': '<C-=>', 'at': s:before_close, 'input': '<Right> = '},
      \
      \ {'char': '<C-,>', 'at': s:before_close, 'input': '<Right>, '},
      \ {'char': '<C-:>', 'at': s:before_close, 'input': '<Right>: '},
      \ {'char': '<C-.>', 'at': s:before_paren, 'input': '<Right>.'},
      \ {'char': '<C-.>', 'at': s:before_quote, 'input': '<Right>. '},
      \
      \ {'char': '<C-;>', 'at': s:before_close, 'input': '<End>;', 'except': ';\s*$', 'mode': 'i'},
      \ {'char': '<C-;>', 'at': s:before_close, 'input': '<End>;', 'except': 'if.*\ze;\s*$', 'mode': 'i'},
      \ {'char': '<C-;>', 'at': s:before_close, 'input': '<Right>; ', 'mode':   'c'},
      \ ]

unlet s:before_close s:before_paren s:before_quote

" FIXME:
" let g:lexima#default_rules += [
"      \ {'char': '<C-=>', 'at': s:separeter_single .'\%#', 'input': '<BS> = '},
"      \ {'char': '<C-=>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS> = '},
"      \ {'char': '<C-=>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS> = '},
"      \
"      \ {'char': '<C-,>', 'at': s:separeter_single .'\%#', 'input': '<BS>, '},
"      \ {'char': '<C-,>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS>, '},
"      \ {'char': '<C-,>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS>, '},
"      \
"      \ {'char': '<C-.>', 'at': s:separeter_single .'\%#', 'input': '<BS>. '},
"      \ {'char': '<C-.>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS>. '},
"      \ {'char': '<C-.>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS>. '},
"      \
"      \ {'char': '<C-:>', 'at': s:separeter_single .'\%#', 'input': '<BS>: '},
"      \ {'char': '<C-:>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS>: '},
"      \ {'char': '<C-:>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS>: '},
"      \
"      \ {'char': '<C-;>', 'at': s:separeter_single .'\%#', 'input': '<BS>; '},
"      \ {'char': '<C-;>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS>; '},
"      \ {'char': '<C-;>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS>; '},
"      \ ]

" Ref: Activate :iabbr through lexima
"   http://pekepekesamurai.hatenablog.com/entry/2015/04/23/223559
" FIXME:
" inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : lexima#expand('<CR>', 'i')
" call lexima#insmode#map_hook('before', '<CR>', "\<ESC>")
" inoremap <expr> <C-j> pumvisible() ? "\<C-Y>" : lexima#expand('<C-j>', 'i')
" call lexima#insmode#map_hook('before', '<C-j>', "\<ESC>")
" inoremap <expr> <space> lexima#expand('<space>', 'i')
" call lexima#insmode#map_hook('before', '<Space>', "\<ESC>")

" " Addtional Rules to Skip Out with direct Switch {{{1
" let s:before_close = '\%#[\])}''"]'
" let s:before_paren = '\%#[\])}]'
" let s:before_quote = '\%#[`''"]'

" " Note: 'leave' seems to make 'input' and 'input_after' fail
" " Ref: Jump cursor over the provided pairs
" "   https://karubabu.hateblo.jp/entry/2017/05/24/190010
" let s:rules_insert += [
"     \ {'char': '<TAB>', 'at': '\%#[\])}`"'']', 'leave': 1},
"     \ ]

" " Note: both '=' and '+' works unexpectedly either with or without '\'.
" let s:delimeter_atom = '[,.;:]'
" let s:opareter_atom  = '[\-*/&|!]'
" let s:separeter_single =  s:delimeter_atom
" let s:separeter_double = '\(\s'. s:opareter_atom .'\)\|\('. s:delimeter_atom .'\s\)'
" " for example, regard ' ==' as a triple
" let s:separeter_triple = '\s'. s:opareter_atom .'\{2}'

" let g:lexima#default_rules += [
"     \ {'char': '<C-=>', 'input': ' = '},
"     \ {'char': '<C-=>', 'at': '\s\%#', 'input': '= '},
"     \ {'char': '<C-=>', 'at': '\%#)',  'input': ') = ', 'delete': 1},
"     \ {'char': '<C-=>', 'at': '\%#]',  'input': '] = ', 'delete': 1},
"     \ {'char': '<C-=>', 'at': '\%#}',  'input': '} = ', 'delete': 1},
"     \ {'char': '<C-=>', 'at': '\%#`',  'input': '` = ', 'delete': 1},
"     \ {'char': '<C-=>', 'at': '\%#"',  'input': '" = ', 'delete': 1},
"     \ {'char': '<C-=>', 'at': "\\%#'", 'input': "' = ", 'delete': 1},
"     \
"     \ {'char': '<C-=>', 'at': s:separeter_single .'\%#', 'input': '<BS> =',         'priority': 30},
"     \ {'char': '<C-=>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS> =',     'priority': 40},
"     \ {'char': '<C-=>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS> =', 'priority': 50},
"     \ ]

" let g:lexima#default_rules += [
"     \ {'char': '<C-space>', 'input': ' '},
"     \ {'char': '<C-space>', 'at': '\%#)',  'input': ') ', 'delete': 1},
"     \ {'char': '<C-space>', 'at': '\%#]',  'input': '] ', 'delete': 1},
"     \ {'char': '<C-space>', 'at': '\%#}',  'input': '} ', 'delete': 1},
"     \ {'char': '<C-space>', 'at': '\%#`',  'input': '` ', 'delete': 1},
"     \ {'char': '<C-space>', 'at': '\%#"',  'input': '" ', 'delete': 1},
"     \ {'char': '<C-space>', 'at': "\\%#'", 'input': "' ", 'delete': 1},
"     \
"     \ {'char': '<C-space>', 'at': s:separeter_single .'\%#', 'input': '<BS> ',         'priority': 30},
"     \ {'char': '<C-space>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS> ',     'priority': 40},
"     \ {'char': '<C-space>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS> ', 'priority': 50},
"     \ ]

" let g:lexima#default_rules += [
"     \ {'char': '<C-,>', 'input': ', '},
"     \ {'char': '<C-,>', 'at': '\%#)',  'input': '), ', 'delete': 1},
"     \ {'char': '<C-,>', 'at': '\%#]',  'input': '], ', 'delete': 1},
"     \ {'char': '<C-,>', 'at': '\%#}',  'input': '}, ', 'delete': 1},
"     \ {'char': '<C-,>', 'at': '\%#`',  'input': '`, ', 'delete': 1},
"     \ {'char': '<C-,>', 'at': '\%#"',  'input': '", ', 'delete': 1},
"     \ {'char': '<C-,>', 'at': "\\%#'", 'input': "', ", 'delete': 1},
"     \
"     \ {'char': '<C-,>', 'at': s:separeter_single .'\%#', 'input': '<BS>, ',         'priority': 30},
"     \ {'char': '<C-,>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS>, ',     'priority': 40},
"     \ {'char': '<C-,>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS>, ', 'priority': 50},
"     \ ]

" let g:lexima#default_rules += [
"     \ {'char': '<C-,>', 'input': ', '},
"     \ {'char': '<C-,>', 'at': '\%#)',  'input': '),', 'delete': 1, 'filetype': 'json'},
"     \ {'char': '<C-,>', 'at': '\%#]',  'input': '],', 'delete': 1, 'filetype': 'json'},
"     \ {'char': '<C-,>', 'at': '\%#}',  'input': '},', 'delete': 1, 'filetype': 'json'},
"     \ {'char': '<C-,>', 'at': '\%#`',  'input': '`,', 'delete': 1, 'filetype': 'json'},
"     \ {'char': '<C-,>', 'at': '\%#"',  'input': '",', 'delete': 1, 'filetype': 'json'},
"     \ {'char': '<C-,>', 'at': "\\%#'", 'input': "',", 'delete': 1, 'filetype': 'json'},
"     \
"     \ {'char': '<C-,>', 'at': s:separeter_single .'\%#', 'input': '<BS>,',         'priority': 30, 'filetype': 'json'},
"     \ {'char': '<C-,>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS>,',     'priority': 40, 'filetype': 'json'},
"     \ {'char': '<C-,>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS>,', 'priority': 50, 'filetype': 'json'},
"     \ ]

" let g:lexima#default_rules += [
"     \ {'char': '<C-.>', 'input': '.'},
"     \ {'char': '<C-.>', 'at': '\%#)',  'input': ').', 'delete': 1},
"     \ {'char': '<C-.>', 'at': '\%#]',  'input': '].', 'delete': 1},
"     \ {'char': '<C-.>', 'at': '\%#}',  'input': '}.', 'delete': 1},
"     \ {'char': '<C-.>', 'at': '\%#`',  'input': '`.', 'delete': 1},
"     \ {'char': '<C-.>', 'at': '\%#"',  'input': '".', 'delete': 1},
"     \ {'char': '<C-.>', 'at': "\\%#'", 'input': "'.", 'delete': 1},
"     \
"     \ {'char': '<C-.>', 'at': s:separeter_single .'\%#', 'input': '<BS>.',         'priority': 30},
"     \ {'char': '<C-.>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS>.',     'priority': 40},
"     \ {'char': '<C-.>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS>.', 'priority': 50},
"     \ ]

" let g:lexima#default_rules += [
"     \ {'char': '<C-.>', 'input': '. ', 'filetype': 'vim'},
"     \ {'char': '<C-.>', 'at': '\%#`',  'input': '`. ', 'delete': 1, 'filetype': 'vim'},
"     \ {'char': '<C-.>', 'at': '\%#"',  'input': '". ', 'delete': 1, 'filetype': 'vim'},
"     \ {'char': '<C-.>', 'at': "\\%#'", 'input': "'. ", 'delete': 1, 'filetype': 'vim'},
"     \
"     \ {'char': '<C-.>', 'at': s:separeter_single .'\%#', 'input': '<BS>. ',         'priority': 30, 'filetype': 'vim'},
"     \ {'char': '<C-.>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS>. ',     'priority': 40, 'filetype': 'vim'},
"     \ {'char': '<C-.>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS>. ', 'priority': 50, 'filetype': 'vim'},
"     \ ]

" let g:lexima#default_rules += [
"     \ {'char': '<C-:>', 'input': ': '},
"     \ {'char': '<C-:>', 'at': '\%#)',  'input': '): ', 'delete': 1},
"     \ {'char': '<C-:>', 'at': '\%#]',  'input': ']: ', 'delete': 1},
"     \ {'char': '<C-:>', 'at': '\%#}',  'input': '}: ', 'delete': 1},
"     \ {'char': '<C-:>', 'at': '\%#`',  'input': '`: ', 'delete': 1},
"     \ {'char': '<C-:>', 'at': '\%#"',  'input': '": ', 'delete': 1},
"     \ {'char': '<C-:>', 'at': "\\%#'", 'input': "': ", 'delete': 1},
"     \
"     \ {'char': '<C-:>', 'at': s:separeter_single .'\%#', 'input': '<BS>: ',         'priority': 30},
"     \ {'char': '<C-:>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS>: ',     'priority': 40},
"     \ {'char': '<C-:>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS>: ', 'priority': 50},
"     \ ]

" " Semicolon with a new line; map for Commandline mode separately
" let s:rules_insert += [
"     \ {'char': '<C-;>', 'input': '<End><CR>'},
"     \ {'char': '<C-;>', 'except': ';\s*$', 'input': '<End>;<CR>'},
"     \
"     \ {'char': '<C-;>', 'at': '\%#)',  'input': ');<CR>', 'delete': 1},
"     \ {'char': '<C-;>', 'at': '\%#]',  'input': '];<CR>', 'delete': 1},
"     \ {'char': '<C-;>', 'at': '\%#}',  'input': '};<CR>', 'delete': 1},
"     \ {'char': '<C-;>', 'at': '\%#`',  'input': '`;<CR>', 'delete': 1},
"     \ {'char': '<C-;>', 'at': '\%#"',  'input': '";<CR>', 'delete': 1},
"     \ {'char': '<C-;>', 'at': "\\%#'", 'input': "';<CR>", 'delete': 1},
"     \
"     \ {'char': '<C-;>', 'at': s:separeter_single .'\%#', 'input': '<BS>; <CR>',         'priority': 30},
"     \ {'char': '<C-;>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS>; <CR>',     'priority': 40},
"     \ {'char': '<C-;>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS>; <CR>', 'priority': 50},
"     \ ]

" let s:rules_c_all += [
"     \ {'char': '<C-;>', 'input': '<End> '},
"     \ {'char': '<C-;>', 'except': ';\s*$', 'input': '<End>; '},
"     \
"     \ {'char': '<C-;>', 'at': '\%#)',  'input': '); ', 'delete': 1},
"     \ {'char': '<C-;>', 'at': '\%#]',  'input': ']; ', 'delete': 1},
"     \ {'char': '<C-;>', 'at': '\%#}',  'input': '}; ', 'delete': 1},
"     \ {'char': '<C-;>', 'at': '\%#`',  'input': '`; ', 'delete': 1},
"     \ {'char': '<C-;>', 'at': '\%#"',  'input': '"; ', 'delete': 1},
"     \ {'char': '<C-;>', 'at': "\\%#'", 'input': "'; ", 'delete': 1},
"     \
"     \ {'char': '<C-;>', 'at': s:separeter_single .'\%#', 'input': '<BS>; ',         'priority': 30},
"     \ {'char': '<C-;>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS>; ',     'priority': 40},
"     \ {'char': '<C-;>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS>; ', 'priority': 50},
"     \ ]

" "" Useless
" " nmap <C-'> <C-;>
" " nmap <C-"> <C-:>
" " call lexima#insmode#define_altanative_key("<C-'>", '<C-;>')
" " call lexima#insmode#define_altanative_key('<C-">', '<C-:>')

" unlet s:before_close s:before_paren s:before_quote
" unlet s:delimeter_atom s:opareter_atom
" unlet s:separeter_single s:separeter_double s:separeter_triple

" " Ref: Activate :iabbr through lexima
" "   http://pekepekesamurai.hatenablog.com/entry/2015/04/23/223559
" " FIXME:
" " inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : lexima#expand('<CR>', 'i')
" " call lexima#insmode#map_hook('before', '<CR>', "\<ESC>")
" " inoremap <expr> <C-j> pumvisible() ? "\<C-Y>" : lexima#expand('<C-j>', 'i')
" " call lexima#insmode#map_hook('before', '<C-j>', "\<ESC>")
" " inoremap <expr> <space> lexima#expand('<space>', 'i')
" " call lexima#insmode#map_hook('before', '<Space>', "\<ESC>")

" " Addtional Rules to Skip Out without switch {{{1
" let s:before_close = '\%#[\])}''"]'
" let s:before_paren = '\%#[\])}]'
" let s:before_quote = '\%#[`''"]'

" " Note: 'leave' seems to make 'input' and 'input_after' fail
" " Ref: Jump cursor over the provided pairs
" "   https://karubabu.hateblo.jp/entry/2017/05/24/190010
" let s:rules_insert += [
"      \ {'char': '<TAB>', 'at': '\%#[\])}`"'']', 'leave': 1},
"      \ ]

" " Note: both '=' and '+' works unexpectedly either with or without '\'.
" let s:delimeter_atom = '[,.;:]'
" let s:opareter_atom  = '[\-*/&|!]'
" let s:separeter_single =  s:delimeter_atom
" let s:separeter_double = '\(\s'. s:opareter_atom .'\)\|\('. s:delimeter_atom .'\s\)'
" " for example, regard ' ==' as a triple
" let s:separeter_triple = '\s'. s:opareter_atom .'\{2}'

" " let g:lexima#default_rules += [
" "      \ {'char': '<C-=>', 'input': ' = '},
" "      \ {'char': '<C-=>', 'at': '\s\%#', 'input': '= '},
" "      \ {'char': '<C-=>', 'at': '\%#)',  'input': ') = ', 'delete': 1},
" "      \ {'char': '<C-=>', 'at': '\%#]',  'input': '] = ', 'delete': 1},
" "      \ {'char': '<C-=>', 'at': '\%#}',  'input': '} = ', 'delete': 1},
" "      \ {'char': '<C-=>', 'at': '\%#`',  'input': '` = ', 'delete': 1},
" "      \ {'char': '<C-=>', 'at': '\%#"',  'input': '" = ', 'delete': 1},
" "      \ {'char': '<C-=>', 'at': "\\%#'", 'input': "' = ", 'delete': 1},
" "      \ ]

" let g:lexima#default_rules += [
"      \ {'char': '<C-=>', 'input': ' = '},
"      \ {'char': '<C-=>', 'at': '\s\%#', 'input': '= '},
"      \ {'char': '<C-=>', 'at': '\%#)',  'input': ') = ', 'delete': 1},
"      \ {'char': '<C-=>', 'at': '\%#]',  'input': '] = ', 'delete': 1},
"      \ {'char': '<C-=>', 'at': '\%#}',  'input': '} = ', 'delete': 1},
"      \ {'char': '<C-=>', 'at': '\%#`',  'input': '` = ', 'delete': 1},
"      \ {'char': '<C-=>', 'at': '\%#"',  'input': '" = ', 'delete': 1},
"      \ {'char': '<C-=>', 'at': "\\%#'", 'input': "' = ", 'delete': 1},
"      \
"      \ {'char': '<C-=>', 'at': s:separeter_single .'\%#', 'input': '<BS> =',         'priority': 30},
"      \ {'char': '<C-=>', 'at': s:separeter_double .'\%#', 'input': '<BS><BS> =',     'priority': 40},
"      \ {'char': '<C-=>', 'at': s:separeter_triple .'\%#', 'input': '<BS><BS><BS> =', 'priority': 50},
"      \ ]

" let g:lexima#default_rules += [
"      \ {'char': '<C-space>', 'input': ' '},
"      \ {'char': '<C-space>', 'at': '\%#)',  'input': ') ', 'delete': 1},
"      \ {'char': '<C-space>', 'at': '\%#]',  'input': '] ', 'delete': 1},
"      \ {'char': '<C-space>', 'at': '\%#}',  'input': '} ', 'delete': 1},
"      \ {'char': '<C-space>', 'at': '\%#`',  'input': '` ', 'delete': 1},
"      \ {'char': '<C-space>', 'at': '\%#"',  'input': '" ', 'delete': 1},
"      \ {'char': '<C-space>', 'at': "\\%#'", 'input': "' ", 'delete': 1},
"      \ ]

" let g:lexima#default_rules += [
"      \ {'char': '<C-,>', 'input': ', '},
"      \ {'char': '<C-,>', 'at': '\%#)',  'input': '), ', 'delete': 1},
"      \ {'char': '<C-,>', 'at': '\%#]',  'input': '], ', 'delete': 1},
"      \ {'char': '<C-,>', 'at': '\%#}',  'input': '}, ', 'delete': 1},
"      \ {'char': '<C-,>', 'at': '\%#`',  'input': '`, ', 'delete': 1},
"      \ {'char': '<C-,>', 'at': '\%#"',  'input': '", ', 'delete': 1},
"      \ {'char': '<C-,>', 'at': "\\%#'", 'input': "', ", 'delete': 1},
"      \ ]

" let g:lexima#default_rules += [
"      \ {'char': '<C-,>', 'input': ', '},
"      \ {'char': '<C-,>', 'at': '\%#)',  'input': '),', 'delete': 1, 'filetype': 'json'},
"      \ {'char': '<C-,>', 'at': '\%#]',  'input': '],', 'delete': 1, 'filetype': 'json'},
"      \ {'char': '<C-,>', 'at': '\%#}',  'input': '},', 'delete': 1, 'filetype': 'json'},
"      \ {'char': '<C-,>', 'at': '\%#`',  'input': '`,', 'delete': 1, 'filetype': 'json'},
"      \ {'char': '<C-,>', 'at': '\%#"',  'input': '",', 'delete': 1, 'filetype': 'json'},
"      \ {'char': '<C-,>', 'at': "\\%#'", 'input': "',", 'delete': 1, 'filetype': 'json'},
"      \ ]

" let g:lexima#default_rules += [
"      \ {'char': '<C-.>', 'input': '.'},
"      \ {'char': '<C-.>', 'at': '\%#)',  'input': ').', 'delete': 1},
"      \ {'char': '<C-.>', 'at': '\%#]',  'input': '].', 'delete': 1},
"      \ {'char': '<C-.>', 'at': '\%#}',  'input': '}.', 'delete': 1},
"      \ {'char': '<C-.>', 'at': '\%#`',  'input': '`.', 'delete': 1},
"      \ {'char': '<C-.>', 'at': '\%#"',  'input': '".', 'delete': 1},
"      \ {'char': '<C-.>', 'at': "\\%#'", 'input': "'.", 'delete': 1},
"      \ ]

" let g:lexima#default_rules += [
"      \ {'char': '<C-.>', 'input': '. ', 'filetype': 'vim'},
"      \ {'char': '<C-.>', 'at': '\%#`',  'input': '`. ', 'delete': 1, 'filetype': 'vim'},
"      \ {'char': '<C-.>', 'at': '\%#"',  'input': '". ', 'delete': 1, 'filetype': 'vim'},
"      \ {'char': '<C-.>', 'at': "\\%#'", 'input': "'. ", 'delete': 1, 'filetype': 'vim'},
"      \ ]

" let g:lexima#default_rules += [
"      \ {'char': '<C-:>', 'input': ': '},
"      \ {'char': '<C-:>', 'at': '\%#)',  'input': '): ', 'delete': 1},
"      \ {'char': '<C-:>', 'at': '\%#]',  'input': ']: ', 'delete': 1},
"      \ {'char': '<C-:>', 'at': '\%#}',  'input': '}: ', 'delete': 1},
"      \ {'char': '<C-:>', 'at': '\%#`',  'input': '`: ', 'delete': 1},
"      \ {'char': '<C-:>', 'at': '\%#"',  'input': '": ', 'delete': 1},
"      \ {'char': '<C-:>', 'at': "\\%#'", 'input': "': ", 'delete': 1},
"      \ ]

" " Semicolon with a new line; map for Commandline mode separately
" let s:rules_insert += [
"      \ {'char': '<C-;>', 'input': '<End><CR>'},
"      \ {'char': '<C-;>', 'except': ';\s*$', 'input': '<End>;<CR>'},
"      \ {'char': '<C-;>', 'at': '\%#)',  'input': ');<CR>', 'delete': 1},
"      \ {'char': '<C-;>', 'at': '\%#]',  'input': '];<CR>', 'delete': 1},
"      \ {'char': '<C-;>', 'at': '\%#}',  'input': '};<CR>', 'delete': 1},
"      \ {'char': '<C-;>', 'at': '\%#`',  'input': '`;<CR>', 'delete': 1},
"      \ {'char': '<C-;>', 'at': '\%#"',  'input': '";<CR>', 'delete': 1},
"      \ {'char': '<C-;>', 'at': "\\%#'", 'input': "';<CR>", 'delete': 1},
"      \ ]

" let s:rules_c_all += [
"      \ {'char': '<C-;>', 'input': '<End> '},
"      \ {'char': '<C-;>', 'except': ';\s*$', 'input': '<End>; '},
"      \ {'char': '<C-;>', 'at': '\%#)',  'input': '); ', 'delete': 1},
"      \ {'char': '<C-;>', 'at': '\%#]',  'input': ']; ', 'delete': 1},
"      \ {'char': '<C-;>', 'at': '\%#}',  'input': '}; ', 'delete': 1},
"      \ {'char': '<C-;>', 'at': '\%#`',  'input': '`; ', 'delete': 1},
"      \ {'char': '<C-;>', 'at': '\%#"',  'input': '"; ', 'delete': 1},
"      \ {'char': '<C-;>', 'at': "\\%#'", 'input': "'; ", 'delete': 1},
"      \ ]

" "" Useless
" " nmap <C-'> <C-;>
" " nmap <C-"> <C-:>
" " call lexima#insmode#define_altanative_key("<C-'>", '<C-;>')
" " call lexima#insmode#define_altanative_key('<C-">', '<C-:>')

" unlet s:before_close s:before_paren s:before_quote
" unlet s:delimeter_atom s:opareter_atom
" unlet s:separeter_single s:separeter_double s:separeter_triple

" " Ref: Activate :iabbr through lexima
" "   http://pekepekesamurai.hatenablog.com/entry/2015/04/23/223559
" " FIXME:
" " inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : lexima#expand('<CR>', 'i')
" " call lexima#insmode#map_hook('before', '<CR>', "\<ESC>")
" " inoremap <expr> <C-j> pumvisible() ? "\<C-Y>" : lexima#expand('<C-j>', 'i')
" " call lexima#insmode#map_hook('before', '<C-j>', "\<ESC>")
" " inoremap <expr> <space> lexima#expand('<space>', 'i')
" " call lexima#insmode#map_hook('before', '<Space>', "\<ESC>")

" Addtional Rules for Polymorphic Use {{{1
let s:rules_insert += [
      \ {'char': '<C-d>', 'at': '\%#[\])}''"]', 'delete': 1}
      \ ]
" Addtional Rules on FileType {{{1
let g:lexima#default_rules += [
      \ {'char': '<Space>', 'at': '"\%#"', 'delete': 1, 'filetype': 'vim'},
      \ {'char': '<TAB>',   'at': '"\%#"', 'delete': 1, 'filetype': 'vim', 'mode': 'i'},
      \
      \ {'char': '<TAB>', 'at': '{\%#}',     'input': '{{', 'delete': 1, 'filetype': 'vim', 'priority': 80, 'mode': 'i'},
      \ {'char': '<TAB>', 'at': '"{\%#["}]', 'input': '{{', 'delete': 1, 'filetype': 'vim', 'priority': 80, 'mode': 'i'},
      \ {'char': '<TAB>', 'at': '"}\%#"', 'input': '}}', 'delete': 1, 'filetype': 'vim', 'priority': 80, 'mode': 'i'},
      \
      \ {'char': "'", 'at': '\\\%#', 'leave': 1, 'filetype': ['vim', 'sh', 'csh', 'ruby', 'tcsh', 'zsh']},
      \ ]

" suppress rules on FileType
let g:lexima#default_rules += [
      \ {'char': "'", 'filetype': ['haskell', 'lisp', 'clojure', 'ocaml', 'reason', 'scala', 'rust']},
      \ {'char': '`', 'filetype': ['ocaml', 'reason']},
      \ ]

" function! s:substitute(list, before, after) abort "{{{1
"   let ret_dict = {}
"   let s:key_exchange = {arg -> substitute(arg, a:before, a:after, '', 'ge')}
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
" Apply all the maps to both Insert and Command mode when unspecified
call map(g:lexima#default_rules, "extend(v:val, {'mode': 'i:'}, 'keep')")
call map(s:rules_insert,  "extend(v:val, {'mode': 'i'},  'keep')")
call map(s:rules_i_colon, "extend(v:val, {'mode': 'i:'}, 'keep')")
call map(s:rules_colon,   "extend(v:val, {'mode': ':'},  'keep')")
call map(s:rules_c_all,   "extend(v:val, {'mode': 'c'},  'keep')")
call map(s:rules_ic_all,  "extend(v:val, {'mode': 'ic'}, 'keep')")

let g:lexima#default_rules +=
      \ s:rules_insert
      \ + s:rules_i_colon
      \ + s:rules_colon
      \ + s:rules_c_all
      \ + s:rules_ic_all

call lexima#set_default_rules()

unlet s:delimeter_atom s:opareter_atom
unlet s:separeter_single s:separeter_double s:separeter_triple
