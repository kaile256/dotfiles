" TOML: browse.toml
" Repo: kevinhwang91/rnvimr
" Another: add/rnvimr.vim

" let g:rnvimr_enable_ex = 1 " replace Netrw with this plugin
let g:rnvimr_enable_picker = 1 " hide Ranger after picking a file

let s:percent_row = 5
let s:percent_height = 85
let s:percent_col = 5
let s:percent_width = 100 - s:percent_col

" Note: restart Neovim or reload the plugin to update the layout config.
let g:rnvimr_layout = {
      \ 'relative': 'editor',
      \ 'style':    'minimal',
      \ 'col':      float2nr(round(&lines   * s:percent_row    / 100)),
      \ 'row':      float2nr(round(&columns * s:percent_col    / 100)),
      \ 'width':    float2nr(round(&columns * s:percent_width  / 100)),
      \ 'height':   float2nr(round(&lines   * s:percent_height / 100)),
      \ }
unlet s:percent_row s:percent_col s:percent_width s:percent_height
