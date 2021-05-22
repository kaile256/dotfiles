" From: operator.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich

" Except: Undocumented options
"   https://github.com/machakann/vim-sandwich/issues/74
" - The difference between `kind` and `action`
"   - `kind` consists of two: `operator` and `textobject`.
"     - `operator` consists of three: `add`, `delete`, `replace`.
"     - `textobject` consists of two: `auto`, `query`.
"   - `action` consists of two: `add` and `delete`
"     - `kind/replace` consists both of `add` and `delete`.
"     - `action/add` contains `add` and `replace` of `kind`.
"     - `action/delete` contains `textobject`, `delete` and `replace` of `kind`.

function! s:devise_recipes() abort
  " Note:  Don't copy `g:sandwich#recipes` from `g:sandwich#default_recipes`.
  " Duplicated recipes override other recipes.

  " TODO: Name eache group of recipes and reset `g:sandwich#recipes` just
  " before the for-loop.
  let g:sandwich#recipes = []
  let recipes = {}

  " let recipes.comma = [
  "      \ {
  "      \   'buns': ['[,[{(]\s*', ',]})\s*'],
  "      \   'regex': 1,
  "      \   'input': [',']
  "      \ },
  "      \ ]

  const double_single_quotes_head = '\%(\%#\zs''\|''\%#\zs\)''\%(''''\)*[^'']'
  const double_single_quotes_tail = '[^'']\%(''''\)*\%(\%#\zs''\|''\%#\zs\)'''
  let recipes.quote = [
        \ {
        \   'buns': ['^$', '^$'],
        \   'regex': 1,
        \   'linewise': 1,
        \   'input': ["\<CR>"],
        \ },
        \ {
        \   'buns': ['"', '"'],
        \   'quoteescape': 1,
        \   'expand_range': 0,
        \   'nesting': 0,
        \   'linewise': 0,
        \ },
        \ {
        \   'buns': ["'", "'"],
        \   'quoteescape': 1,
        \   'expand_range': 0,
        \   'nesting': 0,
        \   'linewise': 0,
        \ },
        \ {
        \   'buns': ['`', '`'],
        \   'quoteescape': 1,
        \   'expand_range': 0,
        \   'nesting': 0,
        \   'linewise': 0,
        \ },
        \
        \ {
        \   'buns': ["'", "'"],
        \   'filetype': ['vim'],
        \   'skip_regex_head': [double_single_quotes_head],
        \   'skip_regex_tail': [double_single_quotes_tail],
        \   'nesting': 0,
        \   'linewise': 0,
        \ },
        \ ]

  let recipes.triple_quotes = [
        \ {
        \   'buns': ["'''", "'''"],
        \   'input': ['g"', "g'"],
        \   'nesting': 0,
        \ },
        \ {
        \   'buns': ['"""', '"""'],
        \   'input': ['g"', "g'"],
        \   'nesting': 0,
        \ },
        \ ]

  let recipes.bracket = [
        \ {
        \   'input': ['('],
        \   'buns': ['(', ')'],
        \   'nesting': 1,
        \ },
        \ {
        \   'input': ['{'],
        \   'buns': ['{', '}'],
        \   'nesting': 1,
        \   'skip_break': 1,
        \ },
        \ {
        \   'input': ['['],
        \   'buns': ['[', ']'],
        \   'nesting': 1,
        \ },
        \ {
        \   'input': ['<'],
        \   'buns': ['<', '>'],
        \   'expand_range': 0,
        \ },
        \
        \ {
        \   'input': ['<'],
        \   'buns': ['\%(\\\@<!".*\zs\\\)\?<', '>\%(\ze.*\\\@<!"\)\?'],
        \   'regex': 1,
        \   'filetype': ['vim'],
        \   'action': ['delete'],
        \ },
        \ ]

  let recipes.escaped_brackets = [
        \ {
        \   'input': ['>'],
        \   'buns': ['\<', '\>'],
        \   'nesting': 1,
        \ }, {
        \   'input':  [')'],
        \   'buns': ['\(', '\)'],
        \   'nesting': 1,
        \ },
        \ {
        \   'input':  ['}'],
        \   'buns': ['\{', '\}'],
        \   'nesting': 1,
        \ },
        \ ]

  let recipes.special_brackets = [
        \ {
        \   'input': ['%'],
        \   'buns': ['\%(', '\)'],
        \   'nesting': 1,
        \   'filetype': ['vim'],
        \ },
        \ {
        \   'input': [']'],
        \   'buns': ['[[', ']]'],
        \   'filetype': ['lua'],
        \ },
        \ ]

  " https://github.com/monaqa/dotfiles/blob/32f70b3f92d75eaab07a33f8bf28ee17927476e8/.config/nvim/plugin-settings.vim#L679-L685
  let recipes.japanese = [
        \ {
        \   'buns': ['（', '）'],
        \   'nesting': 1,
        \   'input': ['j(', 'j)'],
        \ },
        \ {
        \   'buns': ['「', '」'],
        \   'nesting': 1,
        \   'input': ['j[', 'j]'],
        \ },
        \ {
        \   'buns': ['『', '』'],
        \   'nesting': 1,
        \   'input': ['j{', 'j}'],
        \ },
        \ {
        \   'buns': ['【', '】'],
        \   'nesting': 1,
        \   'input': ['j<', 'j>'],
        \ },
        \ ]

  let recipes.tag = [
        \ {
        \   'buns': 'sandwich#magicchar#t#tag()',
        \   'listexpr': 1,
        \   'kind': ['add'],
        \   'action': ['add'],
        \   'input': ['t', 'T'],
        \ },
        \ {
        \   'buns': 'sandwich#magicchar#t#tag()',
        \   'listexpr': 1,
        \   'kind': ['replace'],
        \   'action': ['add'],
        \   'input': ['T'],
        \ },
        \ {
        \   'buns': 'sandwich#magicchar#t#tagname()',
        \   'listexpr': 1,
        \   'kind': ['replace'],
        \   'action': ['add'],
        \   'input': ['t'],
        \ },
        \ {
        \   'external': ["\<Plug>(textobj-sandwich-tag-i)", "\<Plug>(textobj-sandwich-tag-a)"],
        \   'noremap' : 0,
        \   'kind' : ['delete', 'textobj'],
        \   'expr_filter': ['operator#sandwich#kind() !=# "replace"'],
        \   'linewise': 1,
        \   'input': ['t', 'T'],
        \ },
        \ {
        \   'external': ["\<Plug>(textobj-sandwich-tag-i)", "\<Plug>(textobj-sandwich-tag-a)"],
        \   'noremap' : 0,
        \   'kind' : ['replace', 'query'],
        \   'expr_filter': ['operator#sandwich#kind() ==# "replace"'],
        \   'input': ['T'],
        \ },
        \ {
        \   'external': ["\<Plug>(textobj-sandwich-tagname-i)", "\<Plug>(textobj-sandwich-tagname-a)"],
        \   'noremap' : 0,
        \   'kind' : ['replace', 'textobj'],
        \   'expr_filter': ['operator#sandwich#kind() ==# "replace"'],
        \   'input': ['t'],
        \ },
        \ ]

  let recipes.list = [
        \ {
        \   'buns': ['\<\%(\h\k*\.\)*\h\k*\[', '\]'],
        \   'regex': 1,
        \   'action': ['delete'],
        \   'input': ['l']
        \ },
        \ ]

  let recipes.function = [
        \ {
        \   'buns': ['sandwich#magicchar#f#fname()', '")"'],
        \   'kind': ['add', 'replace'],
        \   'action': ['add'],
        \   'expr': 1,
        \   'input': ['f'],
        \ },
        \ {
        \   'external': ["\<Plug>(textobj-sandwich-function-ip)", "\<Plug>(textobj-sandwich-function-i)"],
        \   'noremap': 0,
        \   'kind': ['delete', 'replace', 'query'],
        \   'input': ['f'],
        \ },
        \ {
        \   'external': ["\<Plug>(textobj-sandwich-function-ap)", "\<Plug>(textobj-sandwich-function-a)"],
        \   'noremap': 0,
        \   'kind': ['delete', 'replace', 'query'],
        \   'input': ['F'],
        \ },
        \ {
        \   'buns': ['$(\h\w*\s*', ')'],
        \   'filetype': ['make'],
        \   'nesting': 1,
        \   'regex': 1,
        \   'action': ['delete'],
        \   'input': ['f'],
        \ },
        \ {
        \   'buns': ['"$(". input("funcname: ") ." "', '")"'],
        \   'filetype': ['make'],
        \   'nesting': 1,
        \   'expr': 1,
        \   'action': ['add'],
        \   'input': ['f'],
        \ },
        \ ]

  function! s:set_for_loop() abort
    let raw_var = input('[for-loop] var for each item: ')
    let raw_list = input('[for-loop] list: ')

    let sep = '[ ,]\+'
    let vars = split(raw_var, sep)
    let l:var  = join(vars, ', ')
    if l:var =~# ',' && l:var !~# '^\[.*\]$'
      let l:var = '['. l:var .']'
    endif

    " TODO: keep `+`
    let sep = '[ ,]\+'
    let lists = split(raw_list, sep)
    let l:list  = join(lists, ', ')
    if l:list =~# ',' && l:list !~# '^\[.*\]$'
      let l:list = '['. l:list .']'
    endif

    let format = printf('for %s in %s', l:var, l:list)

    return format
  endfunction
  let recipes.for_loop = [
        \ {
        \   'buns': ['call('. string(function('s:set_for_loop')) .', [])', '"endfor"'],
        \   'kind': ['add', 'replace'],
        \   'action': ['add'],
        \   'expr': 1,
        \   'motionwise': ['line'],
        \   'input': ['gf'],
        \   'filetype': ['vim'],
        \ },
        \ {
        \   'buns': ['"\n". call('. string(function('s:set_for_loop')) .', []) ."\n"', '"\nendfor\n"'],
        \   'kind': ['add', 'replace'],
        \   'action': ['add'],
        \   'expr': 1,
        \   'motionwise': ['char', 'block'],
        \   'input': ['gf'],
        \   'filetype': ['vim'],
        \ },
        \
        \ {
        \   'buns': ['"for (". input("for-loop condition: ") .") {"', '"}"'],
        \   'kind': ['add'],
        \   'action': ['add'],
        \   'expr': 1,
        \   'input': ['gf'],
        \   'filetype': ['c', 'cpp', 'java', 'go']
        \ },
        \
        \ {
        \   'buns': ['for .*', 'endfor'],
        \   'kind': ['delete', 'replace'],
        \   'action': ['delete'],
        \   'input': ['gf'],
        \   'filetype': ['vim'],
        \ },
        \ ]

  let recipes.while_loop = [
        \ {
        \   'buns': ['"while ". input("[while-loop] condition: ")', '"endwhile"'],
        \   'kind': ['add'],
        \   'action': ['add'],
        \   'motionwise': ['line'],
        \   'expr': 1,
        \   'input': ['gw'],
        \   'filetype': ['vim'],
        \ },
        \ {
        \   'buns': ['"\nwhile ". input("[while-loop] condition: ") ."\n"', '"\nendwhile\n"'],
        \   'kind': ['add'],
        \   'action': ['add'],
        \   'motionwise': ['char', 'block'],
        \   'expr': 1,
        \   'input': ['gw'],
        \   'filetype': ['vim'],
        \ },
        \
        \ {
        \   'buns': ['"while (". input("cond: ") .") {"', '"}"'],
        \   'kind': ['add'],
        \   'action': ['add'],
        \   'expr': 1,
        \   'input': ['w'],
        \   'filetype': [
        \     'c',
        \     'cpp',
        \     'java',
        \     'javascript',
        \     'javascriptreact',
        \     'typescript',
        \     'typescriptreact',
        \ ],
        \ },
        \ ]

  let recipes.instant = [
        \ {
        \   'buns': 'sandwich#magicchar#i#input("operator")',
        \   'kind': ['add', 'replace'],
        \   'action': ['add'],
        \   'listexpr': 1,
        \   'input': ['i'],
        \ },
        \ {
        \   'buns': 'sandwich#magicchar#i#input("textobj", 1)',
        \   'kind': ['delete', 'replace', 'query'],
        \   'listexpr': 1,
        \   'regex': 1,
        \   'input': ['i'],
        \ },
        \ {
        \   'buns': 'sandwich#magicchar#i#lastinput("operator", 1)',
        \   'kind': ['add', 'replace'],
        \   'action': ['add'],
        \   'listexpr': 1,
        \   'input': ['I'],
        \ },
        \ {
        \   'buns': 'sandwich#magicchar#i#lastinput("textobj")',
        \   'kind': ['delete', 'replace', 'query'],
        \   'listexpr': 1,
        \   'regex': 1,
        \   'input': ['I'],
        \ },
        \ ]

  let recipes.whitespace = [
        \ {
        \   'buns': ['\s\+', '\s\+'],
        \   'regex': 1,
        \   'action': ['delete'],
        \   'input': [' '],
        \ },
        \ ]

  let recipes.newline = [
        \ {
        \   'buns': ['^$', '^$'],
        \   'regex': 1,
        \   'linewise': 1,
        \   'input': ["\<CR>"],
        \ },
        \ {
        \   'buns': ['', ''],
        \   'action': ['add'],
        \   'motionwise': ['line'],
        \   'linewise': 1,
        \   'input': ["\<CR>"],
        \ },
        \ ]

  let recipes.newline += [
        \ {
        \   'input': ["\<CR>"],
        \   'buns': ["\<CR>\\ ", "\\\<CR>"],
        \   'linewise': 1,
        \   'filetype': ['vim'],
        \   'action': ['add'],
        \ },
        \ {
        \   'input': ["\<CR>"],
        \   'buns': ["\<CR>\\ ", "\<CR>\\ "],
        \   'linewise': 0,
        \   'filetype': ['vim'],
        \   'action': ['add'],
        \ },
        \ ]

  for r in keys(recipes)
    call extend(g:sandwich#recipes, recipes[r])
  endfor
endfunction
call s:devise_recipes()
delfunction s:devise_recipes
