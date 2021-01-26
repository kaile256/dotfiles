" From: insert.toml
" Repo: cohama/lexima.vim
" Another: source/lexima.vim

" Excerpt: Undo Break
" <C-g>u: Break undo sequence
" <C-g>U: Don't break undo with next cursor movement within the same line.

imap <BS> <C-h>

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
  let config = {
        \   'formal': [],
        \
        \   'global': [],
        \
        \   'group': {
        \     'rules': {},
        \     'filetypes': {},
        \   }
        \ }

  let global = config.global

  " If the key of group2conf has no corresponding key in group2ft, regard the
  " key as the target filetype
  let group2rules = config.group.rules
  let group2ft   = config.group.filetypes

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

  let group2rules.React = [] "{{{1

  const pat_revising = '\%#[^,;]\+'
  const Complete_backtick_for_CSS_in_JS = {
        \ 'char': '`', 'input_after': '`', 'except': pat_revising,
        \ 'at': '\<styled\>\S*\%#',
        \ }

  let group2rules.React += [
        \ Complete_backtick_for_CSS_in_JS,
        \ ]

  let group2rules.Javascript = [] "{{{1

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

  let group2rules.Javascript += [
        \ {'char': '<space>', 'input_after': ';', 'at': 'import\%#'},
        \ {'char': '<space>', 'input_after': ';',
        \     'at': 'let\%#', 'except': pat_revising},
        \ Append_comma,
        \ Append_semicolon,
        \ Append_colon_after_case,
        \ ]

  let group2rules.Semicolon = [] "{{{1

  let group2rules.Semicolon += [
        \ {'char': '<space>', 'input_after': ';',
        \     'at': 'return\%#', 'except': '\%#.\+'},
        \ {'char': '<space>', 'input_after': ';',
        \     'at': '=\%#', 'except': '\%#.\+'},
        \ {'char': '<C-h>', 'input': '<C-g>U<Del><BS>', 'at': '=\%#;'},
        \ ]

  let group2rules.Tag = [] "{{{1

  let group2rules.Tag += [
        \ {'char': '<CR>', 'at': '\%#\s*/>',
        \   'input_after': '<CR>', 'input': '<CR>'},
        \ ]

  " Spilt <tag><\tag> on <CR>
  const Split_tag = [
        \ {'char': '<CR>', 'at': '<.\{-}>\%#<.\{-}>',
        \   'input': '<CR>', 'input_after': '<CR>'},
        \ ]
  let group2rules.Tag += Split_tag

  let group2rules.Writing = [] "{{{1

  let group2rules.Writing += [
        \ {'char': '<CR>', 'input': '<CR><C-g>u'},
        \ ]
  let group2rules.Writing += [
        \ {'char': ',', 'input': ',<C-g>u'},
        \ {'char': '.', 'input': '.<C-g>u'},
        \ {'char': '?', 'input': '?<C-g>u'},
        \ {'char': '!', 'input': '!<C-g>u'},
        \ {'char': ';', 'input': ';<C-g>u'},
        \ {'char': ':', 'input': ':<C-g>u'},
        \ ]

  " Overwrite Rules for Newline {{{1
  const Delete_trailing_spaces = '<Esc>:noau keeppatterns -1 s/\s\+$//e<CR>gi<C-f>'
  let global += [{
       \ 'char': '<CR>',
       \ 'input': '<CR>'. Delete_trailing_spaces,
       \ 'at': '^\s*\n\s*\%#$',
       \ }, {
       \ 'char': '<CR>',
       \ 'input': '<CR>'. Delete_trailing_spaces,
       \ 'at': '\W\s\+\%#',
       \ 'if': '&ft !=# "markdown"',
       \ }, {
       \ 'char': '<CR>',
       \ 'input': '<CR>'. Delete_trailing_spaces,
       \ 'filetype': ['markdown'],
       \ 'at': '\s\+\%#',
       \ 'except': '  \%#',
       \ }, {
       \ 'char': '<CR>',
       \ 'input': '<CR>'. Delete_trailing_spaces .'\ ',
       \ 'filetype': ['vim'],
       \ 'at': '^\s*\\.*\%#',
       \ }]

  " Copied from cohama/lexima.vim/autoload/lexima.vim @75
  const Split_brackets = [
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
  let global += Split_brackets

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

  " FIXME: ')' in command line works as {'leave': 1} wherever cursor is before ')'
  const Ignore_duplicated = [
        \ {'char': ')', 'at': '\%#)', 'input': '<C-g>U<Right>'},
        \ {'char': ']', 'at': '\%#]', 'leave': 1},
        \ {'char': '}', 'at': '\%#}', 'leave': 1},
        \ {'char': '>', 'at': '\%#>', 'leave': 1},
        \ ]
  let global += Ignore_duplicated

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
        \ {'char': '<C-h>', 'at': '(\%#)',   'input': '<BS><C-g>U<Del>'},
        \ {'char': '<C-h>', 'at': '{\%#}',   'input': '<BS><C-g>U<Del>'},
        \ {'char': '<C-h>', 'at': '\[\%#\]', 'input': '<BS><C-g>U<Del>'},
        \ {'char': '<C-h>', 'at': '<\%#>',   'input': '<BS><C-g>U<Del>'},
        \ {'char': '<C-h>', 'at': '\W\s\%#\s\W', 'input': '<BS><C-g>U<Del>'},
        \
        \ {'char': '<C-h>', 'at': "'\\%#'", 'input': '<BS><C-g>U<Del>'},
        \ {'char': '<C-h>', 'at': '"\%#"',  'input': '<BS><C-g>U<Del>'},
        \ {'char': '<C-h>', 'at': '`\%#`',  'input': '<BS><C-g>U<Del>'},
        \ ]

  let global += [
        \ {'char': '<C-h>', 'at': '(\%#),',  'input': '<BS><C-g>U<Del><C-g>U<Del>'},
        \ {'char': '<C-h>', 'at': '{\%#},',  'input': '<BS><C-g>U<Del><C-g>U<Del>'},
        \ {'char': '<C-h>', 'at': '\[\%#],', 'input': '<BS><C-g>U<Del><C-g>U<Del>'},
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
        \ {'char': '<C-h>', 'at': '''\n\s*\%#\n\s*''', 'input': Joinspaces},
        \ {'char': '<C-h>', 'at': '`\n\s*\%#\n\s*`',   'input': Joinspaces},
        \ {'char': '<C-h>', 'at': '"\n\s*\%#\n\s*"',   'input': Joinspaces},
        \ {'char': '<C-h>', 'at': '(\n\s*\%#\n\s*)',   'input': Joinspaces},
        \ {'char': '<C-h>', 'at': '{\n\s*\%#\n\s*}',   'input': Joinspaces},
        \ {'char': '<C-h>', 'at': '\[\n\s*\%#\n\s*]',  'input': Joinspaces},
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
    let global += [
          \ {'char': '<S-Space>',   'input': '<space>'},
          \ {'char': '<C-Space>',   'input': '<space>'},
          \ {'char': '<C-S-Space>', 'input': '<space>'},
          \ ]

    const Insert_a_space_before_cursor = [
          \ {'char': '<C-Space>', 'at': '\%#\a', 'input': '',
          \     'input_after': '<space>'},
          \ ]

    let Spread_brackets = []
    const in_brackets_to_spread = [
          \ '(\%#)',
          \ '{\%#}',
          \ '\[\%#]',
          \ '/\*\%#\*/',
          \ ]

    for space in ['<space>', '<S-Space>']
      for in_brackets in in_brackets_to_spread
        let Spread_brackets += [
              \ {'char': space, 'at': in_brackets,
              \   'input': '<space>', 'input_after': '<Space>'},
              \ ]
      endfor

      let Make_task = [
            \ {
            \   'char': space,
            \   'at': '^\s*- \[\%#]',
            \   'input': '<space><C-g>U<Right><space>',
            \   'filetype': ['markdown'],
            \ }
            \ ]

      let abbrs_without_trailing_period = []
      let abbrs_without_trailing_period += [
            \ 'abbr',
            \ 'esp',
            \ ]
      let abbrs_without_trailing_period += ['\u\a'] " like Mr.
      let abbrs_without_trailing_period += ['\u.\u'] " like U.S.A.
      let abbrs_without_trailing_period += ['\d+'] " indices of orderd list
      let pat_after_abbr =
            \ '\v%('. join(abbrs_without_trailing_period, '|') .').%#'

      let Double_spaces_at_end_OfSentence = {
            \ 'char': space,
            \ 'input': '<space><space>',
            \ 'at': '\S[.?!]\%#', 'except': pat_after_abbr,
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

      let global += Make_task
      let global += Spread_brackets
      let global += Insert_a_space_before_cursor
      let global += [
            \ Prepare_brackets_at_cond,
            \ Double_spaces_at_endOfSentence_in_Comment,
            \ Double_spaces_at_endOfSentence_as_FileType,
            \ ]
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
        \ {'char': '<C-=>', 'input': ' = '},
        \
        \ {'char': '<C-,>', 'input': ', '},
        \ {'char': '<C-.>', 'input': '. '},
        \ {'char': '<C-:>', 'input': ': '},
        \ {'char': '<C-;>', 'input': '; '},
        \ ]

  const pat_before_close = '\%#[])}`''"]'
  let global += [
        \
        \ {'char': '<C-space>', 'at': '\%#.', 'input': '<C-g>U<Right><space>'},
        \
        \ {'char': '<C-=>', 'at': '\%#.', 'input': '<C-g>U<Right> = '},
        \
        \ {'char': '<C-,>', 'at': pat_before_close, 'input': '<C-g>U<Right>, '},
        \ {'char': '<C-:>', 'at': pat_before_close, 'input': '<C-g>U<Right>: '},
        \ {'char': '<C-.>', 'at': pat_before_close, 'input': '<C-g>U<Right>. '},
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

  " Typo Correction {{{1
  " <C-, <A-, etc., not to insert <C_, <A_
  let global += [
        \ {'char': '_', 'at': '<[ACDSM]\%#', 'input': '-', 'mode': 'ic'},
        \ ]

  " With Other Plugins {{{1
  " TOML: default.toml
  " Repo: vim-scripts/sherlock.vim
  " Note: <C-_> for <C-slash>
  let with_Sherlock = [
        \ {
        \   'char': '<C-_>',
        \   'input': '<C-\>esherlock#completeForward()<CR>',
        \   'mode': 'c',
        \ },
        \ {
        \   'char': '<C-?>',
        \   'input': '<C-\>esherlock#completeBackward()<CR>',
        \   'mode': 'c',
        \ },
        \ ]
  let global += with_Sherlock

  " Addtional Rules on FileType {{{1
  " Suppress some rules up to filetype.
  const Always_single_quots_on_some_filetypes = [
        \ {'char': '`', 'filetype': ['ocaml', 'reason']},
        \ {
        \   'char': "'",
        \   'filetype': ['haskell', 'lisp', 'clojure', 'ocaml', 'reason', 'scala', 'rust']
        \ },
        \ ]
  let global += Always_single_quots_on_some_filetypes

  let group2rules.python = [] "{{{1

  const Double_quotes_at_special_string = [
        \ {'char': "'", 'input_after': "'", 'at': '\<[rf]\%#'},
        \ {'char': '"', 'input_after': '"', 'at': '\<[rf]\%#'},
        \ ]
  let group2rules.python += Double_quotes_at_special_string

  let group2rules.Vim = [] "{{{1

  " Delete duplicated double-quotes to comment in Vimscript.
  const Start_vimLineComment = [
        \ {'char': '<TAB>',     'at': '^\s*"\%#"', 'input': '<C-g>U<Del><TAB>'},
        \ {'char': '<Space>',   'at': '^\s*"\%#"', 'input': '<C-g>U<Del><space>'},
        \ {'char': '<S-Space>', 'at': '^\s*"\%#"', 'input': '<C-g>U<Del><space>'},
        \ ]
  let group2rules.Vim += Start_vimLineComment

  const Ignore_duplicated_line_continuation = [
        \ {'char': '<bslash>', 'at': '^\s*\\\s*\%#', 'input': '<C-g>U<Right>'},
        \ ]
  let group2rules.Vim += Ignore_duplicated_line_continuation

  const Complete_map_args = [
        \ {'char': '<', 'at': 'map .*\%#', 'input_after': '>'},
        \ {'char': '<', 'at': 'exe [''"]norm .*\\\%#', 'input_after': '>'},
        \ ]
  let group2rules.Vim += Complete_map_args

  " Add comma to add either List or Dict nested.
  let group2rules.Vim += [
        \ {'char': '{', 'at': '^\s*\\\s*\%#', 'input_after': '},'},
        \ {'char': '[', 'at': '^\s*\\\s*\%#', 'input_after': '],'},
        \ ]

  let group2rules.Vim += [
        \ {'char': '(', 'at': '\\\%#', 'input_after': '\)'},
        \ ]

  " Insert backslashes when filetype is vim
  let group2rules.Vim += [
        \ {'char': '<CR>', 'at': '^\s*\\.*\%#', 'input': '<CR>\ ', 'except': '[]})]\s*$'},
        \
        \ {'char': '<CR>', 'at': '\v(\=.*|\\)\s*\(%#\)', 'input': '<CR>\ ', 'input_after': '<CR>\ '},
        \ {'char': '<CR>', 'at': '\v(\=.*|\\)\s*\{%#}',  'input': '<CR>\ ', 'input_after': '<CR>\ '},
        \ {'char': '<CR>', 'at': '\v(\=.*|\\)\s*\[%#]',  'input': '<CR>\ ', 'input_after': '<CR>\ '},
        \ ]

  " Like line("'<"), col("']")
  const Vim_DescribeMarkPos = [
        \ {
        \   'char': '<',
        \   'input': '<<C-g>U<C-g>U<Right><C-g>U<Right>',
        \   'at': '("''\%#")',
        \ },
        \ {
        \   'char': '<',
        \   'input': '<<C-g>U<Del><C-g>U<Right><C-g>U<Right>',
        \   'at': '("''\%#''")',
        \ },
        \
        \ {
        \   'char': '>',
        \   'input': '><C-g>U<C-g>U<Right><C-g>U<Right>',
        \   'at': '("''\%#")',
        \ },
        \ {
        \   'char': '>',
        \   'input': '><C-g>U<Del><C-g>U<Right><C-g>U<Right>',
        \   'at': '("''\%#''")',
        \ },
        \
        \
        \ {
        \   'char': '[',
        \   'input': '[<C-g>U<C-g>U<Right><C-g>U<Right>',
        \   'at': '("''\%#")',
        \ },
        \ {
        \   'char': '[',
        \   'input': '[<C-g>U<Del><C-g>U<Right><C-g>U<Right>',
        \   'at': '("''\%#''")',
        \ },
        \
        \ {
        \   'char': ']',
        \   'input': ']<C-g>U<C-g>U<Right><C-g>U<Right>',
        \   'at': '("''\%#")',
        \ },
        \ {
        \   'char': ']',
        \   'input': ']<C-g>U<Del><C-g>U<Right><C-g>U<Right>',
        \   'at': '("''\%#''")',
        \ },
        \ ]
  let group2rules.Vim += Vim_DescribeMarkPos

  let group2rules.cpp = [] "{{{1

  let group2rules.cpp += [
        \ {'char': '{', 'input_after': '};',
        \     'at': '\v<(struct|return|class)> .*%#',
        \     'except': '\v(template <.*%#|%#.*;)',
        \ },
        \ ]

  let group2rules.cpp += [
        \ {'char': '<', 'at': '\a\%#', 'input_after': '>'},
        \ {'char': '<', 'at': '^#include \%#', 'input_after': '>'},
        \ ]
  let group2rules.cpp += [
        \ {'char': '<C-:>', 'at': '\%#>', 'input': '<C-g>U<Right>:'},
        \ ]
  let group2rules.cpp += [
        \ {'char': '=', 'input': '=', 'input_after': ';', 'except': '\%#.'},
        \ ]

  let group2rules.cpp += [
        \ {'char': '<space>', 'at': '(.*\%#.*)',  'priority': 90},
        \ {'char': '<space>', 'at': '{.*\%#.*}',  'priority': 90},
        \ {'char': '<space>', 'at': '\[.*\%#.*]', 'priority': 90},
        \
        \ {'char' : '<space>', 'input': ' >> ',  'at': 'cin\%#'},
        \ {'char' : '<space>', 'input': ' << ', 'at': 'cout\%#'},
        \
        \ {'char': '<space>', 'input': ' >> ',  'at': 'cin.*[^> ]\+\%#', 'except': '\v(;.*%#|%#.*[^;\]\)])'},
        \ {'char': '<space>', 'input': ' << ', 'at': 'cout.*[^< ]\+\%#', 'except': '\v(;.*%#|%#.*[^;\]\)])'},
        \ ]

  let group2rules.cpp += [
        \ {'char': '<C-space>', 'at': 'cin  >> .\{-}\%#[''"]', 'input': '<C-g>U<Right> >> '},
        \ {'char': '<C-space>', 'at': 'cout << .\{-}\%#[''"]', 'input': '<C-g>U<Right> << '},
        \ ]

  let group2rules.cpp += [
        \ {'char': ',', 'at': 'cin .*\h\w*\%#', 'input': ' >> '},
        \ {'char': ',', 'at': 'cout .*\h\w*\%#', 'input': ' << '},
        \ ]

  let group2rules.css = [] "{{{1
  let group2rules.css += [
        \ {'char': '<space>', 'input': ': ', 'input_after': ';',
        \     'at': '^\s\+[a-zA-Z-]\+\%#', 'except': '\%#.\+',},
        \ {'char': '<space>', 'input_after': ';',
        \     'at': '^\s\+[a-zA-Z-]\+:\%#', 'except': '\%#.\+'},
        \ ]

  const Format_css_element = [
        \ {'char': '<space>', 'at': '^\w\+\%#', 'filetype': 'css', 'syntax': '',
        \   'input': '<Esc>:<C-u>keepjumps keeppatterns s/^\ze\w/./e<CR>gi<C-g>U<Right><space>'},
        \ {'char': '<C-space>', 'at': '^\w\+\%#', 'filetype': 'css', 'syntax': '',
        \   'input': '<Esc>:<C-u>keepjumps keeppatterns s/^\ze\w/./e<CR>gi<C-g>U<Right><space>'},
        \ ]
  let group2rules.css += Format_css_element

  let group2rules.markdown = [] "{{{1
  let group2rules.markdown += [{
        \ 'char': '<C-d>',
        \ 'at': '^\s*#\+.*\%#',
        \ 'input': '<Esc>^"_xgi<C-g>U<Left>',
        \ }, {
        \ 'char': '<C-t>',
        \ 'at': '^\s*#\+.*\%#',
        \ 'input': '<Esc>:keeppatterns s/^\s*\zs#/##/e<CR>gi<C-g>U<Right>',
        \ }]

  let Mkd_AddTask = [
        \ {
        \   'char': '<CR>',
        \   'at': '^\s*- [.].*\%#',
        \   'input': '<CR>- [ ] ',
        \ },
        \ ]
  let group2rules.markdown += Mkd_AddTask

  " Finally: Override the rules though lexima#add_rule() "{{{1
  " Apply all the maps to both Insert and Command mode when unspecified
  " let foo = map(deepcopy(g:lexima#default_rules), 'substitute(get(v:val, "input"), ''\ze<\(Right\|End\)>\c'', "<C-g>U", "g"')

  " " Ref: Enable :iabbr in lexima (currently, iabbr works without the hooks)
  " "   http://pekepekesamurai.hatenablog.com/entry/2015/04/23/223559
  " call lexima#insmode#map_hook('before', '<Space>', "\<ESC>")
  " call lexima#insmode#map_hook('before', '<C-j>',   "\<ESC>")
  " call lexima#insmode#map_hook('after', '<CR>',    "\<CR>:-1s/\s\+$<CR>")

  let config.formal = []

  " Declare conditions for each local rules {{{1
  let group2ft.React = [
        \ 'javascriptreact',
        \ 'typescriptreact',
        \ ]

  let group2ft.Vim = [
        \ 'vim',
        \ 'vimspec',
        \ ]

  let group2ft.Javascript = [
        \ 'javascript',
        \ 'javascriptreact',
        \ 'typescript',
        \ 'typescriptreact',
        \ ]

  let group2ft.Semicolon = [
        \ 'cpp',
        \ 'javascript',
        \ 'javascriptreact',
        \ 'typescript',
        \ 'typescriptreact',
        \ ]

  let group2ft.Tag = [
        \ 'htm',
        \ 'html',
        \ 'javascriptreact',
        \ 'php',
        \ 'typescriptreact',
        \ 'xml',
        \ ]

  let group2ft.Writing = [
        \ 'help',
        \ 'markdown',
        \ 'text',
        \ 'vimwiki',
        \ ]

  " Convert rules {{{1
  let formal = config.formal

  function! s:convert_local_rules() abort closure
    let ret = []

    for group in keys(group2rules)
      let fts = []

      let rules = group2rules[group]
      if group =~# '^\l'
        let fts += [ group ]

      else
        if !has_key(group2ft, group)
          echoerr group .' has no corresponding group2ft'
        endif

        let fts += group2ft[group]
      endif

      " " All the rules also work on snippets files.
      " let fts += dein#tap('ultisnips') ? ['snippets'] : []
      " let fts += dein#tap('neosnippet.vim') ? ['neosnippet'] : []

      let ret += s:insert_rule2rules(rules, {'filetype': fts})
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

