"""" From: 'tool.toml'

"""" session
""" CONFIG
let g:session_directory = '~/.local/share/nvim/session'

augroup DeniteSession
  au! FileType denite nnoremap ss :Denite session<cr>
augroup END
