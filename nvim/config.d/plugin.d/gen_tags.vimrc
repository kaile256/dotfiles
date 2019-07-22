"# Listed on 'lazy.toml'
"
"""" CONFIG
"" Auto-Generate Tags
let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_auto_gen = 1

"" Location of Tags-Cache
" 0: on SCM-Repo, cache tags on [.git,.hg,.svn]/tags_dir;
"    not on, cache tags on expand('g:gen_tags#cache_dir').
""let g:gen_tags#use_cache_dir = 0

"" No Default Map
let g:gen_tags#gtags_default_map = 0

"""" KEYMAP
""" Optional Tags-Generate
"nnoremap <a-c> :GenCtags<cr>
"nnoremap <space>ct :GenCtags<cr>
"nnoremap <a-g> :GenGTAGS<cr>
"nnoremap <space>gt :GenGTAGS<cr>
