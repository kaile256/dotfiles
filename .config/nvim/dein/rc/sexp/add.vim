" TOML: textobj.toml
" Repo: guns/vim-sexp

let g:sexp_filetypes = ''
let g:sexp_enable_insert_mode_mappings = 0

omap is <Plug>(sexp_inner_string)
omap as <Plug>(sexp_outer_string)
xmap is <Plug>(sexp_inner_string)
xmap as <Plug>(sexp_outer_string)

augroup mySexpMappings
  au FileType clojure,scheme,lisp,timl omap im <Plug>(sexp_inner_list)
  au FileType clojure,scheme,lisp,timl omap im <Plug>(sexp_inner_list)
  au FileType clojure,scheme,lisp,timl omap iM <Plug>(sexp_inner_top_list)
  au FileType clojure,scheme,lisp,timl omap iM <Plug>(sexp_inner_top_list)
augroup END
