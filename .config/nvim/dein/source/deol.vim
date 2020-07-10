scriptencoding utf-8
" TOML: shell.toml
" Repo: Shougo/deol.nvim
" Another: add/deol.vim

let g:deol#prompt_pattern = '❯ \|❯$' " which's to detect where to insert.
let g:deol#shell_history_path = $XDG_DATA_HOME .'/deol'

if exists('terminal')
  let g:deol#extra_options
endif


