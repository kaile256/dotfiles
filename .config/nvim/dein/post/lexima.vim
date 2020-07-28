" TOML: insert.toml
" Repo: cohama/lexima.vim
" Another: add/lexima.vim
" Another: source/lexima.vim

map! <C-h> <BS>
map! <C-j> <CR>

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

" Overwrite Rules for Newline {{{1
" Copied from cohama/lexima.vim/autoload/lexima.vim @75
let g:lexima#newline_rules = []

let g:lexima#newline_rules += [
      \ {'char': '<CR>', 'at': '(\%#)',  'input_after': '<CR>'},
      \ {'char': '<CR>', 'at': '{\%#}',  'input_after': '<CR>'},
      \ {'char': '<CR>', 'at': '\[\%#]', 'input_after': '<CR>'},
      \ {'char': '<CR>', 'at': '/\*\%#\*/', 'input_after': '<CR><space>'},
      \
      \ {'char': '<CR>', 'at': "'''\\%#'''", 'input_after': '<CR>'},
      \ {'char': '<CR>', 'at': '"""\%#"""',  'input_after': '<CR>'},
      \ {'char': '<CR>', 'at': '```\%#```',  'input_after': '<CR>'},
      \ ]

" Spilt <tag><\tag> on <CR>
let g:lexima#newline_rules += [
      \ {'char': '<CR>', 'at': '<.\{-}>\%#<.\{-}>',
      \   'input': '<CR><TAB>', 'input_after': '<CR>',
      \     'filetype': [
      \         'htm', 'html', 'xml', 'php',
      \         'javascriptreact', 'typescriptreact',
      \ ]},
      \ ]

" Overwrite Rules for Parentheses {{{1
" parentheses to open
let g:lexima#default_rules += [
      \ {'char': '<', 'input': '<'},
      \ ]

let g:lexima#default_rules += [
      \ {'char': '(', 'at': '\\\%#'},
      \ {'char': '[', 'at': '\\\%#'},
      \ {'char': '{', 'at': '\\\%#'},
      \
      \ {'char': '(', 'input_after': ')', 'except': '\%#[^\]})''"` \t]'},
      \ {'char': '[', 'input_after': ']', 'except': '\%#[^\]})''"` \t]'},
      \ {'char': '{', 'input_after': '}', 'except': '\%#[^\]})''"` \t]'},
      \
      \ {'char': '(', 'at': '\%#[,.;:]', 'input_after': ')'},
      \ {'char': '[', 'at': '\%#[,.;:]', 'input_after': ']'},
      \ {'char': '{', 'at': '\%#[,.;:]', 'input_after': '}'},
      \ ]

" parentheses to close
" FIXME: ')' in command line works as {'leave': 1} wherever cursor is before ')'
let g:lexima#default_rules += [
      \ {'char': ')', 'at': '\%#)', 'input': '<C-g>U<Right>'},
      \ {'char': ']', 'at': '\%#]', 'leave': 1},
      \ {'char': '}', 'at': '\%#}', 'leave': 1},
      \ {'char': '>', 'at': '\%#>', 'leave': 1},
      \ ]

let s:block_start = '\s*\(if\|while\|for\)\s\+\([^(]*\%#.*\)\s*'
let s:Insert_paren = '<ESC>:keepjumps keeppatterns s/'. s:block_start .'/\1 (\2)/e<CR>gi<Right><Right>'
let g:lexima#default_rules += [
      \ {'char': ')', 'at': s:block_start, 'except': s:block_start .'(',
      \     'input': s:Insert_paren, 'filetype': ['c', 'cpp', 'php']}
      \ ]
unlet s:block_start s:Insert_paren

