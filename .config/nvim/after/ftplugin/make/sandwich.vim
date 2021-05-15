if !dein#tap('vim-sandwich') | finish | endif

let b:sandwich_recipes = [
      \ {
      \   'buns': ['$(\h\w*\s*', ')'],
      \   'nesting': 1,
      \   'regex': 1,
      \   'action': ['delete'],
      \   'input': ['f'],
      \ },
      \ ]
