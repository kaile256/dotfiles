" TOML: insert.toml
" Repo: cohama/lexima.vim
" Another: add/lexima.vim
" Another: source/lexima.vim

map! <C-h> <BS>
map! <C-j> <CR>

" TODO: extend g:lexima#newline_rules for <C-j> to work like <CR>, too
" g:lexima#newline_rules is a list of dict

let s:user_rules = []

function! s:map_rules(rules, dict) abort
  let rules = map(deepcopy(a:rules), 'extend(v:val, a:dict, "keep")')
  return rules
endfunction

function! s:map_rules_on_key(key2rules, dict) abort
  let dict = a:dict
  let additional_rules = values(map(deepcopy(a:key2rules), {key, list
        \ -> map(list, {_, rule
        \     -> extend(rule, extend(dict, {'char': key}), 'keep')
        \     })
        \ }))

  let rules = []
  for r in additional_rules
    call extend(rules, r)
  endfor
  return rules
endfunction

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

" Rules for framework/library {{{1
function! s:define_rules_for_react() abort
  let pat_revising = '\%#[^,;]\+'
  let Complete_backtick_for_CSS_in_JS = {
        \ 'char': '`', 'input_after': '`', 'except': pat_revising,
        \ 'at': '\<styled\>\S*\%#',
        \ }

  let rules = [
        \ Complete_backtick_for_CSS_in_JS,
        \ ]

  let filetypes = [
        \ 'javascriptreact',
        \ 'typescriptreact',
        \ ]

  let s:user_rules += s:map_rules(rules, {'filetype': filetypes})
endfunction
call s:define_rules_for_react()
delfunction s:define_rules_for_react

function! s:define_rules_for_javascript() abort
  let pat_revising = '\%#[^,;]\+'
  let pat_preceding = '^\s*[a-zA-Z_-]\{-}:\%#'
  let Append_comma = {
        \ 'char': '<space>', 'input_after': ',',
        \ 'at': pat_preceding, 'except': pat_revising,
        \ 'syntax': [
        \   'typescriptObjectLabel',
        \   'typescriptObjectColon',
        \ ],
        \ }

  let Append_semicolon = {
        \ 'char': '<space>', 'input_after': ';',
        \ 'at': pat_preceding, 'except': pat_revising,
        \ 'syntax': [
        \   'typescriptTypeAnnotation',
        \   'cssNoise',
        \ ],
        \ }

  let Append_colon_after_case = {
        \ 'char': '<space>', 'input': ' ', 'input_after': ':',
        \ 'at': '^\s*case\%#', 'except': pat_revising,
        \ }

  let rules = [
        \ {'char': '<space>', 'input_after': ';', 'at': 'import\%#'},
        \ {'char': '<space>', 'input_after': ';',
        \     'at': 'let\%#', 'except': pat_revising},
        \ Append_comma,
        \ Append_semicolon,
        \ Append_colon_after_case,
        \ ]

  let filetypes = [
        \ 'javascript',
        \ 'javascriptreact',
        \ 'typescript',
        \ 'typescriptreact',
        \ ]

  let s:user_rules += s:map_rules(rules, {'filetype': filetypes})
endfunction
call s:define_rules_for_javascript()
delfunction s:define_rules_for_javascript

" Rules for Semicolon {{{1
function! s:define_rules_for_css() abort
  let Format_css_element = [
        \ {'char': '<space>', 'at': '^\w\+\%#', 'filetype': 'css', 'syntax': '',
        \   'input': '<Esc>:<C-u>keepjumps keeppatterns s/^\ze\w/./e<CR>gi<C-g>U<Right><space>'},
        \ {'char': '<C-space>', 'at': '^\w\+\%#', 'filetype': 'css', 'syntax': '',
        \   'input': '<Esc>:<C-u>keepjumps keeppatterns s/^\ze\w/./e<CR>gi<C-g>U<Right><space>'},
        \ ]
  let rules = [
        \ {'char': '<space>', 'input': ': ', 'input_after': ';',
        \     'at': '^\s\+[a-zA-Z-]\+\%#', 'except': '\%#.\+',},
        \ {'char': '<space>', 'input_after': ';',
        \     'at': '^\s\+[a-zA-Z-]\+:\%#', 'except': '\%#.\+'},
        \ ]
  let rules += Format_css_element

  let filetypes = [
        \ 'css',
        \ ]

  let s:user_rules += s:map_rules(rules, {'filetype': filetypes})