" Overwrite Rules for Quote {{{1
let s:Let_it_double = '\w\%#\|\%#\w'

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
" Note: {'delete': 1} sometimes fails to work; 'input_after': '<C-g>U<Del>'
" crashes Vim.
let g:lexima#default_rules += [
      \ {'char': '<BS>', 'at': '(\%#)',   'input': '<BS><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '{\%#}',   'input': '<BS><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '\[\%#\]', 'input': '<BS><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '<\%#>',   'input': '<BS><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '\s\%#\s', 'input': '<BS><C-g>U<Del>'},
      \
      \ {'char': '<BS>', 'at': "'\\%#'", 'input': '<BS><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '"\%#"',  'input': '<BS><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '`\%#`',  'input': '<BS><C-g>U<Del>'},
      \ ]

let g:lexima#default_rules += [
      \ {'char': '<BS>', 'at': '(\%#),',  'input': '<BS><C-g>U<Del><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '{\%#},',  'input': '<BS><C-g>U<Del><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '\[\%#],', 'input': '<BS><C-g>U<Del><C-g>U<Del>'},
      \ ]

" Note: The '.' in `:s/pattern/` is required for <C-u>.
" Note: s:remove_close . '<C-w>' fails to insert again to <C-w>.
let s:following_ends = '\%#[a-zA-Z \t_]*\zs\s\{-}[\]})>''"`,]*'
let s:remove_close = ':silent! keepjumps keeppatterns s/'. s:following_ends .'//e<CR>gi'
let g:lexima#default_rules += [
      \ {'char': '<C-w>', 'at': '[\[({]\s*\%#',
      \   'input': '<C-w><Esc>'. s:remove_close},
      \ {'char': '<C-u>', 'input': '<C-u><Esc>'. s:remove_close},
      \ ]
unlet s:remove_close s:following_ends

let s:Joinspaces = '<Esc>:<C-u>norm! kgJgJ<CR>gi'

let g:lexima#default_rules += [
      \ {'char': '<BS>', 'at': '''\n\s*\%#\n\s*''', 'input': s:Joinspaces},
      \ {'char': '<BS>', 'at': '`\n\s*\%#\n\s*`',   'input': s:Joinspaces},
      \ {'char': '<BS>', 'at': '"\n\s*\%#\n\s*"',   'input': s:Joinspaces},
      \ {'char': '<BS>', 'at': '(\n\s*\%#\n\s*)',   'input': s:Joinspaces},
      \ {'char': '<BS>', 'at': '{\n\s*\%#\n\s*}',   'input': s:Joinspaces},
      \ {'char': '<BS>', 'at': '\[\n\s*\%#\n\s*]',  'input': s:Joinspaces},
      \ ]

let g:lexima#default_rules += [
      \ {'char': '<C-w>', 'at': '''\n\s*\%#\n\s*''', 'input': s:Joinspaces},
      \ {'char': '<C-w>', 'at': '`\n\s*\%#\n\s*`',   'input': s:Joinspaces},
      \ {'char': '<C-w>', 'at': '"\n\s*\%#\n\s*"',   'input': s:Joinspaces},
      \ {'char': '<C-w>', 'at': '(\n\s*\%#\n\s*)',   'input': s:Joinspaces},
      \ {'char': '<C-w>', 'at': '{\n\s*\%#\n\s*}',   'input': s:Joinspaces},
      \ {'char': '<C-w>', 'at': '\[\n\s*\%#\n\s*]',  'input': s:Joinspaces},
      \ ]

let g:lexima#default_rules += [
      \ {'char': '<C-u>', 'at': '''\n\s*\%#\n\s*''', 'input': s:Joinspaces},
      \ {'char': '<C-u>', 'at': '`\n\s*\%#\n\s*`',   'input': s:Joinspaces},
      \ {'char': '<C-u>', 'at': '"\n\s*\%#\n\s*"',   'input': s:Joinspaces},
      \ {'char': '<C-u>', 'at': '(\n\s*\%#\n\s*)',   'input': s:Joinspaces},
      \ {'char': '<C-u>', 'at': '{\n\s*\%#\n\s*}',   'input': s:Joinspaces},
      \ {'char': '<C-u>', 'at': '\[\n\s*\%#\n\s*]',  'input': s:Joinspaces},
      \ ]

unlet s:Joinspaces

" " Overwrite Triple quotes {{{1
" " Produce triple quoted block
" let g:lexima#default_rules += [
"      \ {'char': "'", 'at': "''\\%#", 'except': '\%#\S', 'input': "'<CR>", 'input_after': "<CR>'''"},
"      \ {'char': '"', 'at': '""\%#',  'except': '\%#\S', 'input': '"<CR>', 'input_after': '<CR>"""'},
"      \ {'char': '`', 'at': '``\%#',  'except': '\%#\S', 'input': '`<CR>', 'input_after': '<CR>```'},
"      \ ]

let g:lexima#default_rules += [
      \ {'char': "'", 'at': "''\\%#", 'except': '\%#\S', 'input': "'"},
      \ {'char': '"', 'at': '""\%#',  'except': '\%#\S', 'input': '"'},
      \ {'char': '`', 'at': '``\%#',  'except': '\%#\S', 'input': '`'},
      \ ]

let g:lexima#default_rules += [
      \ {'char': "'", 'at': "'''\\%#", 'except': '\%#\S', 'input': '', 'input_after': "'''"},
      \ {'char': '"', 'at': '"""\%#',  'except': '\%#\S', 'input': '', 'input_after': '"""'},
      \ {'char': '`', 'at': '```\%#',  'except': '\%#\S', 'input': '', 'input_after': '```'},
      \ ]

" Overwrite Rules for Spaces {{{1
" cohama/lexima.vim/autoload/lexima.vim @ 84
" modify g:lexima#space_rules into default_rule because of
" g:lexima_enable_space_rules
let g:lexima#default_rules += [
      \ {'char': '<Space>', 'at': '(\%#)',     'input_after': '<Space>'},
      \ {'char': '<Space>', 'at': '{\%#}',     'input_after': '<Space>'},
      \ {'char': '<Space>', 'at': '\[\%#]',    'input_after': '<Space>'},
      \ {'char': '<Space>', 'at': '/\*\%#\*/', 'input_after': '<Space>'},
      \ ]

