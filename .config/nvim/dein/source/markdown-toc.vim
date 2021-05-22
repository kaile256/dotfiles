" From: markdown.toml
" Repo: mzlogin/vim-markdown-toc
" Another: add/markdown-toc.vim

"let g:vmt_auto_update_on_save = 0

" let g:vmt_include_headings_before = 1

" list_item_char: one of ['*', '-', '+'] (default: '*')
let g:vmt_list_item_char = '-'

" At the indent level, change head marker of TOC in cycle of ['*', '-', '+']
let g:vmt_cycle_list_item_markers = 1

" Fence, i.e., style of <!-- foo --> {{{1
" insert_fence: i.e., <!-- vim-markdown-toc -->; no effect on actual parse
let g:vmt_dont_insert_fence = 1

" hidden_markdown_style:
"   (available: one of ['GFM', 'Redcarpet', 'GitLab', 'Marked'])
"   (default: '')
let g:vmt_fence_hidden_markdown_style = ''

" let g:vmt_fence_text = 'TOC' and let g:vmt_fence_closing_text = '/TOC' will
" make
"   <!-- TOC -->
"   [TOC]
"   <!-- /TOC -->
" fence_text: (default: "vim-markdown-toc")
let g:vmt_fence_text = 'TOC'
" closing_text: Inner text in fence mark (default: g:vmt_fence_text)
let g:vmt_fence_closing_text = '/TOC'

