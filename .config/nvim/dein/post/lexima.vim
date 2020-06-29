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
      \ {'char': '<CR>', 'at': '/\*\%#\*/', 'input_after': '<CR><space>'},
      \ {'char': '<CR>', 'at': '<.\{-}>\%#<.\{-}>', 'input_after': '<CR>',
      \     'filetype': ['htm', 'html', 'xml', 'php']},
      \ ]

" Insert backslashes when filetype is vim
let g:lexima#newline_rules += [
      \ {'char': '<CR>', 'at': '^\s*\', 'input': '<CR>\ ', 'except': '[]})]\s*$', 'filetype': 'vim'},
      \
      \ {'char': '<CR>', 'at': '(\%#)',  'input': '<CR>\ ', 'input_after': '<CR>\ ', 'filetype': 'vim'},
      \ {'char': '<CR>', 'at': '{\%#}',  'input': '<CR>\ ', 'input_after': '<CR>\ ', 'filetype': 'vim'},
      \ {'char': '<CR>', 'at': '\[\%#]', 'input': '<CR>\ ', 'input_after': '<CR>\ ', 'filetype': 'vim'},
      \ ]

" up to Filetype
let g:lexima#newline_rules += [
      \ {'char': '<CR>', 'at': '<.\{-}>\%#<.\{-}>', 'input_after': '<CR>',
      \     'filetype': ['htm', 'html', 'xml', 'php']},
      \ ]

" Overwrite Rules for Parentheses {{{1
" parentheses to open
if has('nvim')
  let g:lexima#default_rules += [
        \ {'char': '<S-lt>', 'input': '<'},
        \ {'char': '<S-lt>', 'at': '\a\%#', 'input': '<', 'input_after': '>', 'filetype': 'cpp', 'mode': 'i'},
        \ ]
else
  let g:lexima#default_rules += [
        \ {'char': '<', 'input': '<'},
        \ {'char': '<', 'at': '\a\%#', 'input': '<', 'input_after': '>', 'filetype': 'cpp', 'mode': 'i'},
        \ ]
endif

let g:lexima#default_rules += [
      \ {'char': '(', 'at': '\\\%#', 'mode': 'i'},
      \ {'char': '[', 'at': '\\\%#', 'mode': 'i'},
      \ {'char': '{', 'at': '\\\%#', 'mode': 'i'},
      \
      \ {'char': '(', 'input_after': ')', 'except': '\%#[^\]})''"` \t]', 'mode': 'i'},
      \ {'char': '[', 'input_after': ']', 'except': '\%#[^\]})''"` \t]', 'mode': 'i'},
      \ {'char': '{', 'input_after': '}', 'except': '\%#[^\]})''"` \t]', 'mode': 'i'},
      \
      \ {'char': '(', 'at': '\%#[,.;:]', 'input_after': ')', 'mode': 'i'},
      \ {'char': '[', 'at': '\%#[,.;:]', 'input_after': ']', 'mode': 'i'},
      \ {'char': '{', 'at': '\%#[,.;:]', 'input_after': '}', 'mode': 'i'},
      \ ]

" parentheses to close
" FIXME: ')' in command line works as {'leave': 1} wherever cursor is before ')'
let g:lexima#default_rules += [
      \ {'char': ')', 'at': '\%#)', 'leave': 1, 'mode': 'i'},
      \ {'char': ']', 'at': '\%#]', 'leave': 1},
      \ {'char': '}', 'at': '\%#}', 'leave': 1},
      \ ]

let s:block_start = '\s*\(if\|while\|for\)\s\+\([^(]*\%#.*\)\s*'
let s:Insert_paren = '<ESC>:keepjumps keeppatterns s/'. s:block_start .'/\1 (\2)/e<CR>gi<Right><Right>'
let g:lexima#default_rules += [
      \ {'char': ')', 'at': s:block_start, 'except': s:block_start .'(', 'mode': 'i',
      \     'input': s:Insert_paren, 'filetype': ['c', 'cpp', 'php']}
      \ ]
unlet s:block_start s:Insert_paren

" Overwrite Rules for Quote {{{1
let s:Let_it_double = '\w\%#\|\%#\w'

let g:lexima#default_rules += [
      \ {'char': "'", 'except': s:Let_it_double, 'input_after': "'", 'mode': 'i'},
      \ {'char': '"', 'except': s:Let_it_double, 'input_after': '"', 'mode': 'i'},
      \ {'char': '`', 'except': s:Let_it_double, 'input_after': '`', 'mode': 'i'},
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

