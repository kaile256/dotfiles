" From: insert.toml
" Repo: cohama/lexima.vim
" Another: source/lexima.vim

function! s:insert_rule2rules(rules, dict) abort
  " a:rules: [{}] in LeximaRules
  " a:dict: {} in Rule
  "
  " return: [{}] in LeximaRules
  "
  "
  " Given:
  "   [{'foo': 'bar'}, {'baz': 'qux'}],
  "   "{'quux', 'corge'}
  " Return:
  "   [{'foo': 'bar', 'quux': 'corge'},
  "   "{'baz': 'qux', 'quux': 'corge'}]

  let rules = map(a:rules, 'extend(deepcopy(v:val), a:dict, "keep")')
  return rules
endfunction

function! s:set_rules() abort
  let rules = {
        \   'formal': [],
        \
        \   'global': [],
        \
        \   'ft2char': {},
        \
        \   'group': {
        \     'config': {},
        \     'filetypes': {},
        \   }
        \ }

  let global = rules.global

  let ft2char = rules.ft2char

  let group2conf = rules.group.config
  let group2ft   = rules.group.filetypes

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
  const pat_revising = '\%#[^,;]\+'
  const Complete_backtick_for_CSS_in_JS = {
        \ 'char': '`', 'input_after': '`', 'except': pat_revising,
        \ 'at': '\<styled\>\S*\%#',
        \ }

  let group2conf.react = [
        \ Complete_backtick_for_CSS_in_JS,
        \ ]

  " Rules for JavaScript {{{1
  const pat_preceding = '^\s*[a-zA-Z_-]\{-}:\%#'
  const Append_comma = {
        \ 'char': '<space>', 'input_after': ',',
        \ 'at': pat_preceding, 'except': pat_revising,
        \ 'syntax': [
        \   'typescriptObjectLabel',
        \   'typescriptObjectColon',
        \ ],
        \ }

  const Append_semicolon = {
        \ 'char': '<space>', 'input_after': ';',
        \ 'at': pat_preceding, 'except': pat_revising,
        \ 'syntax': [
        \   'typescriptTypeAnnotation',
        \   'cssNoise',
        \ ],
        \ }

  const Append_colon_after_case = {
        \ 'char': '<space>', 'input': ' ', 'input_after': ':',
        \ 'at': '^\s*case\%#', 'except': pat_revising,
        \ }

  let group2conf.javascript = [
        \ {'char': '<space>', 'input_after': ';', 'at': 'import\%#'},
        \ {'char': '<space>', 'input_after': ';',
        \     'at': 'let\%#', 'except': pat_revising},
        \ Append_comma,
        \ Append_semicolon,
        \ Append_colon_after_case,
        \ ]

  " Rules for Semicolon {{{1
  const Format_css_element = [
        \ {'char': '<space>', 'at': '^\w\+\%#', 'filetype': 'css', 'syntax': '',
        \   'input': '<Esc>:<C-u>keepjumps keeppatterns s/^\ze\w/./e<CR>gi<C-g>U<Right><space>'},
        \ {'char': '<C-space>', 'at': '^\w\+\%#', 'filetype': 'css', 'syntax': '',
        \   'input': '<Esc>:<C-u>keepjumps keeppatterns s/^\ze\w/./e<CR>gi<C-g>U<Right><space>'},
        \ ]

  let group2conf.css = []
  let group2conf.css += [
        \ {'char': '<space>', 'input': ': ', 'input_after': ';',
        \     'at': '^\s\+[a-zA-Z-]\+\%#', 'except': '\%#.\+',},
        \ {'char': '<space>', 'input_after': ';',
        \     'at': '^\s\+[a-zA-Z-]\+:\%#', 'except': '\%#.\+'},
        \ ]
  let group2conf.css += Format_css_element

  let group2conf.semicolon = [
        \ {'char': '<space>', 'input_after': ';',
        \     'at': 'return\%#', 'except': '\%#.\+'},
        \ {'char': '<space>', 'input_after': ';',
        \     'at': '=\%#', 'except': '\%#.\+'},
        \ {'char': '<BS>', 'input': '<C-g>U<Del><BS>', 'at': '=\%#;'},
        \ ]

  " Rules for Tag {{{1
  let group2conf.tag = []

  let group2conf.tag += [
        \ {'char': '<CR>', 'at': '\%#\s*/>',
        \   'input_after': '<CR>', 'input': '<CR>'},
        \ ]

  " Spilt <tag><\tag> on <CR>
  let global += [
        \ {'char': '<CR>', 'at': '<.\{-}>\%#<.\{-}>',
        \   'input': '<CR>', 'input_after': '<CR>'},
        \ ]

  " Overwrite Rules for Newline {{{1
  " Copied from cohama/lexima.vim/autoload/lexima.vim @75

  let global += [
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
  let global += [
        \ {'char': '<CR>', 'at': '<.\{-}>\%#<.\{-}>',
        \   'input': '<CR>', 'input_after': '<CR>',
        \     'filetype': [
        \         'htm', 'html', 'xml', 'php',
        \         'javascriptreact', 'typescriptreact',
        \ ]},
        \ ]

  " Overwrite Rules for Parentheses {{{1
  " parentheses to open

  let global += [
        \ {'char': '(', 'at': '\\\%#'},
        \ {'char': '[', 'at': '\\\%#'},
        \ {'char': '{', 'at': '\\\%#'},
        \
        \ {'char': '(', 'input_after': ')'},
        \ {'char': '[', 'input_after': ']'},
        \ {'char': '{', 'input_after': '}'},
        \
        \ {'char': '(', 'at': '\%#[[<({]'},
        \ {'char': '[', 'at': '\%#[[<({]'},
        \ {'char': '{', 'at': '\%#[[<({]'},
        \ {'char': '<', 'at': '\%#[[<({]'},
        \ ]

  " parentheses to close
  " FIXME: ')' in command line works as {'leave': 1} wherever cursor is before ')'
  let global += [
        \ {'char': ')', 'at': '\%#)', 'input': '<C-g>U<Right>'},
        \ {'char': ']', 'at': '\%#]', 'leave': 1},
        \ {'char': '}', 'at': '\%#}', 'leave': 1},
        \ {'char': '>', 'at': '\%#>', 'leave': 1},
        \ ]

  let pat_block_start = '\s*\(if\|while\|for\)\s\+\([^(]*\%#.*\)\s*'
  const Insert_paren =
        \ '<ESC>:keepjumps keeppatterns s/'
        \ . pat_block_start
        \ .'/\1 (\2)/e<CR>gi<Right><Right>'
  let global += [
        \ {'char': ')', 'at': pat_block_start, 'except': pat_block_start .'(',
        \     'input': Insert_paren, 'filetype': ['c', 'cpp', 'php']}
        \ ]

  " Rules for Quote {{{1
  const Let_it_double = '\w\%#\|\%#\w'

  let global += [
        \ {'char': "'", 'except': Let_it_double, 'input_after': "'"},
        \ {'char': '"', 'except': Let_it_double, 'input_after': '"'},
        \ {'char': '`', 'except': Let_it_double, 'input_after': '`'},
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

  " Rules for Backspaces {{{1
  " Note: {'delete': 1} sometimes fails to work; 'input_after': '<C-g>U<Del>'
  " crashes Vim.
  let global += [
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

  let global += [
        \ {'char': '<BS>', 'at': '(\%#),',  'input': '<BS><C-g>U<Del><C-g>U<Del>'},
        \ {'char': '<BS>', 'at': '{\%#},',  'input': '<BS><C-g>U<Del><C-g>U<Del>'},
        \ {'char': '<BS>', 'at': '\[\%#],', 'input': '<BS><C-g>U<Del><C-g>U<Del>'},
        \ ]

  " Rules to kill words {{{1
  " Note: The '.' in `:s/pattern/` is required for <C-u>.
  " Note: s:remove_close . '<C-w>' fails to insert again to <C-w>.
  const pat_end = '[a-zA-Z \t_]*\zs\s\{-}[\]})>''"`]*'
  const pat_following_ends = '\%#'. pat_end
  const pat_end_with_separator = '[,;:]\?$'
  const pat_following_ends_with_separator = pat_following_ends . pat_end_with_separator
  let s:Remove_close =
        \ {pat -> ':silent! keepjumps keeppatterns s/'. pat .'//e<CR>gi'}

  let global += [
        \ {'char': '<C-w>', 'at': '[\[({]\s*\%#'. pat_end,
        \   'input': '<C-w><Esc>'. s:Remove_close(pat_following_ends)},
        \ {'char': '<C-w>', 'at': '\(^\s*\w*\|=\)\%#'. pat_end,
        \   'input': '<C-w><Esc>'. s:Remove_close(pat_end_with_separator)},
        \ {'char': '<C-u>', 'at': pat_following_ends,
        \   'input': '<C-u><Esc>'.
        \   s:Remove_close(pat_following_ends_with_separator)},
        \ ]

  const Joinspaces =
        \ '<Esc>:<C-u>keeppatterns keepjumps s/\%(\s*\n*\)*\%#//e<CR>kgJgJgi'

  let global += [
        \ {'char': '<BS>', 'at': '''\n\s*\%#\n\s*''', 'input': Joinspaces},
        \ {'char': '<BS>', 'at': '`\n\s*\%#\n\s*`',   'input': Joinspaces},
        \ {'char': '<BS>', 'at': '"\n\s*\%#\n\s*"',   'input': Joinspaces},
        \ {'char': '<BS>', 'at': '(\n\s*\%#\n\s*)',   'input': Joinspaces},
        \ {'char': '<BS>', 'at': '{\n\s*\%#\n\s*}',   'input': Joinspaces},
        \ {'char': '<BS>', 'at': '\[\n\s*\%#\n\s*]',  'input': Joinspaces},
        \ ]

  let global += [
        \ {'char': '<C-w>', 'at': '''\n\s*\%#\n\s*''', 'input': Joinspaces},
        \ {'char': '<C-w>', 'at': '`\n\s*\%#\n\s*`',   'input': Joinspaces},
        \ {'char': '<C-w>', 'at': '"\n\s*\%#\n\s*"',   'input': Joinspaces},
        \ {'char': '<C-w>', 'at': '(\n\s*\%#\n\s*)',   'input': Joinspaces},
        \ {'char': '<C-w>', 'at': '{\n\s*\%#\n\s*}',   'input': Joinspaces},
        \ {'char': '<C-w>', 'at': '\[\n\s*\%#\n\s*]',  'input': Joinspaces},
        \ ]

  let global += [
        \ {'char': '<C-u>', 'at': '''\n\s*\%#\n\s*''', 'input': Joinspaces},
        \ {'char': '<C-u>', 'at': '`\n\s*\%#\n\s*`',   'input': Joinspaces},
        \ {'char': '<C-u>', 'at': '"\n\s*\%#\n\s*"',   'input': Joinspaces},
        \ {'char': '<C-u>', 'at': '(\n\s*\%#\n\s*)',   'input': Joinspaces},
        \ {'char': '<C-u>', 'at': '{\n\s*\%#\n\s*}',   'input': Joinspaces},
        \ {'char': '<C-u>', 'at': '\[\n\s*\%#\n\s*]',  'input': Joinspaces},
        \ ]

  " " Overwrite Triple quotes {{{1
  " " Produce triple quoted block
  " let s:user_rules += [
  "      \ {'char': "'", 'at': "''\\%#", 'except': '\%#\S', 'input': "'<CR>", 'input_after': "<CR>'''"},
  "      \ {'char': '"', 'at': '""\%#',  'except': '\%#\S', 'input': '"<CR>', 'input_after': '<CR>"""'},
  "      \ {'char': '`', 'at': '``\%#',  'except': '\%#\S', 'input': '`<CR>', 'input_after': '<CR>```'},
  "      \ ]

  let global += [
        \ {'char': "'", 'at': "''\\%#", 'except': '\%#\S', 'input': "'"},
        \ {'char': '"', 'at': '""\%#',  'except': '\%#\S', 'input': '"'},
        \ {'char': '`', 'at': '``\%#',  'except': '\%#\S', 'input': '`'},
        \ ]

  let global += [
        \ {'char': "'", 'at': "'''\\%#", 'except': '\%#\S', 'input': '', 'input_after': "'''"},
        \ {'char': '"', 'at': '"""\%#',  'except': '\%#\S', 'input': '', 'input_after': '"""'},
        \ {'char': '`', 'at': '```\%#',  'except': '\%#\S', 'input': '', 'input_after': '```'},
        \ ]

  function! s:define_rules_for_space() abort closure "{{{1
    let group2conf.whitespace = []

    let group2conf.whitespace += [
          \ {'char': '<S-Space>',   'input': '<space>'},
          \ {'char': '<C-space>',   'input': '<space>'},
          \ {'char': '<C-S-Space>', 'input': '<space>'},
          \ ]

    const Insert_a_space_before_cursor = [
          \ {'char': '<C-S-Space>', 'at': '\%#\S', 'input': '<space>',
          \     'input_after': '<space>'},
          \ {'char': '<C-S-Space>', 'at': '\s\%#\S', 'input': '',
          \     'input_after': '<space>'},
          \ ]

    let Spread_brackets = []
    const in_brackets_to_spread = [
          \ '(\%#)',
          \ '{\%#}',
          \ '\[\%#]',
          \ '/\*\%#\*/',
          \ ]

    for space in ['<space>', '<S-space>']
      for in_brackets in in_brackets_to_spread
        let Spread_brackets += [
              \ {'char': space, 'at': in_brackets,
              \   'input': '<space>', 'input_after': '<Space>'},
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
      let pat_after_abbr =
            \ '\v('. join(abbrs_without_trailing_period, '|') .')\.%#'

      let Double_spaces_at_end_OfSentence = {
            \ 'char': space,
            \ 'input': '<space><space>',
            \ 'at': '[.?!]\%#', 'except': pat_after_abbr,
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
            \ 'char': space,
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

      let group2conf.whitespace += Spread_brackets
      let group2conf.whitespace += Insert_a_space_before_cursor
      let group2conf.whitespace += [
            \ Prepare_brackets_at_cond,
            \ Double_spaces_at_endOfSentence_in_Comment,
            \ Double_spaces_at_endOfSentence_as_FileType,
            \ ]

      " call extend(label, s:map_rules(label[c], {'char': char}))
    endfor
  endfunction
  call s:define_rules_for_space()

  " Addtional Rules to Skip Out; break repeat {{{1
  " Note: 'leave' seems to make 'input' and 'input_after' fail
  " Ref: Jump cursor over the provided pairs
  "   https://karubabu.hateblo.jp/entry/2017/05/24/190010
  " let s:rules_insert += [
  "      \ {'char': '<TAB>', 'at': '\%#[\])}`"'']', 'leave': 1},
  "      \ ]

  let global += [
        \ {'char': '<C-=>',     'input': ' = '},
        \
        \ {'char': '<C-,>', 'input': ', '},
        \ {'char': '<C-.>', 'input': '. '},
        \ {'char': '<C-:>', 'input': ': '},
        \ {'char': '<C-;>', 'input': '; '},
        \ ]

  const pat_before_close = '\%#[])}`''"]'
  const pat_before_paren = '\%#[])}]'
  const pat_before_quote = '\%#[''"`]'
  const pat_before_close_within_paren = pat_before_close .'.*\v([[({])@<!.*[])}]'

  let global += [
        \
        \ {'char': '<C-space>', 'at': '\%#.', 'input': '<C-g>U<Right><space>'},
        \
        \ {'char': '<C-=>', 'at': '\%#.', 'input': '<C-g>U<Right> = '},
        \
        \ {'char': '<C-,>', 'at': pat_before_close, 'input': '<C-g>U<Right>,'},
        \ {'char': '<C-,>', 'at': pat_before_close_within_paren, 'input': '<C-g>U<Right>, '},
        \ {'char': '<C-:>', 'at': pat_before_close, 'input': '<C-g>U<Right>: '},
        \ {'char': '<C-.>', 'at': pat_before_paren, 'input': '<C-g>U<Right>.'},
        \ {'char': '<C-.>', 'at': pat_before_quote, 'input': '<C-g>U<Right>. '},
        \
        \ {'char': '<C-;>', 'at': '\%#.',       'input': '<C-g>U<Right>; ', 'mode': 'c'},
        \ {'char': '<C-;>', 'at': '\%#.*;\s*$', 'input': '<C-g>U<Right>; '},
        \ {'char': '<C-;>', 'at': '\%#.', 'input': '<Esc>A;'},
        \ ]

  let global += [
        \ {'char': '<C-,>', 'at': '\a\%#\a', 'input': ', '},
        \ {'char': '<C-,>', 'at': '\<\%#\a', 'input': ', '},
        \ ]

  " Addtional Rules for Polymorphic Use {{{1
  let global += [
        \ {'char': '<C-d>', 'at': '\%#\A', 'input': '<C-g>U<Del>'},
        \ {'char': '<C-d>', 'at': '\%#\\\A', 'input': '<C-g>U<Del><C-g>U<Del>'},
        \ ]

  " <TAB> to create marker
  let global += [
        \ {'char': '<TAB>', 'at': '{\%#}', 'input': '<C-g>U<Del>{{'},
        \ {'char': '<TAB>', 'at': '\([^{]\){\%#}\1', 'input': '<C-g>U<Del><C-g>U<Del>{{'},
        \ ]

  let global += [
        \ {'char': ',', 'at': '[^,]\s\%#\S', 'input': '<BS>, '},
        \ ]

  " Addtional Rules on FileType {{{1
  " Suppress some rules up to filetype.
  let global += [
        \ {'char': "'", 'filetype': ['haskell', 'lisp', 'clojure', 'ocaml', 'reason', 'scala', 'rust']},
        \ {'char': '`', 'filetype': ['ocaml', 'reason']},
        \ ]

  " Rules for Vim {{{1
  let ft2char.vim = {}
  let group2conf.vim = []
  let group2ft.vim = [
        \ 'vim',
        \ ]

  " Delete duplicated '"' to comment in Vimscript.
  let group2conf.vim += [
        \ {'char': '<TAB>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><TAB>'},
        \ {'char': '<Space>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><space>'},
        \ {'char': '<S-Space>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><space>'},
        \ ]

  let group2conf.vim += [
        \ {'char': '<', 'at': 'map .*\%#', 'input_after': '>'},
        \ {'char': '<', 'at': 'exe [''"]norm .*\\\%#', 'input_after': '>'},
        \ ]

  " Add comma to add either List or Dict nested.
  let group2conf.vim += [
        \ {'char': '{', 'at': '^\s*\\\s*\%#', 'input_after': '},'},
        \ {'char': '[', 'at': '^\s*\\\s*\%#', 'input_after': '],'},
        \ ]

  let group2conf.vim += [
        \ {'char': '(', 'at': '\\\%#', 'input_after': '\)'},
        \ ]

  " Insert backslashes when filetype is vim
  let ft2char.vim['<CR>'] = [
        \ {'at': '^\s*\\.*\%#', 'input': '<CR>\ ', 'except': '[]})]\s*$'},
        \
        \ {'at': '\v(\=.*|\\)\s*\(%#\)', 'input': '<CR>\ ', 'input_after': '<CR>\ '},
        \ {'at': '\v(\=.*|\\)\s*\{%#}',  'input': '<CR>\ ', 'input_after': '<CR>\ '},
        \ {'at': '\v(\=.*|\\)\s*\[%#]',  'input': '<CR>\ ', 'input_after': '<CR>\ '},
        \ ]

  " Rules for Cpp {{{2
  let group2conf.cpp = []
  let group2conf.cpp += [
        \ {'char': '{', 'input_after': '};',
        \     'at': '\v<(struct|return|class)> .*%#',
        \     'except': '\v(template <.*%#|%#.*;)',
        \ },
        \ ]

  let ft2char.cpp = {}
  let ft2char.cpp['<'] = [
        \ {'at': '\a\%#', 'input_after': '>'},
        \ {'at': '^#include \%#', 'input_after': '>'},
        \ ]
  let ft2char.cpp['<C-:>'] = [
        \ {'at': '\%#>', 'input': '<C-g>U<Right>:'},
        \ ]
  let ft2char.cpp['='] = [
        \ {'input': '=', 'input_after': ';', 'except': '\%#.'},
        \ ]

  let ft2char.cpp['<Space>'] = [
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

  let ft2char.cpp['<C-space>'] = [
        \ {'at': 'cin  >> .\{-}\%#[''"]', 'input': '<C-g>U<Right> >> '},
        \ {'at': 'cout << .\{-}\%#[''"]', 'input': '<C-g>U<Right> << '},
        \ ]

  let ft2char.cpp[','] = [
        \ {'at': 'cin .*\h\w*\%#', 'input': ' >> '},
        \ {'at': 'cout .*\h\w*\%#', 'input': ' << '},
        \ ]

  " Finally: Override the rules though lexima#add_rule() "{{{1
  " Apply all the maps to both Insert and Command mode when unspecified
  " let foo = map(deepcopy(g:lexima#default_rules), 'substitute(get(v:val, "input"), ''\ze<\(Right\|End\)>\c'', "<C-g>U", "g"')

  " " Ref: Enable :iabbr in lexima (currently, iabbr works without the hooks)
  " "   http://pekepekesamurai.hatenablog.com/entry/2015/04/23/223559
  " call lexima#insmode#map_hook('before', '<Space>', "\<ESC>")
  " call lexima#insmode#map_hook('before', '<C-j>',   "\<ESC>")
  " call lexima#insmode#map_hook('after', '<CR>',    "\<CR>:-1s/\s\+$<CR>")

  let rules.formal = []

  " Declare conditions for each local rules {{{1
  let group2ft.react = [
        \ 'javascriptreact',
        \ 'typescriptreact',
        \ ]

  let group2ft.javascript = [
        \ 'javascript',
        \ 'javascriptreact',
        \ 'typescript',
        \ 'typescriptreact',
        \ ]

  let group2ft.css = [
        \ 'css',
        \ ]

  let group2ft.semicolon = [
        \ 'cpp',
        \ 'javascript',
        \ 'javascriptreact',
        \ 'typescript',
        \ 'typescriptreact',
        \ ]

  let group2ft.tag = [
        \ 'htm',
        \ 'html',
        \ 'javascriptreact',
        \ 'php',
        \ 'typescriptreact',
        \ 'xml',
        \ ]

  " Convert rules {{{1
  let formal = rules.formal

  function! s:_convert_ft2char_into_group2fts() abort closure
    let ret = []
    for ft in keys(ft2char)
      let char2conf = ft2char[ft]

      for char in keys(char2conf)
        let conf = char2conf[char]
        let ret += s:insert_rule2rules(conf, {
              \ 'char': char,
              \ 'filetype': ft,
              \ })
      endfor
    endfor

    return ret
  endfunction

  function! s:convert_local_rules() abort closure
    let ret = []
    let ret += s:_convert_ft2char_into_group2fts()

    for group in keys(group2ft)
      let conf = group2conf[group]
      let ret += s:insert_rule2rules(conf, {'filetype': group2ft[group]})
    endfor

    return ret
  endfunction

  let formal += s:convert_local_rules()
  let formal += global

  function! s:reset_rules() abort closure
    call lexima#clear_rules()
    for r in formal
      call lexima#add_rule(r)
    endfor
  endfunction
  call s:reset_rules()
endfunction
call s:set_rules()

delfunction s:set_rules
delfunction s:insert_rule2rules
