" From: operator.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich
" Another: add/sandwich.vim
" Another: source/sandwich.vim

function! s:devise_recipes() abort
  " Note:  Don't copy `g:sandwich#recipes` from `g:sandwich#default_recipes`.
  " Duplicated recipes override other recipes.

  " TODO: Name eache group of recipes and reset `g:sandwich#recipes` just
  " before the for-loop.
  let g:sandwich#recipes = []
  let recipes = {}

  let g:sandwich#recipes = [
        \ {
        \   'buns': ['\s\+', '\s\+'],
        \   'regex': 1, 'kind': ['delete', 'replace', 'query'],
        \   'input': [' '],
        \ },
        \ {
        \   'buns': ['', ''],
        \   'action': ['add'],
        \   'motionwise': ['line'],
        \   'linewise': 1,
        \   'input': ["\<CR>"],
        \ },
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
        \   'buns': ["`", "`"],
        \   'quoteescape': 1,
        \   'expand_range': 0,
        \   'nesting': 0,
        \   'linewise': 0,
        \ },
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
        \ {
        \   'buns': ['sandwich#magicchar#f#fname()', '")"'],
        \   'kind': ['add', 'replace'],
        \   'action': ['add'],
        \   'expr': 1, 'input': ['f'],
        \ },
        \ {
        \   'external': ["\<Plug>(textobj-sandwich-function-ip)", "\<Plug>(textobj-sandwich-function-i)"],
        \   'noremap': 0, 'kind': ['delete', 'replace', 'query'],
        \   'input': ['f'],
        \ },
        \ {
        \   'external': ["\<Plug>(textobj-sandwich-function-ap)", "\<Plug>(textobj-sandwich-function-a)"],
        \   'noremap': 0,
        \   'kind': ['delete', 'replace', 'query'],
        \   'input': ['F'],
        \ },
        \ {
        \   'buns': 'sandwich#magicchar#i#input("operator")',
        \   'kind': ['add', 'replace'],
        \   'action': ['add'],
        \   'listexpr': 1, 'input': ['i'],
        \ },
        \ {
        \   'buns': 'sandwich#magicchar#i#input("textobj", 1)',
        \   'kind': ['delete', 'replace', 'query'],
        \   'listexpr': 1, 'regex': 1, 'input': ['i'],
        \ },
        \ {
        \   'buns': 'sandwich#magicchar#i#lastinput("operator", 1)',
        \   'kind': ['add', 'replace'],
        \   'action': ['add'],
        \   'listexpr': 1, 'input': ['I'],
        \ },
        \ {
        \   'buns': 'sandwich#magicchar#i#lastinput("textobj")',
        \   'kind': ['delete', 'replace', 'query'],
        \   'listexpr': 1, 'regex': 1, 'input': ['I'],
        \ },
        \ ]

  let g:sandwich#recipes += [{
        \ 'input': ['>'],
        \ 'buns': ['\<', '\>'],
        \ 'nesting': 1,
        \ }, {
        \ 'input':  [')'],
        \ 'buns': ['\(', '\)'],
        \ 'nesting': 1,
        \ }, {
        \ 'input':  ['}'],
        \ 'buns': ['\{', '\}'],
        \ 'nesting': 1,
        \ }]

  " https://github.com/monaqa/dotfiles/blob/32f70b3f92d75eaab07a33f8bf28ee17927476e8/.config/nvim/plugin-settings.vim#L679-L685
  let g:sandwich#recipes += [
        \ {'buns': ['（', '）'], 'nesting': 1, 'input': ['j(', 'j)']},
        \ {'buns': ['「', '」'], 'nesting': 1, 'input': ['j[', 'j]']},
        \ {'buns': ['『', '』'], 'nesting': 1, 'input': ['j{', 'j}']},
        \ {'buns': ['【', '】'], 'nesting': 1, 'input': ['j<', 'j>']},
        \ ]

  let g:sandwich#recipes += [
        \ {
        \   'input': ['%'],
        \   'buns': ['\%(', '\)'],
        \   'nesting': 1,
        \   'filetype': ['vim'],
        \ },
        \ {
        \   'input': ['O'],
        \   'buns': ['\', '\'],
        \   'action': ['add'],
        \   'filetype': ['vim'],
        \ },
        \ {
        \   'input': ['O'],
        \   'buns': ['^\s*\\\s*$', '^\s*\\\s*$'],
        \   'regex': 1,
        \   'linewise': 1,
        \   'filetype': ['vim'],
        \ },
        \ ]

  for r in keys(recipes)
    call extend(g:sandwich#recipes, recipes[r])
  endfor
endfunction
call s:devise_recipes()
delfunction s:devise_recipes
