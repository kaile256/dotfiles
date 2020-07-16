" From: operator.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich
" Another: add/sandwich.vim

hi! OperatorSandwichAdd    cterm=reverse gui=reverse ctermfg=142 guifg=#b8bb26
hi! OperatorSandwichChange cterm=reverse gui=reverse ctermfg=108 guifg=#8ec07c
hi! OperatorSandwichDelete cterm=reverse gui=reverse ctermfg=167 guifg=#fb4934

let g:sandwich_no_default_key_mappings          = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings  = 1

"let g:operator#sandwich#timeoutlen = 500 " default: &timeoutlen (=1000ms).

" Magic Characters {{{1
" Note: magicchar-f will work like a textobj, for example, `\df` will change
"   `foo(arg)` into `arg`.
" Note: magicchar-t works only on header, not on footer
" Note: b:sandwich_magicchar_f_patterns is also available

augroup mySandwich-FPatternsOnFiletype
  au!
  au FileType vim let b:sandwich_magicchar_f_patterns = [{
        \ 'header' : '\<\h[a-zA-Z0-9_:]*',
        \ 'bra'    : '(',
        \ 'ket'    : ')',
        \ 'footer' : '',
        \ }]
augroup END

" Let; Recipes of sandwich {{{1
" Note: b:sandwich_recipes is also available
let g:sandwich#default_recipes = get(g:, 'sandwich#default_recipes', [])
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [{
      \ 'input': ['>'],
      \ 'buns': ['>', '<'],
      \ 'kind': ['replace', 'textobj'],
      \ }, {
      \ 'input':  [')'],
      \ 'buns': [')*', '('],
      \ 'kind': ['replace', 'textobj'],
      \ }, {
      \ 'input':  ['}'],
      \ 'buns': ['}*', '{'],
      \ 'kind': ['replace', 'textobj'],
      \ }]

let g:sandwich#recipes += [{
      \ 'input': ['>'],
      \ 'buns': ['>[,; \t]', '<'],
      \ 'regex': 1,
      \ 'kind': ['delete'],
      \ }, {
      \ 'input':  [')'],
      \ 'buns': [')[,; \t]*', '('],
      \ 'regex': 1,
      \ 'kind': ['delete'],
      \ }, {
      \ 'input':  ['}'],
      \ 'buns': ['}[,; \t]*', '{'],
      \ 'regex': 1,
      \ 'kind': ['delete'],
      \ }]

" https://github.com/monaqa/dotfiles/blob/32f70b3f92d75eaab07a33f8bf28ee17927476e8/.config/nvim/plugin-settings.vim#L679-L685
let g:sandwich#recipes += [
      \ {'buns': ['（', '）'], 'nesting': 1, 'input': ['j(', 'j)', 'jp']},
      \ {'buns': ['「', '」'], 'nesting': 1, 'input': ['j[', 'j]', 'jb']},
      \ {'buns': ['『', '』'], 'nesting': 1, 'input': ['j{', 'j}', 'jB']},
      \ {'buns': ['【', '】'], 'nesting': 1, 'input': ['j<', 'j>', 'jk']},
      \ ]
