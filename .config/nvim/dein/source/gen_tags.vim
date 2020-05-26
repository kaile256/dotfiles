" TOML: browse.toml
" Repo: jsfaint/gen_tags.vim

" let g:gen_tags#ctags_auto_gen = 1
" let g:gen_tags#gtags_auto_gen = 1
let g:gen_tags#ctags_auto_update = 0
" let g:gen_tags#gtags_auto_update = 0

let g:gen_tags#statusline = 0
let g:gen_tags#verbose = 1

"let g:gen_tags#ctags_prune = 1  " 0: Recommended
"let g:gen_tags#blacklist = []

let g:gen_tags#gtags_default_map = 0

" Location of Tags-Cache
" 0: caches tags on SCM-Repo, i.e., on [.git,.hg,.svn]/tags_dir.
" 1: caches tags on expand(g:gen_tags#cache_dir) ($HOME/.cache/gen_tags as default)
let g:gen_tags#use_cache_dir = 1
" let g:gen_tags#cache_dir = '' " default: '$HOME/.cache/tags_dir/'

