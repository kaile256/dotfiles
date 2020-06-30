" TOML: insert.toml
" Repo: aperezdc/vim-template
" Another: add/template.vim

let g:templates_no_autocmd = 1
let g:templates_no_builtin_templates = 1

let g:templates_directory = [
      \ expand('$VIM_CONFIG_HOME/template'),
      \ ]

" let g:templates_global_name_prefix = ''
" let g:templates_name_prefix = '' " prefix for project local template
