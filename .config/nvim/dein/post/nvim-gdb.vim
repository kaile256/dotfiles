" From: debug.toml
" Repo: sakhnik/nvim-gdb
" Another: source/nvim-gdb.vim

command! -bar -nargs=? GdbWrap
      \ :exe has_key(s:ft2gdb, &ft)
      \   ? s:ft2gdb[&ft]
      \   : 'echoerr "NvimGdb: no config to this filetype"'

command! -bar -nargs=? LldbStart
      \ :exe 'GdbStartLLDB lldb' (<q-args> ==# '' ? 'a.out' : <q-args>)

let s:ft2gdb = {
      \ 'bash':   'GdbStartBashDB bashdb main.sh',
      \ 'c':      'GdbStartLLDB lldb a.out',
      \ 'cpp':    'GdbStart gdb -q a.out',
      \ 'python': 'GdbStartPDB python -m pdb main.py',
      \ 'rust':   'GdbStartLLDB lldb a.out',
      \ }

