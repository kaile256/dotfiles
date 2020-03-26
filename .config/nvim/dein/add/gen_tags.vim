" TOML: finder.toml
" Ref: /usr/share/vim/vimfiles/plugin/gtags.vim
" Ref: /usr/share/gtags/FAQ

" Auto-Generate Tags
let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_auto_gen = 0
"let g:gen_tags#ctags_auto_update = 0 " update on every BufWrite
let g:gen_tags#gtags_auto_update = 0

"let g:gen_tags#statusline = 1
"let g:gen_tags#verbose = 0

"let g:gen_tags#ctags_prune = 1  " 0: Recommended
"let g:gen_tags#blacklist = []

" Location of Tags-Cache
" 0: caches tags on SCM-Repo, i.e., on [.git,.hg,.svn]/tags_dir.
" 1: caches tags on expand(g:gen_tags#cache_dir) ($HOME/.cache/gen_tags as default)
let g:gen_tags#use_cache_dir = 0
"let g:gen_tags#cache_dir = ''

" No Default Map
let g:gen_tags#gtags_default_map = 0

"" Find; the Definition
"nnoremap <silent> gd :cs find g <C-R>=expand('<cword>')<CR><CR>
"" Find; the Function Calling this function.
"nnoremap <silent> gd :cs find c <C-R>=expand('<cword>')<CR><CR>
"" FInd; the Called Funciton
"nnoremap <silent> gd :cs find d <C-R>=expand('<cword>')<CR><CR>
"" to the File
"nnoremap <silent> gf :cs find f <C-R>=expand('<cfile>')<CR><CR>
"" Egrep
""nnoremap <silent> gd :cs find e <C-R>=expand('<cword>')<CR><CR>
"" Find; #including
""nnoremap <silent> gd :cs find i <C-R>=expand('<cfile>')<CR><CR>
"" Find; C Symbol
""nnoremap <silent> gd :cs find s <C-R>=expand('<cword>')<CR><CR>
"" Find; Text String
""nnoremap <silent> gd :cs find t <C-R>=expand('<cword>')<CR><CR>

"""" KEYMAP
""" Optional Tags-Generate
"nnoremap <a-c> :GenCtags<cr>
"nnoremap <space>ct :GenCtags<cr>
"nnoremap <a-g> :GenGTAGS<cr>
"nnoremap <space>gt :GenGTAGS<cr>

augroup Gen_tagsMyConf
  au!
  "au User GenTags#CtagsLoaded
  "au User GenTags#GtagsLoaded nnoremap gd <c-]>
augroup END