endfunction
call s:define_rules_for_css()
delfunction s:define_rules_for_css

function! s:define_rules_for_semicolon() abort
  let rules_for_semicolon = [
        \ {'char': '<space>', 'input_after': ';',
        \     'at': 'return\%#', 'except': '\%#.\+'},
        \ {'char': '<space>', 'input_after': ';',
        \     'at': '=\%#', 'except': '\%#.\+'},
        \ {'char': '<BS>', 'input': '<C-g>U<Del><BS>', 'at': '=\%#;'},
        \ ]

  let filetypes_for_semicolon_rules = [
        \ 'cpp',
        \ 'javascript',
        \ 'javascriptreact',
        \ 'typescript',
        \ 'typescriptreact',
        \ ]

  let s:user_rules += s:map_rules(rules_for_semicolon,
        \ {'filetype': filetypes_for_semicolon_rules})
endfunction
call s:define_rules_for_semicolon()
delfunction s:define_rules_for_semicolon

" Rules for Tag {{{1

let s:user_rules += [
      \ {'char': '<', 'at': '^\s*\(return\)\?\s*\%#[;,]\?', 'input_after': '>'},
      \ ]

let s:filetypes_for_tag_rules = [
      \ 'htm',
      \ 'html',
      \ 'javascriptreact',
      \ 'php',
      \ 'typescriptreact',
      \ 'xml',
      \ ]

let s:rules_for_tag = []

let s:rules_for_tag += [
      \ {'char': '<CR>', 'at': '\%#\s*/>',
      \   'input_after': '<CR>', 'input': '<CR>'},
      \ ]

" Spilt <tag><\tag> on <CR>
let s:user_rules += [
      \ {'char': '<CR>', 'at': '<.\{-}>\%#<.\{-}>',
      \   'input': '<CR>', 'input_after': '<CR>'},
      \ ]

let s:user_rules += s:map_rules(s:rules_for_tag,
      \ {'filetypes': s:filetypes_for_tag_rules})

" Overwrite Rules for Newline {{{1
" Copied from cohama/lexima.vim/autoload/lexima.vim @75

let s:user_rules += [
      \ {'char': '<CR>', 'at': '(\%#)',  'input_after': '<CR>'},
      \ {'char': '<CR>', 'at': '{\%#}',  'input_after': '<CR>'},
      \ {'char': '<CR>', 'at': '\[\%#]', 'input_after': '<CR>'},
      \ {'char': '<CR>', 'at': '/\*\%#\*/', 'input_after': '<CR><space>'},
      \ {'char': '<CR>', 'at': '<\a.*\%#>', 'input_after': '<CR>'},
      \
      \ {'char': '<CR>', 'at': "'\\%#'", 'input_after': '<CR>'},
      \ {'char': '<CR>', 'at': '"\%#"',  'input_after': '<CR>'},
      \ {'char': '<CR>', 'at': '`\%#`',  'input_after': '<CR>'},
      \ ]

" Spilt <tag><\tag> on <CR>
let s:user_rules += [
      \ {'char': '<CR>', 'at': '<.\{-}>\%#<.\{-}>',
      \   'input': '<CR>', 'input_after': '<CR>',
      \     'filetype': [
      \         'htm', 'html', 'xml', 'php',
      \         'javascriptreact', 'typescriptreact',
      \ ]},
      \ ]

