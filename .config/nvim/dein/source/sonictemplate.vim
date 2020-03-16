" TOML: insert.toml
" Repo: mattn/vim-sonictemplate
" Another: add/sonictemplate.vim
" Else: data/sonictemplate

let g:sonictemplate_vim_template_dir = [
      \ expand('$XDG_CONFIG_HOME/nvim/data/sonictemplate'),
      \ ]

" expand in {{_input_:var}}; when var is unset, prompt ask an input for it
let g:sonictemplate_vim_vars = {}
let g:sonictemplate_vim_vars['_'] = {
      \ 'author': 'kaile256',
      \ }
