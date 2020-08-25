" From: appearance.toml
" Repo: wellle/context.vim
" Another: add/context.vim
" Another: post/context.vim

let g:context_add_mappings = 0
" default: 21
" omit excessive lines by ellipsis, '...'.
let g:context_max_height = 4
" let g:context_ellipsis_char = '.' " default: '·'

let g:context_highlight_border = '<hide>' " Or set highlight name to link.

let g:context_filetype_blacklist = [
      \ 'fugitive',
      \ 'git',
      \ 'gitcommit',
      \ ]
