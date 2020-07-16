" TOML: insert.toml
" Repo: mattn/vim-sonictemplate
" Another: add/sonictemplate.vim
" Else: data/sonictemplate

" Note: if empty, this plugin will map to <C-y> as the prefix.
let g:sonictemplate_key = '<Plug>(nop)' " prefix to expand emplates
let g:sonictemplate_intelligent_key = '<Plug>(nop)'
let g:sonictemplate_postfix_key = '<Plug>(nop)'

let g:sonictemplate_vim_template_dir = [
      \ expand('$VIM_ANOTHER_HOME/sonictemplate'),
      \ ]

" expand in {{_input_:var}}; when var is unset, prompt ask an input for it
let g:sonictemplate_vim_vars = {}
let g:sonictemplate_vim_vars['_'] = {
      \ 'author': 'kaile256',
      \ }
