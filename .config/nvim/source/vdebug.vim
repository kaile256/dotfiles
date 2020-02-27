" From: debug.toml
" Repo: vim-debug/vdebug

" Ref: https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc
"   to use with chrome-browser

let g:vdebug_options= {
      \ 'port': 9000,
      \ 'server': '',
      \ 'timeout': 20,
      \
      \ 'on_close': 'detach',
      \ 'break_on_open': 1,
      \
      \ 'ide_key': '',
      \ 'debug_window_level': 0,
      \ 'debug_file_level': 0,
      \ 'debug_file': '',
      \
      \ 'watch_window_style': 'expanded',
      \
      \ 'marker_default': '⬦',
      \ 'marker_closed_tree': '▸',
      \ 'marker_open_tree': '▾',
      \
      \ 'path_maps': {},
      \ }

"let g:vdebug_options.path_maps = {
"      \ '/path/to/server/scripts': '/path/to/local/scripts',
"      \ }

let g:vdebug_keymap = {
      \ 'run':               '<F5>',
      \ 'run_to_cursor':     '<F9>',
      \ 'step_over':         '<F2>',
      \ 'step_into':         '<F3>',
      \ 'step_out':          '<F4>',
      \ 'close':             '<F6>',
      \ 'detach':            '<F7>',
      \ 'set_breakpoint':    '<F10>',
      \ 'get_context':       '<F11>',
      \ 'eval_under_cursor': '<F12>',
      \ 'eval_visual':       '<Leader>e',
      \ }