" Addtional Rules to Skip Out; break repeat {{{1
" Note: 'leave' seems to make 'input' and 'input_after' fail
" Ref: Jump cursor over the provided pairs
"   https://karubabu.hateblo.jp/entry/2017/05/24/190010
" let s:rules_insert += [
"      \ {'char': '<TAB>', 'at': '\%#[\])}`"'']', 'leave': 1},
"      \ ]

let g:lexima#default_rules += [
      \ {'char': '<S-Space>', 'input': '<space>'},
      \ {'char': '<C-space>', 'input': '<space>'},
      \ {'char': '<C-=>',     'input': ' = '},
      \
      \ {'char': '<C-,>', 'input': ', '},
      \ {'char': '<C-.>', 'input': '. '},
      \ {'char': '<C-:>', 'input': ': '},
      \ {'char': '<C-;>', 'input': '; '},
      \ ]

let g:lexima#default_rules += [
      \ {'char': '<C-S-Space>', 'input': ' '},
      \ {'char': '<C-S-Space>', 'at': '\%#\S', 'input': ' ', 'input_after': ' '},
      \ {'char': '<C-S-Space>', 'at': '\s\%#\S', 'input': '', 'input_after': ' '},
      \ ]

let s:before_close = '\%#[])}`''"]'
let s:before_paren = '\%#[])}]'
let s:before_quote = '\%#[''"`]'

let g:lexima#default_rules += [
      \
      \ {'char': '<C-space>', 'at': '\%#.', 'input': '<C-g>U<Right><space>'},
      \
      \ {'char': '<C-=>', 'at': '\%#.', 'input': '<C-g>U<Right> = '},
      \
      \ {'char': '<C-,>', 'at': s:before_close, 'input': '<C-g>U<Right>, '},
      \ {'char': '<C-:>', 'at': s:before_close, 'input': '<C-g>U<Right>: '},
      \ {'char': '<C-.>', 'at': s:before_paren, 'input': '<C-g>U<Right>.'},
      \ {'char': '<C-.>', 'at': s:before_quote, 'input': '<C-g>U<Right>. '},
      \
      \ {'char': '<C-;>', 'at': '\%#.',       'input': '<C-g>U<Right>; ', 'mode': 'c'},
      \ {'char': '<C-;>', 'at': '\%#.*;\s*$', 'input': '<C-g>U<Right>; '},
      \ {'char': '<C-;>', 'at': '\%#.', 'input': '<Esc>A;'},
      \ ]

let g:lexima#default_rules += [
      \ {'char': '<C-,>', 'at': '\a\%#\a', 'input': ', '},
      \ {'char': '<C-,>', 'at': '\<\%#\a', 'input': ', '},
      \ ]

unlet s:before_close s:before_paren s:before_quote

" Addtional Rules for Polymorphic Use {{{1
let g:lexima#default_rules += [
      \ {'char': '<C-d>', 'at': '\%#[])}>''"`]', 'input': '', 'delete': 1},
      \ {'char': '<C-d>', 'at': '\%#\\[])}>''"`]', 'input': '<C-g>U<Del><C-g>U<Del>'},
      \ ]

" <TAB> to create marker
let g:lexima#default_rules += [
      \ {'char': '<TAB>', 'at': '{\%#}', 'input': '<C-g>U<Del>{{'},
      \ {'char': '<TAB>', 'at': '\([^{]\){\%#}\1', 'input': '<C-g>U<Del><C-g>U<Del>{{'},
      \ ]

let g:lexima#default_rules += [
      \ {'char': ',', 'at': '[^,]\%#\a',   'input': ', '},
      \ {'char': ',', 'at': '[^,]\s\%#\S', 'input': '<BS>, '},
      \ ]

" Addtional Rules on FileType {{{1
source $DEIN_POST_HOME/lexima.cpp.vim
source $DEIN_POST_HOME/lexima.vim.vim

" Suppress some rules up to filetype.
let g:lexima#default_rules += [
      \ {'char': "'", 'filetype': ['haskell', 'lisp', 'clojure', 'ocaml', 'reason', 'scala', 'rust']},
      \ {'char': '`', 'filetype': ['ocaml', 'reason']},
      \ ]

" Finally: Override the rules though lexima#add_rule() "{{{1
" Apply all the maps to both Insert and Command mode when unspecified
" let foo = map(deepcopy(g:lexima#default_rules), 'substitute(get(v:val, "input"), ''\ze<\(Right\|End\)>\c'', "<C-g>U", "g"')

" " Ref: Enable :iabbr in lexima (currently, iabbr works without the hooks)
" "   http://pekepekesamurai.hatenablog.com/entry/2015/04/23/223559
" call lexima#insmode#map_hook('before', '<Space>', "\<ESC>")
" call lexima#insmode#map_hook('before', '<C-j>',   "\<ESC>")
" call lexima#insmode#map_hook('after', '<CR>',    "\<CR>:-1s/\s\+$<CR>")

call lexima#set_default_rules()
