" From: insert.toml
" Repo: Shougo/neosnippet.vim
" Another: add/neosnippet.vim
" Snip: Shougo/neosnippet-snippets/neosnippets

if exists('#myNeoSnippetSource')
  au! myNeoSnippetSource
endif
augroup myNeoSnippetSource
  "au FileType neosnippet setl fdm=indent
  au FileType neosnippet setl keywordprg=:help
  au BufWritePre * NeoSnippetClearMarkers
augroup END

" merge snippets to my fork of neosnippet-snippets/neosnippets
let g:neosnippet#snippets_directory = [
      \ g:dein_github_dir .'/Shougo/neosnippet-snippets/neosnippets',
      \ ]
      "\ g:nvim_data_home .'/neosnippet',

"let g:neosnippet#disable_runtime_snippets = 1

let g:neosnippet#enable_snipmate_compatibility = 1

" enable prototype functions
"let g:neosnippet#enable_completed_snippet = 1

" TBC: On CompletDone, expand next snippet automatically.
"   Addition to that, disable manual expansion.
"let g:neosnippet#enable_complete_done = 1

let g:neosnippet#scope_aliases = {
      \ 'ruby': 'ruby,ruby-rails',
      \ 'json': 'json,jsonc',
      \ }
