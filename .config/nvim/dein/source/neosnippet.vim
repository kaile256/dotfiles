" From: insert.toml
" Repo: Shougo/neosnippet.vim
" Another: add/neosnippet.vim
" Snip: Shougo/neosnippet-snippets/neosnippets

runtime once/smaps.vim

augroup myNeoSnippetSource
  " Note: 'modelines' is always set global.
  au FileType neosnippet setlocal modelines=1
  au FileType neosnippet setlocal keywordprg=:help
  au BufWritePre * NeoSnippetClearMarkers
augroup END

let g:neosnippet#enable_auto_clear_markers = 0

" merge snippets to my fork of neosnippet-snippets/neosnippets
let g:neosnippet#snippets_directory = [
      \ expand('$DEIN_GITHUB_DIR/Shougo/neosnippet-snippets/neosnippets'),
      \ expand('$VIM_CONFIG_HOME/neosnippet'),
      \ ]

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
