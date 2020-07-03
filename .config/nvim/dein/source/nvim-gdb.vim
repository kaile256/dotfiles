" From: debug.toml
" Repo: sakhnik/nvim-gdb
" Another: post/nvim-gdb.vim

let g:nvimgdb_disable_start_keymaps = 1

let g:nvimgdb_config_override = {}

" nvimgdb_config maps to tmaps.
let g:nvimgdb_config_override = {
      \ 'key_framedown':  '<C-n>',
      \ 'key_frameup':    '<C-p>',
      \ 'key_next':       '<A-n>',
      \
      \ 'key_breakpoint': '<A-b>',
      \ 'key_continue':   '<A-c>',
      \ 'key_eval':       '<A-x>',
      \
      \ 'key_finish':     '<A-f>',
      \ 'key_quit':       '<A-q>',
      \ 'key_step':       '<A-s>',
      \ 'key_until':      '<A-t>',
      \ }

let g:nvimgdb_config_override['codewin_command'] = 'vert top new'

let g:nvimgdb_config_override['sign_breakpoint'] = [
      \ '❶', '❷', '❸', '❹', '❺', '❻', '❼', '❽', '❾'
      \ ]
