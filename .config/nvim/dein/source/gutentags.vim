" From: browse.toml
" Repo: ludovicchabant/vim-gutentags

let g:gutentags_cache_dir = $XDG_CACHE_HOME .'/gutentags'

" prevents Gutentags from loading at all so that you have to
" `:source plugin/gutentags.vim` with `g:gutentags_dont_load = 0` on demand;
" if g:gutentags_enabled = 0 but g:gutentags_dont_load = 1, load the plugin but
" prevent to run some functions completely.
"let g:gutentags_dont_load = 1

" on BufWritePost, update tags in the list of g:gutentags_modules
" Available: ctags, cscope, gtags_cscope
"   cscope: generate a code database file using `cscope`
"   gtags_cscope: generate a code database file using `gtags`
" Default: ['ctags']
let g:gutentags_modules = ['ctags', 'gtags_cscope']