" Overwrite Rules for Parentheses {{{1
" parentheses to open

let s:user_rules += [
      \ {'char': '(', 'at': '\\\%#'},
      \ {'char': '[', 'at': '\\\%#'},
      \ {'char': '{', 'at': '\\\%#'},
      \
      \ {'char': '(', 'input_after': ')'},
      \ {'char': '[', 'input_after': ']'},
      \ {'char': '{', 'input_after': '}'},
      \ {'char': '<', 'input_after': '>', 'at': '\w\%#'},
      \
      \ {'char': '(', 'at': '\%#[[<({]'},
      \ {'char': '[', 'at': '\%#[[<({]'},
      \ {'char': '{', 'at': '\%#[[<({]'},
      \ {'char': '<', 'at': '\%#[[<({]'},
      \ ]

" parentheses to close
" FIXME: ')' in command line works as {'leave': 1} wherever cursor is before ')'
let s:user_rules += [
      \ {'char': ')', 'at': '\%#)', 'input': '<C-g>U<Right>'},
      \ {'char': ']', 'at': '\%#]', 'leave': 1},
      \ {'char': '}', 'at': '\%#}', 'leave': 1},
      \ {'char': '>', 'at': '\%#>', 'leave': 1},
      \ ]

let s:block_start = '\s*\(if\|while\|for\)\s\+\([^(]*\%#.*\)\s*'
let s:Insert_paren = '<ESC>:keepjumps keeppatterns s/'. s:block_start .'/\1 (\2)/e<CR>gi<Right><Right>'
let s:user_rules += [
      \ {'char': ')', 'at': s:block_start, 'except': s:block_start .'(',
      \     'input': s:Insert_paren, 'filetype': ['c', 'cpp', 'php']}
      \ ]
unlet s:block_start s:Insert_paren

" Overwrite Rules for Quote {{{1
let s:Let_it_double = '\w\%#\|\%#\w'

