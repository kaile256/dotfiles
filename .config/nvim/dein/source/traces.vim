" TOML: default.toml
" Repo: markonm/traces.vim

if exists('&inccommand')
  " No compatible for this plugin.
  set inccommand=
endif

" let g:traces_preserve_view_state = 1
" let g:traces_num_range_preview = 1

hi! link TracesSearch  Search
hi! link TracesReplace HighlightedYankRegion
