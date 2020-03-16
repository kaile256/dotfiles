# vim-option-check

vim-option-check is an instant checker for vim's options of current buffer

## Installation

Install the plugin using your favorite package manager

### For dein.vim

```vim
call dein#add('kaile256/vim-option-check')
```

## Usage

If you prefer shorter options' name:

```vim
" default: '^&'
let g:opt_check#evaluable = '^[&$]'

let s:partition = repeat('=', 40)

let g:opt_check#list = [
      \ ['&syn', '&ft', '&bt'],
      \ s:partition,
      \ 'WINDOW',
      \ ['&wfw', '&wfh'],
      \ s:partition,
      \ 'FOLD',
      \ ['&fdm', '&fde', '&fdt', '&fdl'],
      \ s:partition,
      \ 'FORMAT',
      \ ['&tw', '&fo'],
      \ s:partition,
      \ 'CONCEAL',
      \ ['&cole', '&cocu'],
      \ s:partition,
      \ 'PATH',
      \ '&path',
      \ s:partition,
      \ 'DEFAULT EDITOR',
      \ ['$EDITOR', '$VISUAL', '$SUDO_EDITOR'],
      \ ]
```
