" TOML: insert.toml
" Repo: SirVer/ultisnips
" Another: add/ultisnips.vim

hi! link snipLeadingSpaces NonText

let g:UltiSnipsEditSplit = 'context'

let g:UltiSnipsSnippetDirectories = [
      \ $XDG_CONFIG_HOME .'/nvim/data/ultisnips',
      \ ]

let g:UltiSnipsRemoveSelectModeMappings = 0

" TODO: disable all the mappings through variables
"let g:UltiSnipsExpandTrigger       = '<c-\>'
"let g:UltiSnipsListSnippets        = '<c-tab>'
"let g:UltiSnipsJumpForwardTrigger  = '<c-n>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-p>'

augroup myUltisnipsSo
  if exists('myUltisnipsSo') | au! myUltisnipsSo
  endif
  " Note: neosnippet could override default ft.
  au FileType neosnippet
        \ if expand('%:e') ==# 'snippets' | setl ft=snippets | endif
augroup END
