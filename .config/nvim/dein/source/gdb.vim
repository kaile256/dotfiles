" From: debug.toml
" Repo: sakhnik/nvim-gdb

let g:nvimgdb_config_override = {
      \ 'key_next': 'n',
      \ 'key_step': 's',
      \ 'key_finish': 'f',
      \ 'key_continue': 'c',
      \ 'key_until': 'u',
      \ 'key_breakpoint': 'b',
      \ 'set_tkeymaps': 'NvimGdbNoTKeymaps',
      \ }

let g:loaded_nvimgdb = 1

command! -bar GdbStart
      \ :exe get(s:ft2gdb, &ft)
      \   ? s:ft2gdb[&ft]
      \   : 'echoerr "gdb: no config to this filetype"'

let s:ft2gdb = {
      \ 'c': ':GdbStart gdb -q a.out',
      \ 'cpp': ':GdbStartLLDB lldb a.out',
      \ 'rust': ':GdbStartLLDB lldb a.out',
      \ 'python': ':GdbStartPDB python -m pdb main.py',
      \ 'bash': ':GdbStartBashDB bashdb main.sh',
      \ }
