# vim-toml-fold

Fold expression for toml-like files
in which tables or sections are denoted by `[table]` markers.

## Installation

vim-toml-fold is compatible with all major plugin managers.
To install it with [dein][] in toml, add

```toml
[[plugin]]
repo  = 'kaile256/vim-toml-fold'
on_ft = ['toml', 'dosini', 'config', 'desktop', 'cfg', 'gitconfig']
```

to your toml file which you set in `dein#load_toml()` like

```vim
`dein#load_toml('/path/to/your-toml', {'lazy': 1})`
```

## Customize

### Fold Styles

You can customize the values like below:

```vim
" default: 1 for all the filetypes written the dictionary below
let g:tomlfold#styles_on_filetype = {
            \ 'cfg':       0,
            \ 'config':    1,
            \ 'desktop':   1,
            \ 'dosini':    3,
            \ 'gitconfig': 2,
            \ 'toml':      1,
            \ }
```

Available values are 0 to 3.
The number applies a fold-style as below:

If 0, disable toml-fold on the filetype

If 1, foldlevel is 1 at `[table]` (default)
![fold1_compressed](https://user-images.githubusercontent.com/46470475/71359819-34a76680-25d1-11ea-98d7-5386f9a17d72.gif)

If 2, foldlevel is 1 at `[table]` and 2 at the contents below
![fold2_copmressed](https://user-images.githubusercontent.com/46470475/71359820-34a76680-25d1-11ea-9719-9b346f54a14b.gif)

If 3, foldlevel is 0 at `[table]` and 1 at the contents below
![fold3_compressed](https://user-images.githubusercontent.com/46470475/71359821-353ffd00-25d1-11ea-8380-9bdddca2af4e.gif)

You can also set it buffer-locally like below

```vim
augroup myTomlFold
  " if you use dein as plugin manager in TOML, you'll like it
  au BufEnter *vim**/*.toml let b:tomlfold_enable = 3
augroup END
```

The fold-style 3 enables smoother motions than fold-style 2
especially at the motions, `zj` and `zk`.

### Ignore comment-out lines

You can ignore comment strings like #[foo] up to filetype or buffer-locally.

```vim
" the default values are 0
let g:tomlfold#ignore_commentline = {
            \   'config': 1,
            \   'dosini': 1,
            \   'toml':   1,
            \ }

" or buffer-locally (sample)
au myTomlFold BufEnter *vim**/*.toml let b:tomlfold#ignore_commentline = 1
```

## License

This plugin is licensed under MIT license.

[dein]: https://github.com/Shougo/dein.vim
