# vim-symbolic-incrementor

vim-symbolic-incrementor increments symbol indentifier,
searching though current line.

This plugin increment/decrement when isolated character is found,
while default `<C-x>`/`<C-a>` (with `&nrformats` which included 'alpha')
increments/decrements the first character
that found from cursor position in current line.

Target will be searched for through current line as the priority:

1. any number or an isolated character **forward** from cursor position
2. any number or an isolated character **backward** from cursor position

Some ignored character list:

- Escaped alphabet (e.g., "\d") will be ignore
  unless the cursor is just on the alphabet.

- Modifier like `C` in `<C-x>`, `A` in `<A-j>`

- Prefix for variables scope of Vimscript like g:, s:, l:

## Use case

Take the following line:

```cpp
TODO
```

## Installation

Install the plugin using your favorite package manager

### For dein.vim

```vim
call dein#add('kaile256/symbolic-incrementor')
```

```toml
[[plugin]]
repo = 'kaile256/symbolic-incrementor'
```

This is recommended in lazy load:

```toml
[[plugin]]
repo = 'kaile256/vim-symbolic-incrementor'
on_map {n = '<Plug>(symbolicInc-'}
on_func = 'symbolicInc#'
```

### Examples

TODO
