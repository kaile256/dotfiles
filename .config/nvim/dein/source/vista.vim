scriptencoding utf-8
" TOML: browse.toml
" Repo: liuchengxu/vista.vim
" Another: add/vista.vim

let g:vista_highlight_whole_line = 1

"let g:vista_default_executive = 'ctags'
"let g:vista_fzf_preview = ['right:50%']

let g:vista_echo_cursor = 0
let g:vista_cursor_delay = 500
let g:vista_floating_delay = 0

let g:vista_fold_toggle_icons = ['-', '*']
" let g:vista_icon_indent = ['', '']

" let g:vista_sidebar_position = 'vertical botright'
let g:vista_sidebar_width = 40

"let g:vista_executive_for = {
"      \ }

"let g:vista_fzf_preview = ['right:50%']

let g:vista#renderer#enable_icon = 1

let g:vista#renderer#icons = {
      \ 'augroup':        "\ufb44",
      \ 'class':          "\uf0e8",
      \ 'const':          "\uf8ff",
      \ 'constant':       "\uf8ff",
      \
      \ 'default':        "\uf29c",
      \
      \ 'enum':           "\uf702",
      \ 'enumerator':     "\uf702",
      \
      \ 'field':          "\uf30b",
      \ 'fields':         "\uf30b",
      \
      \ 'func':           'f:',
      \ 'function':       'f:',
      \ 'functions':      'f:',
      \
      \ 'implementation': "\uf776",
      \ 'interface':      "\uf7fe",
      \
      \ 'macro':          "\uf8a3",
      \ 'macros':         "\uf8a3",
      \ 'map':            "\ufb44",
      \
      \ 'member':         "\uf02b",
      \ 'method':         "\uf6a6",
      \
      \ 'module':         "\uf136",
      \ 'modules':        "\uf136",
      \
      \ 'namespace':      "\uf475",
      \
      \ 'package':        "\ue612",
      \ 'packages':       "\ue612",
      \
      \ 'property':       "\ufab6",
      \ 'struct':         "\uf318",
      \ 'subroutine':     "\uf9af",
      \ 'target':         "\uf893",
      \
      \ 'type':           "\uf7fd",
      \ 'typeParameter':  "\uf278",
      \ 'typedef':        "\uf7fd",
      \ 'types':          "\uf7fd",
      \
      \ 'union':          "\ufacd",
      \
      \ 'var':            'v.',
      \ 'variable':       'v.',
      \ 'variables':      'v.',
      \ }

