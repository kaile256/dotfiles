" From: insert.toml
" Repo: Shougo/neosnippet.vim
" Another: add/neosnippet.vim
" Snip: Shougo/neosnippet-snippets/neosnippets

runtime once/smaps.vim

augroup myNeoSnippetSource
  if exists('#myNeoSnippetSource') | au! myNeoSnippetSource
  endif
  "au FileType neosnippet setl fdm=indent
  au FileType neosnippet setl keywordprg=:help
  au BufWritePre * NeoSnippetClearMarkers
augroup END

let g:neosnippet#enable_auto_clear_markers = 0

" merge snippets to my fork of neosnippet-snippets/neosnippets
let g:neosnippet#snippets_directory = [
      \ g:dein_github_dir .'/Shougo/neosnippet-snippets/neosnippets',
      \ ]
      "\ g:nvim_data_home .'/neosnippet',

let g:neosnippet#disable_runtime_snippets = {
      \ '_': 1,
      \ }

" let g:neosnippet#enable_snipmate_compatibility = 1

" " enable prototype functions
" let g:neosnippet#enable_completed_snippet = 1

" Note: prevents keymaps while popup menu is visible.
" Note: On CompletDone, expand next snippet automatically.
"   Addition to that, disable manual expansion.
"let g:neosnippet#enable_complete_done = 1

let g:neosnippet#scope_aliases = {
      \ 'ruby': 'ruby,ruby-rails',
      \ 'json': 'json,jsonc',
      \ }
