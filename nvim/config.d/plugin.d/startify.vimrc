"""" Memo: startify.org
"""" From: 'Prime.toml'

colo molokai

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_session_dir = '~/.local/share/nvim/session'

""" Session
augroup AutoSaveSession
  " !: overwrite existing session.
  au! VimLeavePre * SSave! 'LastSession.vim'
augroup END

"""" KEYMAP
nnoremap <space>ss :<c-u>SSave <c-i>
nnoremap <space>sl :<c-u>SLoad <c-i>