let s:user_rules += [
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
let s:user_rules += [
      \ {'char': '<BS>', 'at': '(\%#)',   'input': '<BS><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '{\%#}',   'input': '<BS><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '\[\%#\]', 'input': '<BS><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '<\%#>',   'input': '<BS><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '\W\s\%#\s\W', 'input': '<BS><C-g>U<Del>'},
      \
      \ {'char': '<BS>', 'at': "'\\%#'", 'input': '<BS><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '"\%#"',  'input': '<BS><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '`\%#`',  'input': '<BS><C-g>U<Del>'},
      \ ]

let s:user_rules += [
      \ {'char': '<BS>', 'at': '(\%#),',  'input': '<BS><C-g>U<Del><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '{\%#},',  'input': '<BS><C-g>U<Del><C-g>U<Del>'},
      \ {'char': '<BS>', 'at': '\[\%#],', 'input': '<BS><C-g>U<Del><C-g>U<Del>'},
      \ ]

function! s:define_rules_to_kill_words() abort
  " Note: The '.' in `:s/pattern/` is required for <C-u>.
  " Note: s:remove_close . '<C-w>' fails to insert again to <C-w>.
  let pat_end = '[a-zA-Z \t_]*\zs\s\{-}[\]})>''"`]*'
  let following_ends = '\%#'. pat_end
  let end_with_separator = '[,;:]\?$'
  let following_ends_with_separator = following_ends . end_with_separator
  let s:Remove_close =
        \ {pat -> ':silent! keepjumps keeppatterns s/'. pat .'//e<CR>gi'}

  let s:user_rules += [
        \ {'char': '<C-w>', 'at': '[\[({]\s*\%#'. pat_end,
        \   'input': '<C-w><Esc>'. s:Remove_close(following_ends)},
        \ {'char': '<C-w>', 'at': '\(^\s*\w*\|=\)\%#'. pat_end,
        \   'input': '<C-w><Esc>'. s:Remove_close(end_with_separator)},
        \ {'char': '<C-u>', 'at': following_ends,
        \   'input': '<C-u><Esc>'.
        \   s:Remove_close(following_ends_with_separator)},
        \ ]

  unlet s:Remove_close
endfunction
call s:define_rules_to_kill_words()
delfunction s:define_rules_to_kill_words

let s:Joinspaces = '<Esc>:<C-u>keeppatterns keepjumps s/\%(\s*\n*\)*\%#//e<CR>kgJgJgi'

let s:user_rules += [
      \ {'char': '<BS>', 'at': '''\n\s*\%#\n\s*''', 'input': s:Joinspaces},
      \ {'char': '<BS>', 'at': '`\n\s*\%#\n\s*`',   'input': s:Joinspaces},
      \ {'char': '<BS>', 'at': '"\n\s*\%#\n\s*"',   'input': s:Joinspaces},
      \ {'char': '<BS>', 'at': '(\n\s*\%#\n\s*)',   'input': s:Joinspaces},
      \ {'char': '<BS>', 'at': '{\n\s*\%#\n\s*}',   'input': s:Joinspaces},
      \ {'char': '<BS>', 'at': '\[\n\s*\%#\n\s*]',  'input': s:Joinspaces},
      \ ]

let s:user_rules += [
      \ {'char': '<C-w>', 'at': '''\n\s*\%#\n\s*''', 'input': s:Joinspaces},
      \ {'char': '<C-w>', 'at': '`\n\s*\%#\n\s*`',   'input': s:Joinspaces},
      \ {'char': '<C-w>', 'at': '"\n\s*\%#\n\s*"',   'input': s:Joinspaces},
      \ {'char': '<C-w>', 'at': '(\n\s*\%#\n\s*)',   'input': s:Joinspaces},
      \ {'char': '<C-w>', 'at': '{\n\s*\%#\n\s*}',   'input': s:Joinspaces},
      \ {'char': '<C-w>', 'at': '\[\n\s*\%#\n\s*]',  'input': s:Joinspaces},
      \ ]

let s:user_rules += [
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
" let s:user_rules += [
"      \ {'char': "'", 'at': "''\\%#", 'except': '\%#\S', 'input': "'<CR>", 'input_after': "<CR>'''"},
"      \ {'char': '"', 'at': '""\%#',  'except': '\%#\S', 'input': '"<CR>', 'input_after': '<CR>"""'},
"      \ {'char': '`', 'at': '``\%#',  'except': '\%#\S', 'input': '`<CR>', 'input_after': '<CR>```'},
"      \ ]

let s:user_rules += [
      \ {'char': "'", 'at': "''\\%#", 'except': '\%#\S', 'input': "'"},
      \ {'char': '"', 'at': '""\%#',  'except': '\%#\S', 'input': '"'},
      \ {'char': '`', 'at': '``\%#',  'except': '\%#\S', 'input': '`'},
      \ ]

let s:user_rules += [
      \ {'char': "'", 'at': "'''\\%#", 'except': '\%#\S', 'input': '', 'input_after': "'''"},
      \ {'char': '"', 'at': '"""\%#',  'except': '\%#\S', 'input': '', 'input_after': '"""'},
      \ {'char': '`', 'at': '```\%#',  'except': '\%#\S', 'input': '', 'input_after': '```'},
      \ ]

" Overwrite Rules for Spaces {{{1
function! s:define_rules_for_space() abort
  let rules = []

  let rules += [
        \ {'char': '<S-Space>',   'input': '<space>'},
        \ {'char': '<C-space>',   'input': '<space>'},
        \ {'char': '<C-S-Space>', 'input': '<space>'},
        \ ]

  let Insert_a_space_before_cursor = [
        \ {'char': '<C-S-Space>', 'at': '\%#\S', 'input': '<space>',
        \     'input_after': '<space>'},
        \ {'char': '<C-S-Space>', 'at': '\s\%#\S', 'input': '',
        \     'input_after': '<space>'},
        \ ]

  let Spread_brackets = []
  let in_brackets_to_spread = [
        \ '(\%#)',
        \ '{\%#}',
        \ '\[\%#]',
        \ '/\*\%#\*/',
        \ ]

  for char in ['<space>', '<S-space>']
    for in_brackets in in_brackets_to_spread
      let Spread_brackets += [
            \ {'char': char, 'at': in_brackets,
            \ 'input': '<space>', 'input_after': '<Space>'},
            \ ]
    endfor

    let abbrs_without_trailing_period = []
    let abbrs_without_trailing_period += [
         \ 'abbr',
         \ 'esp',
         \ ]
    let abbrs_without_trailing_period += ['\u\a'] " like Mr.
    let abbrs_without_trailing_period += ['\u\.\u'] " like U.S.A.
    let abbrs_without_trailing_period += ['\d+'] " indices of orderd list
    let after_abbr = '\v('. join(abbrs_without_trailing_period, '|') .')\.%#'

    let Double_spaces_at_end_OfSentence = {
          \ 'char': char,
          \ 'input': '<space><space>',
          \ 'at': '[.?!]\%#', 'except': after_abbr,
          \ }
    let Double_spaces_at_endOfSentence_in_Comment = extend(
          \ deepcopy(Double_spaces_at_end_OfSentence),
          \ {'syntax': ['Comment']}
          \ )
    let Double_spaces_at_endOfSentence_as_FileType = extend(
          \ deepcopy(Double_spaces_at_end_OfSentence),
          \ {'filetype': ['help', 'txt']}
          \ )

    let Prepare_brackets_at_cond = {
          \ 'char': char,
          \ 'input': ' (', 'input_after': ')',
          \ 'at': '\(if\|for\|while\)\%#',
          \ 'syntax': ['Conditional', 'Repeat'],
          \ 'filetype': [
          \   'cpp',
          \   'c',
          \   'javascript',
          \   'javascriptreact',
          \   'typescript',
          \   'typescriptreact',
          \   'php'
          \ ],
          \ }

    let rules += Spread_brackets
    let rules += Insert_a_space_before_cursor
    let rules += [
          \ Prepare_brackets_at_cond,
          \ Double_spaces_at_endOfSentence_in_Comment,
          \ Double_spaces_at_endOfSentence_as_FileType,
          \ ]
  endfor

  let s:user_rules += s:map_rules(rules, {'char': '<space>'})
endfunction
call s:define_rules_for_space()
delfunction s:define_rules_for_space

" Addtional Rules to Skip Out; break repeat {{{1
" Note: 'leave' seems to make 'input' and 'input_after' fail
" Ref: Jump cursor over the provided pairs
"   https://karubabu.hateblo.jp/entry/2017/05/24/190010
" let s:rules_insert += [
"      \ {'char': '<TAB>', 'at': '\%#[\])}`"'']', 'leave': 1},
"      \ ]

let s:user_rules += [
      \ {'char': '<C-=>',     'input': ' = '},
      \
      \ {'char': '<C-,>', 'input': ', '},
      \ {'char': '<C-.>', 'input': '. '},
      \ {'char': '<C-:>', 'input': ': '},
      \ {'char': '<C-;>', 'input': '; '},
      \ ]

let s:before_close = '\%#[])}`''"]'
let s:before_paren = '\%#[])}]'
let s:before_quote = '\%#[''"`]'
let s:before_close_within_paren = s:before_close .'.*\v([[({])@<!.*[])}]'

let s:user_rules += [
      \
      \ {'char': '<C-space>', 'at': '\%#.', 'input': '<C-g>U<Right><space>'},
      \
      \ {'char': '<C-=>', 'at': '\%#.', 'input': '<C-g>U<Right> = '},
      \
      \ {'char': '<C-,>', 'at': s:before_close, 'input': '<C-g>U<Right>,'},
      \ {'char': '<C-,>', 'at': s:before_close_within_paren, 'input': '<C-g>U<Right>, '},
      \ {'char': '<C-:>', 'at': s:before_close, 'input': '<C-g>U<Right>: '},
      \ {'char': '<C-.>', 'at': s:before_paren, 'input': '<C-g>U<Right>.'},
      \ {'char': '<C-.>', 'at': s:before_quote, 'input': '<C-g>U<Right>. '},
      \
      \ {'char': '<C-;>', 'at': '\%#.',       'input': '<C-g>U<Right>; ', 'mode': 'c'},
      \ {'char': '<C-;>', 'at': '\%#.*;\s*$', 'input': '<C-g>U<Right>; '},
      \ {'char': '<C-;>', 'at': '\%#.', 'input': '<Esc>A;'},
      \ ]

let s:user_rules += [
      \ {'char': '<C-,>', 'at': '\a\%#\a', 'input': ', '},
      \ {'char': '<C-,>', 'at': '\<\%#\a', 'input': ', '},
      \ ]

unlet s:before_close s:before_paren s:before_quote

" Addtional Rules for Polymorphic Use {{{1
let s:user_rules += [
      \ {'char': '<C-d>', 'at': '\%#\A', 'input': '<C-g>U<Del>'},
      \ {'char': '<C-d>', 'at': '\%#\\\A', 'input': '<C-g>U<Del><C-g>U<Del>'},
      \ ]

" <TAB> to create marker
let s:user_rules += [
      \ {'char': '<TAB>', 'at': '{\%#}', 'input': '<C-g>U<Del>{{'},
      \ {'char': '<TAB>', 'at': '\([^{]\){\%#}\1', 'input': '<C-g>U<Del><C-g>U<Del>{{'},
      \ ]

let s:user_rules += [
      \ {'char': ',', 'at': '[^,]\s\%#\S', 'input': '<BS>, '},
      \ ]

" Addtional Rules on FileType {{{1
" Suppress some rules up to filetype.
let s:user_rules += [
      \ {'char': "'", 'filetype': ['haskell', 'lisp', 'clojure', 'ocaml', 'reason', 'scala', 'rust']},
      \ {'char': '`', 'filetype': ['ocaml', 'reason']},
      \ ]

" Rules for Vim {{{2
let s:rules_for_vim = []
let s:key2rules_for_vim = {}

" Delete duplicated '"' to comment in Vimscript.
let s:rules_for_vim += [
      \ {'char': '<TAB>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><TAB>'},
      \ {'char': '<Space>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><space>'},
      \ {'char': '<S-Space>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><space>'},
      \ ]

let s:rules_for_vim += [
      \ {'char': '<', 'at': 'map .*\%#', 'input_after': '>'},
      \ {'char': '<', 'at': 'exe [''"]norm .*\\\%#', 'input_after': '>'},
      \ ]

" Add comma to add either List or Dict nested.
let s:rules_for_vim += [
      \ {'char': '{', 'at': '^\s*\\\s*\%#', 'input_after': '},'},
      \ {'char': '[', 'at': '^\s*\\\s*\%#', 'input_after': '],'},
      \ ]

let s:rules_for_vim += [
      \ {'char': '(', 'at': '\\\%#', 'input_after': '\)'},
      \ ]

" Insert backslashes when filetype is vim
let s:key2rules_for_vim['<CR>'] = [
      \ {'at': '^\s*\\.*\%#', 'input': '<CR>\ ', 'except': '[]})]\s*$'},
      \
      \ {'at': '\v(\=.*|\\)\s*\(%#\)', 'input': '<CR>\ ', 'input_after': '<CR>\ '},
      \ {'at': '\v(\=.*|\\)\s*\{%#}',  'input': '<CR>\ ', 'input_after': '<CR>\ '},
      \ {'at': '\v(\=.*|\\)\s*\[%#]',  'input': '<CR>\ ', 'input_after': '<CR>\ '},
      \ ]

let s:user_rules += s:map_rules(s:rules_for_vim, {'filetype': 'vim'})
let s:user_rules += s:map_rules_on_key(s:key2rules_for_vim, {'filetype': 'vim'})

unlet s:rules_for_vim s:key2rules_for_vim

" Rules for Cpp {{{2
let s:rules_for_cpp = []
let s:key2rules_for_cpp = {}

let s:rules_for_cpp += [
      \ {'char': '{', 'input_after': '};',
      \     'at': '\v<(struct|return|class)> .*%#',
      \     'except': '\v(template <.*%#|%#.*;)',
      \ },
      \ ]

let s:key2rules_for_cpp['<'] = [
      \ {'at': '\a\%#', 'input_after': '>'},
      \ {'at': '^#include \%#', 'input_after': '>'},
      \ ]
let s:key2rules_for_cpp['<C-:>'] = [
      \ {'at': '\%#>', 'input': '<C-g>U<Right>:'},
      \ ]
let s:key2rules_for_cpp['='] = [
      \ {'input': '=', 'input_after': ';', 'except': '\%#.'},
      \ ]

let s:key2rules_for_cpp['<Space>'] = [
      \ {'at': '(.*\%#.*)',  'priority': 90},
      \ {'at': '{.*\%#.*}',  'priority': 90},
      \ {'at': '\[.*\%#.*]', 'priority': 90},
      \
      \ {'input': ' >> ',  'at': 'cin\%#'},
      \ {'input': ' << ', 'at': 'cout\%#'},
      \
      \ {'input': ' >> ',  'at': 'cin.*[^> ]\+\%#', 'except': '\v(;.*%#|%#.*[^;\]\)])'},
      \ {'input': ' << ', 'at': 'cout.*[^< ]\+\%#', 'except': '\v(;.*%#|%#.*[^;\]\)])'},
      \ ]

let s:key2rules_for_cpp['<C-space>'] = [
      \ {'at': 'cin  >> .\{-}\%#[''"]', 'input': '<C-g>U<Right> >> '},
      \ {'at': 'cout << .\{-}\%#[''"]', 'input': '<C-g>U<Right> << '},
      \ ]

let s:key2rules_for_cpp[','] = [
      \ {'at': 'cin .*\h\w*\%#', 'input': ' >> '},
      \ {'at': 'cout .*\h\w*\%#', 'input': ' << '},
      \ ]

let s:user_rules += s:map_rules(s:rules_for_cpp, {
      \ 'filetype': 'cpp'
      \ })
let s:user_rules += s:map_rules_on_key(s:key2rules_for_cpp, {
      \ 'filetype': 'cpp'
      \ })
unlet s:rules_for_cpp s:key2rules_for_cpp

" Finally: Override the rules though lexima#add_rule() "{{{1
" Apply all the maps to both Insert and Command mode when unspecified
" let foo = map(deepcopy(g:lexima#default_rules), 'substitute(get(v:val, "input"), ''\ze<\(Right\|End\)>\c'', "<C-g>U", "g"')

" " Ref: Enable :iabbr in lexima (currently, iabbr works without the hooks)
" "   http://pekepekesamurai.hatenablog.com/entry/2015/04/23/223559
" call lexima#insmode#map_hook('before', '<Space>', "\<ESC>")
" call lexima#insmode#map_hook('before', '<C-j>',   "\<ESC>")
" call lexima#insmode#map_hook('after', '<CR>',    "\<CR>:-1s/\s\+$<CR>")

call lexima#clear_rules()
for rule in s:user_rules
  call lexima#add_rule(rule)
endfor
unlet s:user_rules

delfunction s:map_rules
delfunction s:map_rules_on_key
