# vim-spell-temporary

vim-spell-temporary allows us temporary spell check

## Installation

Install the plugin using your favorite package manager

### For dein.vim

```vim
call dein#add('kaile256/vim-spell-temporary')
```

If you set up dein to manage plugins in TOML,

```toml
[[plugin]]
repo = 'kaile256/vim-spell-temporary'
```

## Usage

Here is the default keymaps:

```vim
imap <c-x>s     <Plug>(spellTMP-suggestion)
" <c-s> could stop any output to screen in Linux terminal up to the config;
you will solve it typing <c-q> anyway.
imap <c-x><c-s> <Plug>(spellTMP-suggestion)
" `gs` is an alias to `:sleep` in Vim as default. For more detail, `:help gs`
nmap gs         <Plug>(spellTMP-suggestion)
xmap gs         <Plug>(spellTMP-suggestion)
```

### NOTICE

The keymap, `<Plug>(spellTMP-suggestion)`,
could sometimes surprise you at the cursor motion
though this plugin tries to reduce the cases.

However, this motion is in the specification of Vim.
For detail, `:help i_CTRL-X_s`

## License

MIT
