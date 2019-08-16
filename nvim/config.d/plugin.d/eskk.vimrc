"""" From: tool.toml

"""" GENERAL
"set imdisable

let g:eskk#directory = '~/.config/nvim/config.d/data.d/eskk.d'

"""" KEYMAP
cmap <silent> <c-b> <c-u><Plug>(eskk:toggle)
cmap <silent> <c-;> <c-u>call            eskk#update_dictionary()<cr>
imap <c-;>    <Plug>(eskk:toggle)
imap <c-'>    <c-o><Plug>(eskk:save-dictionary)

