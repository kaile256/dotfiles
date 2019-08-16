"""" From: tool.toml

"""" GENERAL
set imdisable

let g:eskk#directory = '~/.config/nvim/config.d/data.d/eskk.d'

"""" KEYMAP

tmap <silent> <c-b> <c-\><c-n>:<c-u>call eskk#enable()<cr>i
tmap <silent> <c-;> <c-\><c-n>:<c-u>call eskk#update_dictionary()<cr>i
cmap <silent> <c-b> <c-u><Plug>(eskk:enable)
cmap <silent> <c-;> <c-u>call            eskk#update_dictionary()<cr>
imap <c-b>    <Plug>(eskk:enable)
imap <c-;>    <c-o><Plug>(eskk:save-dictionary)
