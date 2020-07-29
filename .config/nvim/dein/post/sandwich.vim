" From: operator.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich
" Another: add/sandwich.vim
" Another: source/sandwich.vim

" Note: b:sandwich_recipes is also available
" Note: g:sandwich#recipes must be defined after g:sandwich#default_recipes has
" been defined in the plugin; otherwise, the recipes on this file would be only
" available.

" Notice: let g:sandwich#recipes = get(g:, 'sandwich#default_recipes', [])
" fails to get g:sandwich#default_recipes. The cause is unclear.
if !exists('g:sandwich#default_recipes') | finish | endif
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

let g:sandwich#recipes += [{
      \ 'input': ['\"'],
      \ 'buns': ['\"', '\"'],
      \ 'nesting': 1,
      \ 'kind': ['add', 'delete', 'replace', 'textobj'],
      \ }, {
      \ 'input': ['\(', '\)'],
      \ 'buns': ['\(', '\)'],
      \ 'nesting': 1,
      \ 'kind': ['add', 'delete', 'replace', 'textobj'],
      \ }, {
      \ 'input': ['\[', '\]'],
      \ 'buns': ['\[', '\]'],
      \ 'nesting': 1,
      \ 'kind': ['add', 'delete', 'replace', 'textobj'],
      \ }]

let g:sandwich#recipes += [{
      \ 'input': ['>'],
      \ 'buns': ['>', '<'],
      \ 'nesting': 1,
      \ 'kind': ['replace', 'textobj'],
      \ }, {
      \ 'input':  [')'],
      \ 'buns': [')', '('],
      \ 'nesting': 1,
      \ 'kind': ['replace', 'textobj'],
      \ }, {
      \ 'input':  ['}'],
      \ 'buns': ['}', '{'],
      \ 'nesting': 1,
      \ 'kind': ['replace', 'textobj'],
      \ }]

let g:sandwich#recipes += [{
      \ 'input': ['>'],
      \ 'buns': ['>[,; \t]*', '<'],
      \ 'regex': 1,
      \ 'nesting': 1,
      \ 'kind': ['delete'],
      \ }, {
      \ 'input':  [')'],
      \ 'buns': [')[,; \t]*', '('],
      \ 'regex': 1,
      \ 'nesting': 1,
      \ 'kind': ['delete'],
      \ }, {
      \ 'input':  ['}'],
      \ 'buns': ['}[,; \t]*', '{'],
      \ 'regex': 1,
      \ 'nesting': 1,
      \ 'kind': ['delete'],
      \ }]

" https://github.com/monaqa/dotfiles/blob/32f70b3f92d75eaab07a33f8bf28ee17927476e8/.config/nvim/plugin-settings.vim#L679-L685
let g:sandwich#recipes += [
      \ {'buns': ['（', '）'], 'nesting': 1, 'input': ['j(', 'j)', 'jp']},
      \ {'buns': ['「', '」'], 'nesting': 1, 'input': ['j[', 'j]', 'jb']},
      \ {'buns': ['『', '』'], 'nesting': 1, 'input': ['j{', 'j}', 'jB']},
      \ {'buns': ['【', '】'], 'nesting': 1, 'input': ['j<', 'j>', 'jk']},
      \ ]
