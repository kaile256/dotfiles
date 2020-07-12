scriptencoding utf-8
" TOML: browse.toml
" Repo: liuchengxu/vista.vim
" Another: add/vista.vim

let g:vista_highlight_whole_line = 1

"let g:vista_default_executive = 'ctags'
"let g:vista_fzf_preview = ['right:50%']

let g:vista_echo_cursor = 0
let g:vista_cursor_delay = 1000
let g:vista_update_on_text_changed_delay = 1000
let g:vista_floating_delay = 0

let g:vista_fold_toggle_icons = ['-', '*']
" let g:vista_icon_indent = ['', '']

" let g:vista_sidebar_position = 'vertical botright'
let g:vista_sidebar_width = 40

"let g:vista_executive_for = {
"      \ }

"let g:vista_fzf_preview = ['right:50%']

let g:vista#renderer#enable_icon = 1

let g:vista_default_executive = 'coc'

let g:vista_executive_for = {
      \ 'vimwiki': 'markdown',
      \ 'pandoc': 'markdown',
      \ 'markdown': 'toc',
      \ }