" Delete duplicated '"' to comment in Vimscript.
let g:lexima#default_rules += [
      \ {'char': '<Space>',   'at': '^\s*"\%#"', 'input': '<C-g>U<Del><space>', 'filetype': 'vim'},
      \ {'char': '<S-Space>', 'input': '<space>'},
      \ {'char': '<S-Space>', 'input': '<space>', 'filetype': 'vim'},
      \ {'char': '<S-Space>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><space>', 'filetype': 'vim'},
      \ ]

" Overwrite Rules for Backspaces {{{1
let g:lexima#default_rules += [
      \ {'char': '<BS>', 'at': '(\%#)',   'delete': 1},
      \ {'char': '<BS>', 'at': '{\%#}',   'delete': 1},
      \ {'char': '<BS>', 'at': '\[\%#\]', 'delete': 1},
      \ {'char': '<BS>', 'at': '<\%#>',   'delete': 1},
      \
      \ {'char': '<BS>', 'at': "'\\%#'", 'delete': 1},
      \ {'char': '<BS>', 'at': '"\%#"',  'delete': 1},
      \ {'char': '<BS>', 'at': '`\%#`',  'delete': 1},
      \ ]

" Note: The '.' in `:s/pattern/` is required for <C-u>.
" Note: s:remove_close . '<C-w>' fails to insert again to <C-w>.
let s:following_ends = '\%#[a-zA-Z \t_]*\zs\s\{-}[\]})>''"`]*'
let s:remove_close = ':silent! keepjumps keeppatterns s/'. s:following_ends .'//e<CR>gi'
let g:lexima#default_rules += [
      \ {'char': '<C-w>', 'at': '[\[({]\s*\%#', 'mode': 'i',
      \   'input': '<C-w><Esc>'. s:remove_close},
      \
      \ {'char': '<C-u>', 'mode': 'i', 'input': '<C-u><Esc>'. s:remove_close},
      \ ]
unlet s:remove_close s:following_ends

" Overwrite Triple quotes {{{1
" Produce triple quoted block
let g:lexima#default_rules += [
      \ {'char': "'", 'at': "''\\%#", 'except': '\%#\S', 'input': "'<CR>", 'input_after': "<CR>'''", 'mode': 'i'},
      \ {'char': '"', 'at': '""\%#',  'except': '\%#\S', 'input': '"<CR>', 'input_after': '<CR>"""', 'mode': 'i'},
      \ {'char': '`', 'at': '``\%#',  'except': '\%#\S', 'input': '`<CR>', 'input_after': '<CR>```', 'mode': 'i'},
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
      \ {'char': '<C-space>', 'input': ' '},
      \ {'char': '<C-=>',     'input': ' = '},
      \
      \ {'char': '<C-,>', 'input': ', '},
      \ {'char': '<C-.>', 'input': '. '},
      \ {'char': '<C-:>', 'input': ': '},
      \ {'char': '<C-;>', 'input': '; '},
      \ ]

let g:lexima#default_rules += [
      \ {'char': '<C-=>',     'at': '\s\%#', 'input': '= '},
      \
      \ {'char': '<C-,>', 'at': '\s\%#', 'input': '<BS>, '},
      \ {'char': '<C-.>', 'at': '\s\%#', 'input': '<BS>. '},
      \ {'char': '<C-:>', 'at': '\s\%#', 'input': '<BS>: '},
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

" Addtional Rules for Polymorphic Use {{{1
let g:lexima#default_rules += [
      \ {'char': '<C-d>', 'at': '\%#[\])}''"`]', 'input': '', 'delete': 1, 'mode': 'i'}
      \ ]

" Addtional Rules on FileType {{{1
source $DEIN_POST_HOME/lexima.cpp.vim

" Suppress some rules up to filetype.
let g:lexima#default_rules += [
      \ {'char': "'", 'filetype': ['haskell', 'lisp', 'clojure', 'ocaml', 'reason', 'scala', 'rust']},
      \ {'char': '`', 'filetype': ['ocaml', 'reason']},
      \ ]

" <TAB> to create marker
let g:lexima#default_rules += [
      \ {'char': '<TAB>', 'filetype': ['vim', 'i3'],
      \     'at': '{\%#}', 'input': '<C-g>U<Del>{{'}
      \ ]

" Finally: Override the rules though lexima#add_rule() "{{{1
" Apply all the maps to both Insert and Command mode when unspecified
call map(g:lexima#default_rules, "extend(v:val, {'mode': ':i'}, 'keep')")

call lexima#set_default_rules()
