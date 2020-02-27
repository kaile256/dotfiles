" From: insert.toml
" Repo: Shougo/neosnippet.vim
" Another: add/neosnippet.vim
" Snip: Shougo/neosnippet-snippets/neosnippets

augroup myNeoSnippetSource
  au!
  au FileType neosnippet setl fdm=indent
  "au InsertLeave * NeoSnippetClearMarkers
augroup END

" merge snippets to my fork of neosnippet-snippets/neosnippets
let g:neosnippet#snippets_directory = [
      \ g:dein_github_dir .'/Shougo/neosnippet-snippets/neosnippets',
      \ g:nvim_data_home .'/neosnippet',
      \ ]

"let g:neosnippet#disable_runtime_snippets = 1

"let g:neosnippet#enable_snipmate_compatibility = 1

"let g:neosnippet#enable_completed_snippet = 1
