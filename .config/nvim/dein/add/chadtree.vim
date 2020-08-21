" TOML: browse.toml
" Repo: ms-jpq/chadtree

" Note: it's unnecessary to fill all the config keys.

" let g:chadtree_view = {
"      \ 'time_format': '%m-%d-%Y %H:%M',
"      \ } " see config/view.json

let g:chadtree_ignores = {
      \ 'name': [],
      \ } " See ms-jpq/chadtree/config/ignore.json

let g:chadtree_colours = {} " ms-jpq/chadtree/config/colours.json

let g:chadtree_settings = {}

let g:chadtree_settings['show_hidden'] = 1
" let g:chadtree_settings['use_icons'] = 'emoji' " Available: Boolean or 'emoji'

let g:chadtree_settings['keymap'] = {
      \ 'collapse': ['zc', 'zm'],
      \ 'toggle_hidden': ['z.'],
      \
      \ 'select': ['mm'],
      \ 'clear_select': ['mc'],
      \
      \ 'h_split': ['o'],
      \ 'v_split': ['O'],
      \
      \ 'open_sys': ['gX'],
      \
      \ 'copy_name': ['y'],
      \
      \ 'new': ['cf'],
      \ 'rename': ['cw'],
      \
      \ 'trash': ['D'],
      \ 'delete': ['\D'],
      \
      \ 'copy': ['P'],
      \
      \ 'refresh': ['R'],
      \
      \ 'stat': ['<C-g>'],
      \ } " See ms-jpq/chadtree/config/config.json

let g:chadtree_settings['keymap']['cut'] = ['dd'] " register selected items to move
let g:chadtree_settings['keymap']['jump_to_current'] = ['<C-o>'] " Set cursor to last visited file.
let g:chadtree_settings['keymap']['change_focus'] = ['<C-n>']
let g:chadtree_settings['keymap']['change_focus_up'] = ['<C-p>']

let g:chadtree_settings['keymap']['primary'] = ['<CR>'] " open, or toggle folder
let g:chadtree_settings['keymap']['secondary'] = ['p', 'zo', 'zr'] " preview, or toggle folder
let g:chadtree_settings['keymap']['teritiary'] = ['go'] " tabe, or toggle folder
