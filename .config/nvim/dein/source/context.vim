" From: appearance.toml
" Repo: wellle/context.vim
" Another: add/context.vim
" Another: post/context.vim

" let g:context_presenter = 'preview' " default: nvim-float or vim-popup

" default: 21
" omit excessive lines by ellipsis, '...'.
let g:context_max_height = 4
" let g:context_ellipsis_char = '.' " default: '·'

let g:context_highlight_border = '<hide>' " Or set highlight name to link.
" let g:context_highlight_border = 'Special'

let g:context_filetype_blacklist = [
      \ 'defx',
      \ 'fugitive',
      \ 'git',
      \ 'gitcommit',
      \ ]
